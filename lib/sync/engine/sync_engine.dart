import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../core/utils/logger.dart';
import '../../database/database.dart';
import '../../features/auth/application/providers/auth_providers.dart';
import '../conflict_resolution/conflict_resolver.dart';
import '../queue/sync_queue.dart';

class SyncEngine {
  final DatabaseService _dbService;
  final SyncQueue _syncQueue;
  final ConflictResolver _conflictResolver;
  final AppLogger _logger;
  final String? _injectedUserId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isSyncing = false;

  SyncEngine(
      this._dbService, this._syncQueue, this._conflictResolver, this._logger,
      [this._injectedUserId]);

  Isar get _isar => _dbService.isar;

  String? get _currentUserId {
    if (_injectedUserId != null &&
        _injectedUserId.trim().isNotEmpty &&
        _injectedUserId != 'local_dev_user_101') {
      return _injectedUserId;
    }
    if (_auth.currentUser?.uid != null &&
        _auth.currentUser!.uid.trim().isNotEmpty) {
      return _auth.currentUser!.uid;
    }
    return null; // NEVER return local_dev_user_101 or fallback!
  }

  /// Trigger a complete bi-directional synchronization cycle (Push then Pull)
  Future<void> syncAll() async {
    if (_isSyncing) {
      _logger.info('Sync cycle already in progress. Skipping.');
      return;
    }

    final uid = _currentUserId;
    if (uid == null) {
      _logger.warning(
          'SyncEngine: Aborting sync cycle. No verified Firebase Auth user ID available yet.');
      return;
    }

    _isSyncing = true;
    _logger.info('Starting full bi-directional sync cycle for user: $uid');

    try {
      await pushPendingMutations(uid);
      await pullRemoteUpdates(uid);
      _logger.info('Full sync cycle completed successfully.');
    } catch (e, st) {
      _logger.error('Error during full sync cycle', e, st);
    } finally {
      _isSyncing = false;
    }
  }

  /// Push all pending local mutations from Isar queue to Firestore
  Future<void> pushPendingMutations(String uid) async {
    _logger.info('Pushing pending mutations to Firestore...');
    await _syncQueue.forceRetryAll();
    final pendingMutations = await _syncQueue.peekPending();

    if (pendingMutations.isEmpty) {
      _logger.info('No pending mutations to push.');
      return;
    }

    _logger.info('Found ${pendingMutations.length} pending mutations.');

    for (final mutation in pendingMutations) {
      try {
        final collectionPath =
            _getFirestoreCollectionName(mutation.collectionType);
        final docRef =
            _firestore.collection(collectionPath).doc(mutation.entityId);

        if (mutation.mutationType == MutationType.delete) {
          _logger.info(
              'Firestore WRITE [DELETE]: $collectionPath/${mutation.entityId}');
          await docRef.delete();
          _logger.info(
              'Successfully deleted remote doc: ${mutation.entityId} from $collectionPath');
        } else {
          final Map<String, dynamic> data = jsonDecode(mutation.payloadJson);
          data['lastSyncedAt'] = FieldValue.serverTimestamp();
          data['remoteId'] = mutation.entityId;
          data['userId'] = uid;

          _logger.info(
              'Firestore WRITE [UPSERT]: $collectionPath/${mutation.entityId} | Payload keys: ${data.keys.join(", ")}');
          await docRef.set(data, SetOptions(merge: true));
          _logger.info(
              'Successfully upserted remote doc: ${mutation.entityId} in $collectionPath');
        }

        // Mark success in queue and update local entity syncStatus to synced
        await _syncQueue.markSuccess(mutation.mutationId);
        await _updateLocalEntitySyncStatus(
            mutation.collectionType, mutation.entityId, SyncStatus.synced);
      } catch (e, st) {
        _logger.error(
            'SyncEngine: FATAL ERROR pushing mutation ${mutation.mutationId} to Firestore',
            e,
            st);
        await _syncQueue.markFailed(mutation.mutationId, e.toString());
      }
    }
  }

  /// Emergency / Full Sync: Directly upload all local Isar entities to Firestore for the active user
  Future<void> pushAllLocalDataToCloud(String uid) async {
    _logger.info(
        'Initiating direct full upload of all local Isar data to Firestore for user: $uid');
    try {
      // 1. Habits
      final habits = await _isar.habitCollections.where().findAll();
      for (final item in habits) {
        final docRef = _firestore.collection('habits').doc(item.habitId);
        final data = {
          'id': item.habitId,
          'userId': uid,
          'title': item.title,
          'description': item.description,
          'frequency': item.frequency,
          'targetDays': item.targetDays,
          'targetCount': item.targetCount,
          'category': item.category,
          'colorHex': item.colorHex,
          'iconName': item.iconName,
          'streakCount': item.streakCount,
          'isCompletedToday': item.isCompletedToday,
          'progress': item.progress,
          'createdAt': item.createdAt.toIso8601String(),
          'updatedAt': item.updatedAt.toIso8601String(),
          'lastSyncedAt': FieldValue.serverTimestamp(),
        };
        _logger.info(
            'Firestore WRITE [FULL SYNC - HABIT]: habits/${item.habitId}');
        await docRef.set(data, SetOptions(merge: true));
      }
      _logger.info('Uploaded ${habits.length} habits to Firestore.');

      // 2. Tasks
      final tasks = await _isar.taskCollections.where().findAll();
      for (final item in tasks) {
        final docRef = _firestore.collection('tasks').doc(item.taskId);
        final data = {
          'id': item.taskId,
          'userId': uid,
          'projectId': item.projectId,
          'title': item.title,
          'description': item.description,
          'priority': item.priority,
          'state': item.state,
          'category': item.category,
          'tags': item.tags ?? [],
          'notes': item.notes,
          'dueDate': item.dueDate?.toIso8601String(),
          'scheduledStart': item.scheduledStart?.toIso8601String(),
          'scheduledEnd': item.scheduledEnd?.toIso8601String(),
          'estimatedDurationMinutes': item.estimatedDurationMinutes,
          'actualDurationMinutes': item.actualDurationMinutes,
          'createdAt': item.createdAt.toIso8601String(),
          'updatedAt': item.updatedAt.toIso8601String(),
          'lastSyncedAt': FieldValue.serverTimestamp(),
        };
        _logger
            .info('Firestore WRITE [FULL SYNC - TASK]: tasks/${item.taskId}');
        await docRef.set(data, SetOptions(merge: true));
      }
      _logger.info('Uploaded ${tasks.length} tasks to Firestore.');

      // 3. Projects
      final projects = await _isar.projectCollections.where().findAll();
      for (final item in projects) {
        final docRef = _firestore.collection('projects').doc(item.projectId);
        final data = {
          'id': item.projectId,
          'userId': uid,
          'name': item.title,
          'description': item.description,
          'colorHex': item.colorHex,
          'iconName': item.iconName,
          'progress': item.progress,
          'createdAt': item.createdAt.toIso8601String(),
          'updatedAt': item.updatedAt.toIso8601String(),
          'lastSyncedAt': FieldValue.serverTimestamp(),
        };
        _logger.info(
            'Firestore WRITE [FULL SYNC - PROJECT]: projects/${item.projectId}');
        await docRef.set(data, SetOptions(merge: true));
      }
      _logger.info('Uploaded ${projects.length} projects to Firestore.');

      // 4. Focus Sessions
      final focus = await _isar.focusSessionCollections.where().findAll();
      for (final item in focus) {
        final docRef =
            _firestore.collection('focus_sessions').doc(item.sessionId);
        final data = {
          'id': item.sessionId,
          'userId': uid,
          'habitId': item.habitId,
          'taskId': item.taskId,
          'startTime': item.startTime.toIso8601String(),
          'endTime': item.endTime?.toIso8601String(),
          'durationMinutes': item.durationMinutes,
          'completedMinutes': item.completedMinutes,
          'isCompleted': item.isCompleted,
          'mode': item.mode,
          'notes': item.title,
          'createdAt': item.createdAt.toIso8601String(),
          'updatedAt': item.updatedAt.toIso8601String(),
          'lastSyncedAt': FieldValue.serverTimestamp(),
        };
        _logger.info(
            'Firestore WRITE [FULL SYNC - FOCUS SESSION]: focus_sessions/${item.sessionId}');
        await docRef.set(data, SetOptions(merge: true));
      }
      _logger.info('Uploaded ${focus.length} focus sessions to Firestore.');

      // 5. Habit Completions
      final completions =
          await _isar.habitCompletionCollections.where().findAll();
      for (final item in completions) {
        final docRef =
            _firestore.collection('habit_completions').doc(item.completionId);
        final data = {
          'id': item.completionId,
          'userId': uid,
          'habitId': item.habitId,
          'completedAt': item.completedAt.toIso8601String(),
          'count': item.count,
          'createdAt': item.createdAt.toIso8601String(),
          'updatedAt': item.updatedAt.toIso8601String(),
          'lastSyncedAt': FieldValue.serverTimestamp(),
        };
        _logger.info(
            'Firestore WRITE [FULL SYNC - HABIT COMPLETION]: habit_completions/${item.completionId}');
        await docRef.set(data, SetOptions(merge: true));
      }
      _logger.info(
          'Uploaded ${completions.length} habit completions to Firestore.');
    } catch (e, st) {
      _logger.error(
          'SyncEngine: FATAL ERROR during pushAllLocalDataToCloud full sync fallback',
          e,
          st);
    }
  }

  /// Pull remote updates from Firestore and reconcile with local Isar database
  Future<void> pullRemoteUpdates(String uid) async {
    _logger.info('Pulling remote updates from Firestore...');

    await _pullCollection<HabitCollection>(
      uid: uid,
      collectionType: CollectionType.habit,
      fetchLocal: (id) =>
          _isar.habitCollections.filter().habitIdEqualTo(id).findFirst(),
      insertLocal: (data) async {
        final entry = HabitCollection()
          ..habitId = data['habitId'] ?? data['id']
          ..userId = data['userId'] ?? uid
          ..title = data['title'] ?? 'Untitled'
          ..description = data['description']
          ..frequency = data['frequency'] ?? 'daily'
          ..targetDays = (data['targetDays'] as List<dynamic>?)
                  ?.map((e) => e as int)
                  .toList() ??
              [1, 2, 3, 4, 5, 6, 7]
          ..targetCount = data['targetCount'] ?? 1
          ..category = data['category'] ?? 'Productivity'
          ..colorHex = data['colorHex'] ?? '#FF0000'
          ..iconName = data['iconName'] ?? 'self_improvement'
          ..streakCount = data['streakCount'] ?? 0
          ..isCompletedToday = data['isCompletedToday'] ?? false
          ..progress = (data['progress'] as num?)?.toDouble() ?? 0.0
          ..syncStatus = SyncStatus.synced
          ..lastSyncedAt = DateTime.now()
          ..pendingUpload = false
          ..pendingDelete = false
          ..remoteId = data['habitId'] ?? data['id']
          ..createdAt = _parseTimestamp(data['createdAt'])
          ..updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.habitCollections.put(entry);
      },
      updateLocal: (local, data) async {
        local.title = data.containsKey('title')
            ? data['title'] as String? ?? local.title
            : local.title;
        if (_hasRemoteKey(data, 'description')) {
          local.description = _getRemoteValue<String?>(data, 'description');
        }
        local.frequency = data.containsKey('frequency')
            ? data['frequency'] as String? ?? local.frequency
            : local.frequency;
        if (_hasRemoteKey(data, 'targetDays')) {
          local.targetDays =
              _getRemoteList<int>(data, 'targetDays') ?? local.targetDays;
        }
        local.targetCount = data.containsKey('targetCount')
            ? data['targetCount'] as int? ?? local.targetCount
            : local.targetCount;
        local.category = data.containsKey('category')
            ? data['category'] as String? ?? local.category
            : local.category;
        local.colorHex = data.containsKey('colorHex')
            ? data['colorHex'] as String? ?? local.colorHex
            : local.colorHex;
        local.iconName = data.containsKey('iconName')
            ? data['iconName'] as String? ?? local.iconName
            : local.iconName;
        local.streakCount = data.containsKey('streakCount')
            ? data['streakCount'] as int? ?? local.streakCount
            : local.streakCount;
        local.isCompletedToday = data.containsKey('isCompletedToday')
            ? data['isCompletedToday'] as bool? ?? local.isCompletedToday
            : local.isCompletedToday;
        local.progress = data.containsKey('progress')
            ? (data['progress'] as num?)?.toDouble() ?? local.progress
            : local.progress;
        local.syncStatus = SyncStatus.synced;
        local.lastSyncedAt = DateTime.now();
        local.pendingUpload = false;
        local.pendingDelete = false;
        local.updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.habitCollections.put(local);
      },
    );

    await _pullCollection<FocusSessionCollection>(
      uid: uid,
      collectionType: CollectionType.focusSession,
      fetchLocal: (id) => _isar.focusSessionCollections
          .filter()
          .sessionIdEqualTo(id)
          .findFirst(),
      insertLocal: (data) async {
        final entry = FocusSessionCollection()
          ..sessionId = data['sessionId'] ?? data['id']
          ..userId = data['userId'] ?? uid
          ..habitId = data['habitId']
          ..title = data['title'] ?? 'Focus Session'
          ..durationMinutes = data['durationMinutes'] ?? 25
          ..completedMinutes = data['completedMinutes'] ?? 0
          ..mode = data['mode'] ?? 'pomodoro'
          ..startTime = _parseTimestamp(data['startTime'])
          ..endTime =
              data['endTime'] != null ? _parseTimestamp(data['endTime']) : null
          ..isCompleted = data['isCompleted'] ?? false
          ..syncStatus = SyncStatus.synced
          ..lastSyncedAt = DateTime.now()
          ..pendingUpload = false
          ..pendingDelete = false
          ..remoteId = data['sessionId'] ?? data['id']
          ..createdAt = _parseTimestamp(data['createdAt'])
          ..updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.focusSessionCollections.put(entry);
      },
      updateLocal: (local, data) async {
        local.title = data.containsKey('title')
            ? data['title'] as String? ?? local.title
            : local.title;
        local.durationMinutes = data.containsKey('durationMinutes')
            ? data['durationMinutes'] as int? ?? local.durationMinutes
            : local.durationMinutes;
        local.completedMinutes = data.containsKey('completedMinutes')
            ? data['completedMinutes'] as int? ?? local.completedMinutes
            : local.completedMinutes;
        local.mode = data.containsKey('mode')
            ? data['mode'] as String? ?? local.mode
            : local.mode;
        local.startTime = data.containsKey('startTime')
            ? _parseTimestamp(data['startTime'])
            : local.startTime;
        local.endTime = data.containsKey('endTime')
            ? (data['endTime'] != null
                ? _parseTimestamp(data['endTime'])
                : null)
            : local.endTime;
        local.isCompleted = data.containsKey('isCompleted')
            ? data['isCompleted'] as bool? ?? local.isCompleted
            : local.isCompleted;
        local.syncStatus = SyncStatus.synced;
        local.lastSyncedAt = DateTime.now();
        local.pendingUpload = false;
        local.pendingDelete = false;
        local.updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.focusSessionCollections.put(local);
      },
    );

    await _pullCollection<UserSettingsCollection>(
      uid: uid,
      collectionType: CollectionType.userSettings,
      fetchLocal: (id) =>
          _isar.userSettingsCollections.filter().userIdEqualTo(id).findFirst(),
      insertLocal: (data) async {
        final entry = UserSettingsCollection()
          ..userId = data['userId'] ?? uid
          ..isDarkMode = data['isDarkMode'] ?? true
          ..notificationsEnabled = data['notificationsEnabled'] ?? true
          ..pomodoroLengthMinutes = data['pomodoroLengthMinutes'] ?? 25
          ..shortBreakLengthMinutes = data['shortBreakLengthMinutes'] ?? 5
          ..longBreakLengthMinutes = data['longBreakLengthMinutes'] ?? 15
          ..themePrimaryColorHex = data['themePrimaryColorHex'] ?? '#FF0000'
          ..soundEffectsEnabled = data['soundEffectsEnabled'] ?? true
          ..syncStatus = SyncStatus.synced
          ..lastSyncedAt = DateTime.now()
          ..pendingUpload = false
          ..pendingDelete = false
          ..remoteId = data['userId'] ?? uid
          ..createdAt = _parseTimestamp(data['createdAt'])
          ..updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.userSettingsCollections.put(entry);
      },
      updateLocal: (local, data) async {
        local.isDarkMode = data.containsKey('isDarkMode')
            ? data['isDarkMode'] as bool? ?? local.isDarkMode
            : local.isDarkMode;
        local.notificationsEnabled = data.containsKey('notificationsEnabled')
            ? data['notificationsEnabled'] as bool? ??
                local.notificationsEnabled
            : local.notificationsEnabled;
        local.pomodoroLengthMinutes = data.containsKey('pomodoroLengthMinutes')
            ? data['pomodoroLengthMinutes'] as int? ??
                local.pomodoroLengthMinutes
            : local.pomodoroLengthMinutes;
        local.shortBreakLengthMinutes =
            data.containsKey('shortBreakLengthMinutes')
                ? data['shortBreakLengthMinutes'] as int? ??
                    local.shortBreakLengthMinutes
                : local.shortBreakLengthMinutes;
        local.longBreakLengthMinutes =
            data.containsKey('longBreakLengthMinutes')
                ? data['longBreakLengthMinutes'] as int? ??
                    local.longBreakLengthMinutes
                : local.longBreakLengthMinutes;
        local.themePrimaryColorHex = data.containsKey('themePrimaryColorHex')
            ? data['themePrimaryColorHex'] as String? ??
                local.themePrimaryColorHex
            : local.themePrimaryColorHex;
        local.soundEffectsEnabled = data.containsKey('soundEffectsEnabled')
            ? data['soundEffectsEnabled'] as bool? ?? local.soundEffectsEnabled
            : local.soundEffectsEnabled;
        local.syncStatus = SyncStatus.synced;
        local.lastSyncedAt = DateTime.now();
        local.pendingUpload = false;
        local.pendingDelete = false;
        local.updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.userSettingsCollections.put(local);
      },
    );

    await _pullCollection<TaskCollection>(
      uid: uid,
      collectionType: CollectionType.task,
      fetchLocal: (id) =>
          _isar.taskCollections.filter().taskIdEqualTo(id).findFirst(),
      insertLocal: (data) async {
        final entry = TaskCollection()
          ..taskId = data['taskId'] ?? data['id']
          ..userId = data['userId'] ?? uid
          ..projectId = data['projectId']
          ..title = data['title'] ?? 'Untitled Task'
          ..description = data['description']
          ..priority = data['priority'] ?? 'medium'
          ..state = data['state'] ?? 'pending'
          ..category = data['category'] ?? 'Work'
          ..tags = (data['tags'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              []
          ..subtasksJson = (data['subtasksJson'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              []
          ..notes = data['notes']
          ..completedAt = data.containsKey('completedAt')
              ? (data['completedAt'] != null
                  ? _parseTimestamp(data['completedAt'])
                  : null)
              : null
          ..dueDate =
              data['dueDate'] != null ? _parseTimestamp(data['dueDate']) : null
          ..scheduledStart = data['scheduledStart'] != null
              ? _parseTimestamp(data['scheduledStart'])
              : null
          ..scheduledEnd = data['scheduledEnd'] != null
              ? _parseTimestamp(data['scheduledEnd'])
              : null
          ..estimatedDurationMinutes = data['estimatedDurationMinutes']
          ..actualDurationMinutes = data['actualDurationMinutes'] ?? 0
          ..syncStatus = SyncStatus.synced
          ..lastSyncedAt = DateTime.now()
          ..pendingUpload = false
          ..pendingDelete = false
          ..remoteId = data['taskId'] ?? data['id']
          ..createdAt = _parseTimestamp(data['createdAt'])
          ..updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.taskCollections.put(entry);
      },
      updateLocal: (local, data) async {
        local.title = data.containsKey('title')
            ? data['title'] as String? ?? local.title
            : local.title;
        if (_hasRemoteKey(data, 'description')) {
          local.description = _getRemoteValue<String?>(data, 'description');
        }
        local.priority = data.containsKey('priority')
            ? data['priority'] as String? ?? local.priority
            : local.priority;
        local.state = data.containsKey('state')
            ? data['state'] as String? ?? local.state
            : local.state;
        local.category = data.containsKey('category')
            ? data['category'] as String? ?? local.category
            : local.category;
        local.tags = _hasRemoteKey(data, 'tags')
            ? _getRemoteList<String>(data, 'tags')
            : local.tags;
        local.subtasksJson = _hasRemoteKey(data, 'subtasksJson')
            ? _getRemoteList<String>(data, 'subtasksJson')
            : local.subtasksJson;
        if (_hasRemoteKey(data, 'notes')) {
          local.notes = _getRemoteValue<String?>(data, 'notes');
        }
        local.dueDate = data.containsKey('dueDate')
            ? (data['dueDate'] != null
                ? _parseTimestamp(data['dueDate'])
                : null)
            : local.dueDate;
        local.completedAt = data.containsKey('completedAt')
            ? (data['completedAt'] != null
                ? _parseTimestamp(data['completedAt'])
                : null)
            : local.completedAt;
        local.scheduledStart = data.containsKey('scheduledStart')
            ? (data['scheduledStart'] != null
                ? _parseTimestamp(data['scheduledStart'])
                : null)
            : local.scheduledStart;
        local.scheduledEnd = data.containsKey('scheduledEnd')
            ? (data['scheduledEnd'] != null
                ? _parseTimestamp(data['scheduledEnd'])
                : null)
            : local.scheduledEnd;
        local.estimatedDurationMinutes =
            data.containsKey('estimatedDurationMinutes')
                ? data['estimatedDurationMinutes'] as int?
                : local.estimatedDurationMinutes;
        local.actualDurationMinutes = data.containsKey('actualDurationMinutes')
            ? data['actualDurationMinutes'] as int?
            : local.actualDurationMinutes;
        local.syncStatus = SyncStatus.synced;
        local.lastSyncedAt = DateTime.now();
        local.pendingUpload = false;
        local.pendingDelete = false;
        local.updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.taskCollections.put(local);
      },
    );

    await _pullCollection<ProjectCollection>(
      uid: uid,
      collectionType: CollectionType.project,
      fetchLocal: (id) =>
          _isar.projectCollections.filter().projectIdEqualTo(id).findFirst(),
      insertLocal: (data) async {
        final entry = ProjectCollection()
          ..projectId = data['projectId'] ?? data['id']
          ..userId = data['userId'] ?? uid
          ..title = data['title'] ?? 'Untitled Project'
          ..description = data['description']
          ..colorHex = data['colorHex'] ?? '#8A2BE2'
          ..iconName = data['iconName'] ?? 'work'
          ..deadline = data['deadline'] != null
              ? _parseTimestamp(data['deadline'])
              : null
          ..progress = (data['progress'] as num?)?.toDouble() ?? 0.0
          ..isArchived = data['isArchived'] ?? false
          ..syncStatus = SyncStatus.synced
          ..lastSyncedAt = DateTime.now()
          ..pendingUpload = false
          ..pendingDelete = false
          ..remoteId = data['projectId'] ?? data['id']
          ..createdAt = _parseTimestamp(data['createdAt'])
          ..updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.projectCollections.put(entry);
      },
      updateLocal: (local, data) async {
        local.title = data.containsKey('title')
            ? data['title'] as String? ?? local.title
            : local.title;
        if (_hasRemoteKey(data, 'description')) {
          local.description = _getRemoteValue<String?>(data, 'description');
        }
        local.colorHex = data.containsKey('colorHex')
            ? data['colorHex'] as String? ?? local.colorHex
            : local.colorHex;
        local.iconName = data.containsKey('iconName')
            ? data['iconName'] as String? ?? local.iconName
            : local.iconName;
        local.deadline = data.containsKey('deadline')
            ? (data['deadline'] != null
                ? _parseTimestamp(data['deadline'])
                : null)
            : local.deadline;
        local.progress = data.containsKey('progress')
            ? (data['progress'] as num?)?.toDouble() ?? local.progress
            : local.progress;
        local.isArchived = data.containsKey('isArchived')
            ? data['isArchived'] as bool? ?? local.isArchived
            : local.isArchived;
        local.syncStatus = SyncStatus.synced;
        local.lastSyncedAt = DateTime.now();
        local.pendingUpload = false;
        local.pendingDelete = false;
        local.updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.projectCollections.put(local);
      },
    );

    await _pullCollection<SubtaskCollection>(
      uid: uid,
      collectionType: CollectionType.subtask,
      fetchLocal: (id) =>
          _isar.subtaskCollections.filter().subtaskIdEqualTo(id).findFirst(),
      insertLocal: (data) async {
        final entry = SubtaskCollection()
          ..subtaskId = data['subtaskId'] ?? data['id']
          ..taskId = data['taskId'] ?? ''
          ..title = data['title'] ?? 'Untitled Subtask'
          ..isCompleted = data['isCompleted'] ?? false
          ..orderIndex = data['orderIndex'] ?? 0
          ..syncStatus = SyncStatus.synced
          ..lastSyncedAt = DateTime.now()
          ..pendingUpload = false
          ..pendingDelete = false
          ..remoteId = data['subtaskId'] ?? data['id']
          ..createdAt = _parseTimestamp(data['createdAt'])
          ..updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.subtaskCollections.put(entry);
      },
      updateLocal: (local, data) async {
        local.title = data['title'] ?? local.title;
        local.isCompleted = data['isCompleted'] ?? local.isCompleted;
        local.orderIndex = data['orderIndex'] ?? local.orderIndex;
        local.syncStatus = SyncStatus.synced;
        local.lastSyncedAt = DateTime.now();
        local.pendingUpload = false;
        local.pendingDelete = false;
        local.updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.subtaskCollections.put(local);
      },
    );

    await _pullCollection<TaskAnalyticsCollection>(
      uid: uid,
      collectionType: CollectionType.taskAnalytics,
      fetchLocal: (id) => _isar.taskAnalyticsCollections
          .filter()
          .analyticsIdEqualTo(id)
          .findFirst(),
      insertLocal: (data) async {
        final entry = TaskAnalyticsCollection()
          ..analyticsId = data['analyticsId'] ?? data['id']
          ..userId = data['userId'] ?? uid
          ..period = data['period'] ?? 'weekly'
          ..startDate = _parseTimestamp(data['startDate'])
          ..endDate = _parseTimestamp(data['endDate'])
          ..totalTasksCreated = data['totalTasksCreated'] ?? 0
          ..totalTasksCompleted = data['totalTasksCompleted'] ?? 0
          ..totalOverdueTasks = data['totalOverdueTasks'] ?? 0
          ..totalFocusTimeMinutes = data['totalFocusTimeMinutes'] ?? 0
          ..completionRate = (data['completionRate'] as num?)?.toDouble() ?? 0.0
          ..consistencyScore =
              (data['consistencyScore'] as num?)?.toDouble() ?? 0.0
          ..completionVelocity =
              (data['completionVelocity'] as num?)?.toDouble() ?? 0.0
          ..procrastinationPatterns =
              (data['procrastinationPatterns'] as List<dynamic>?)
                      ?.map((e) => e.toString())
                      .toList() ??
                  []
          ..aiGeneratedInsights =
              (data['aiGeneratedInsights'] as List<dynamic>?)
                      ?.map((e) => e.toString())
                      .toList() ??
                  []
          ..syncStatus = SyncStatus.synced
          ..lastSyncedAt = DateTime.now()
          ..pendingUpload = false
          ..pendingDelete = false
          ..remoteId = data['analyticsId'] ?? data['id']
          ..createdAt = _parseTimestamp(data['createdAt'])
          ..updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.taskAnalyticsCollections.put(entry);
      },
      updateLocal: (local, data) async {
        local.period = data.containsKey('period')
            ? data['period'] as String? ?? local.period
            : local.period;
        local.startDate = data.containsKey('startDate')
            ? _parseTimestamp(data['startDate'])
            : local.startDate;
        local.endDate = data.containsKey('endDate')
            ? _parseTimestamp(data['endDate'])
            : local.endDate;
        local.totalTasksCreated = data.containsKey('totalTasksCreated')
            ? data['totalTasksCreated'] as int? ?? local.totalTasksCreated
            : local.totalTasksCreated;
        local.totalTasksCompleted = data.containsKey('totalTasksCompleted')
            ? data['totalTasksCompleted'] as int? ?? local.totalTasksCompleted
            : local.totalTasksCompleted;
        local.totalOverdueTasks = data.containsKey('totalOverdueTasks')
            ? data['totalOverdueTasks'] as int? ?? local.totalOverdueTasks
            : local.totalOverdueTasks;
        local.totalFocusTimeMinutes = data.containsKey('totalFocusTimeMinutes')
            ? data['totalFocusTimeMinutes'] as int? ??
                local.totalFocusTimeMinutes
            : local.totalFocusTimeMinutes;
        local.completionRate = data.containsKey('completionRate')
            ? (data['completionRate'] as num?)?.toDouble() ??
                local.completionRate
            : local.completionRate;
        local.consistencyScore = data.containsKey('consistencyScore')
            ? (data['consistencyScore'] as num?)?.toDouble() ??
                local.consistencyScore
            : local.consistencyScore;
        local.completionVelocity = data.containsKey('completionVelocity')
            ? (data['completionVelocity'] as num?)?.toDouble() ??
                local.completionVelocity
            : local.completionVelocity;
        local.procrastinationPatterns =
            _hasRemoteKey(data, 'procrastinationPatterns')
                ? _getRemoteList<String>(data, 'procrastinationPatterns')
                : local.procrastinationPatterns;
        local.aiGeneratedInsights = _hasRemoteKey(data, 'aiGeneratedInsights')
            ? _getRemoteList<String>(data, 'aiGeneratedInsights')
            : local.aiGeneratedInsights;
        local.syncStatus = SyncStatus.synced;
        local.lastSyncedAt = DateTime.now();
        local.pendingUpload = false;
        local.pendingDelete = false;
        local.updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.taskAnalyticsCollections.put(local);
      },
    );

    await _pullCollection<RecurringTaskCollection>(
      uid: uid,
      collectionType: CollectionType.recurringTask,
      fetchLocal: (id) => _isar.recurringTaskCollections
          .filter()
          .recurringTaskIdEqualTo(id)
          .findFirst(),
      insertLocal: (data) async {
        final entry = RecurringTaskCollection()
          ..recurringTaskId = data['recurringTaskId'] ?? data['id']
          ..userId = data['userId'] ?? uid
          ..title = data['title'] ?? 'Untitled Recurring Task'
          ..description = data['description']
          ..priority = data['priority'] ?? 'medium'
          ..category = data['category'] ?? 'Work'
          ..repeatInterval = data['repeatInterval'] ?? 'daily'
          ..customRepeatDays = (data['customRepeatDays'] as List<dynamic>?)
                  ?.map((e) => e as int)
                  .toList() ??
              []
          ..repeatUntilDate = data['repeatUntilDate'] != null
              ? _parseTimestamp(data['repeatUntilDate'])
              : null
          ..repeatCountLimit = data['repeatCountLimit']
          ..instancesGeneratedCount = data['instancesGeneratedCount'] ?? 0
          ..instancesCompletedCount = data['instancesCompletedCount'] ?? 0
          ..currentStreak = data['currentStreak'] ?? 0
          ..bestStreak = data['bestStreak'] ?? 0
          ..syncStatus = SyncStatus.synced
          ..lastSyncedAt = DateTime.now()
          ..pendingUpload = false
          ..pendingDelete = false
          ..remoteId = data['recurringTaskId'] ?? data['id']
          ..createdAt = _parseTimestamp(data['createdAt'])
          ..updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.recurringTaskCollections.put(entry);
      },
      updateLocal: (local, data) async {
        local.title = data.containsKey('title')
            ? data['title'] as String? ?? local.title
            : local.title;
        if (_hasRemoteKey(data, 'description')) {
          local.description = _getRemoteValue<String?>(data, 'description');
        }
        local.priority = data.containsKey('priority')
            ? data['priority'] as String? ?? local.priority
            : local.priority;
        local.category = data.containsKey('category')
            ? data['category'] as String? ?? local.category
            : local.category;
        local.repeatInterval = data.containsKey('repeatInterval')
            ? data['repeatInterval'] as String? ?? local.repeatInterval
            : local.repeatInterval;
        local.customRepeatDays = _hasRemoteKey(data, 'customRepeatDays')
            ? _getRemoteList<int>(data, 'customRepeatDays')
            : local.customRepeatDays;
        local.repeatUntilDate = data.containsKey('repeatUntilDate')
            ? (data['repeatUntilDate'] != null
                ? _parseTimestamp(data['repeatUntilDate'])
                : null)
            : local.repeatUntilDate;
        local.repeatCountLimit = data.containsKey('repeatCountLimit')
            ? data['repeatCountLimit'] as int?
            : local.repeatCountLimit;
        local.instancesGeneratedCount =
            data.containsKey('instancesGeneratedCount')
                ? data['instancesGeneratedCount'] as int? ??
                    local.instancesGeneratedCount
                : local.instancesGeneratedCount;
        local.instancesCompletedCount =
            data.containsKey('instancesCompletedCount')
                ? data['instancesCompletedCount'] as int? ??
                    local.instancesCompletedCount
                : local.instancesCompletedCount;
        local.currentStreak = data.containsKey('currentStreak')
            ? data['currentStreak'] as int? ?? local.currentStreak
            : local.currentStreak;
        local.bestStreak = data.containsKey('bestStreak')
            ? data['bestStreak'] as int? ?? local.bestStreak
            : local.bestStreak;
        local.syncStatus = SyncStatus.synced;
        local.lastSyncedAt = DateTime.now();
        local.pendingUpload = false;
        local.pendingDelete = false;
        local.updatedAt = _parseTimestamp(data['updatedAt']);

        await _isar.recurringTaskCollections.put(local);
      },
    );
  }

  Future<void> _pullCollection<T>({
    required String uid,
    required CollectionType collectionType,
    required Future<T?> Function(String id) fetchLocal,
    required Future<void> Function(Map<String, dynamic> data) insertLocal,
    required Future<void> Function(T local, Map<String, dynamic> data)
        updateLocal,
  }) async {
    final collectionPath = _getFirestoreCollectionName(collectionType);
    _logger.info('Fetching remote docs for $collectionPath...');

    try {
      final snapshot = await _firestore
          .collection(collectionPath)
          .where('userId', isEqualTo: uid)
          .get();
      _logger.info(
          'Fetched ${snapshot.docs.length} remote docs from $collectionPath.');

      await _isar.writeTxn(() async {
        await _deleteLocalDocsRemovedRemotely(
            collectionType, snapshot.docs.map((doc) => doc.id).toSet());
        for (final doc in snapshot.docs) {
          final data = doc.data();
          final remoteId = doc.id;
          final remoteUpdatedAt = _parseTimestamp(data['updatedAt']);

          final local = await fetchLocal(remoteId);

          if (local == null) {
            _logger.info(
                'Remote doc $remoteId not found locally. Inserting into Isar...');
            await insertLocal(data);
          } else {
            // Conflict resolution comparison
            final localUpdatedAt = _getLocalUpdatedAt(local);
            final lastSyncedAt = _getLastSyncedAt(local);

            final decision = _conflictResolver.resolve(
              entityId: remoteId,
              collectionName: collectionPath,
              localUpdatedAt: localUpdatedAt,
              remoteUpdatedAt: remoteUpdatedAt,
              lastSyncedAt: lastSyncedAt,
            );

            if (decision == ConflictDecision.useRemote) {
              _logger
                  .info('Updating local doc $remoteId with remote changes...');
              await updateLocal(local, data);
            }
          }
        }
      });
    } catch (e, st) {
      _logger.error('Failed to pull remote collection $collectionPath', e, st);
    }
  }

  Future<void> _deleteLocalDocsRemovedRemotely(
      CollectionType collectionType, Set<String> remoteIds) async {
    switch (collectionType) {
      case CollectionType.habit:
        final items = await _isar.habitCollections.where().findAll();
        for (final item in items) {
          final localRemoteKey = item.remoteId ?? item.habitId;
          if (item.syncStatus == SyncStatus.synced &&
              !remoteIds.contains(localRemoteKey)) {
            await _isar.habitCollections.delete(item.id);
          }
        }
        break;
      case CollectionType.habitCompletion:
        final items = await _isar.habitCompletionCollections.where().findAll();
        for (final item in items) {
          final localRemoteKey = item.remoteId ?? item.completionId;
          if (item.syncStatus == SyncStatus.synced &&
              !remoteIds.contains(localRemoteKey)) {
            await _isar.habitCompletionCollections.delete(item.id);
          }
        }
        break;
      case CollectionType.focusSession:
        final items = await _isar.focusSessionCollections.where().findAll();
        for (final item in items) {
          final localRemoteKey = item.remoteId ?? item.sessionId;
          if (item.syncStatus == SyncStatus.synced &&
              !remoteIds.contains(localRemoteKey)) {
            await _isar.focusSessionCollections.delete(item.id);
          }
        }
        break;
      case CollectionType.userSettings:
        final items = await _isar.userSettingsCollections.where().findAll();
        for (final item in items) {
          final localRemoteKey = item.remoteId ?? item.userId;
          if (item.syncStatus == SyncStatus.synced &&
              !remoteIds.contains(localRemoteKey)) {
            await _isar.userSettingsCollections.delete(item.id);
          }
        }
        break;
      case CollectionType.task:
        final items = await _isar.taskCollections.where().findAll();
        for (final item in items) {
          final localRemoteKey = item.remoteId ?? item.taskId;
          if (item.syncStatus == SyncStatus.synced &&
              !remoteIds.contains(localRemoteKey)) {
            await _isar.taskCollections.delete(item.id);
          }
        }
        break;
      case CollectionType.project:
        final items = await _isar.projectCollections.where().findAll();
        for (final item in items) {
          final localRemoteKey = item.remoteId ?? item.projectId;
          if (item.syncStatus == SyncStatus.synced &&
              !remoteIds.contains(localRemoteKey)) {
            await _isar.projectCollections.delete(item.id);
          }
        }
        break;
      case CollectionType.subtask:
        final items = await _isar.subtaskCollections.where().findAll();
        for (final item in items) {
          final localRemoteKey = item.remoteId ?? item.subtaskId;
          if (item.syncStatus == SyncStatus.synced &&
              !remoteIds.contains(localRemoteKey)) {
            await _isar.subtaskCollections.delete(item.id);
          }
        }
        break;
      case CollectionType.taskAnalytics:
        final items = await _isar.taskAnalyticsCollections.where().findAll();
        for (final item in items) {
          final localRemoteKey = item.remoteId ?? item.analyticsId;
          if (item.syncStatus == SyncStatus.synced &&
              !remoteIds.contains(localRemoteKey)) {
            await _isar.taskAnalyticsCollections.delete(item.id);
          }
        }
        break;
      case CollectionType.recurringTask:
        final items = await _isar.recurringTaskCollections.where().findAll();
        for (final item in items) {
          final localRemoteKey = item.remoteId ?? item.recurringTaskId;
          if (item.syncStatus == SyncStatus.synced &&
              !remoteIds.contains(localRemoteKey)) {
            await _isar.recurringTaskCollections.delete(item.id);
          }
        }
        break;
    }
  }

  String _getFirestoreCollectionName(CollectionType type) {
    switch (type) {
      case CollectionType.habit:
        return 'habits';
      case CollectionType.habitCompletion:
        return 'habit_completions';
      case CollectionType.focusSession:
        return 'focus_sessions';
      case CollectionType.userSettings:
        return 'settings';
      case CollectionType.task:
        return 'tasks';
      case CollectionType.project:
        return 'projects';
      case CollectionType.subtask:
        return 'subtasks';
      case CollectionType.taskAnalytics:
        return 'task_analytics';
      case CollectionType.recurringTask:
        return 'recurring_tasks';
    }
  }

  DateTime _parseTimestamp(dynamic val) {
    if (val is Timestamp) return val.toDate();
    if (val is String) return DateTime.tryParse(val) ?? DateTime.now();
    if (val is int) return DateTime.fromMillisecondsSinceEpoch(val);
    return DateTime.now();
  }

  bool _hasRemoteKey(Map<String, dynamic> data, String key) {
    return data.containsKey(key);
  }

  T? _getRemoteValue<T>(Map<String, dynamic> data, String key) {
    return data.containsKey(key) ? data[key] as T? : null;
  }

  List<T>? _getRemoteList<T>(Map<String, dynamic> data, String key) {
    if (!data.containsKey(key)) return null;
    return (data[key] as List<dynamic>?)?.map((e) => e as T).toList();
  }

  DateTime _getLocalUpdatedAt(dynamic local) {
    try {
      return local.updatedAt as DateTime;
    } catch (_) {
      return DateTime.now();
    }
  }

  DateTime? _getLastSyncedAt(dynamic local) {
    try {
      return local.lastSyncedAt as DateTime?;
    } catch (_) {
      return null;
    }
  }

  Future<void> _updateLocalEntitySyncStatus(
      CollectionType type, String entityId, SyncStatus status) async {
    await _isar.writeTxn(() async {
      final now = DateTime.now();
      switch (type) {
        case CollectionType.habit:
          final item = await _isar.habitCollections
              .filter()
              .habitIdEqualTo(entityId)
              .findFirst();
          if (item != null) {
            item.syncStatus = status;
            item.lastSyncedAt = now;
            item.pendingUpload = false;
            item.remoteId = entityId;
            await _isar.habitCollections.put(item);
          }
          break;
        case CollectionType.habitCompletion:
          final item = await _isar.habitCompletionCollections
              .filter()
              .completionIdEqualTo(entityId)
              .findFirst();
          if (item != null) {
            item.syncStatus = status;
            item.lastSyncedAt = now;
            item.pendingUpload = false;
            item.remoteId = entityId;
            await _isar.habitCompletionCollections.put(item);
          }
          break;
        case CollectionType.focusSession:
          final item = await _isar.focusSessionCollections
              .filter()
              .sessionIdEqualTo(entityId)
              .findFirst();
          if (item != null) {
            item.syncStatus = status;
            item.lastSyncedAt = now;
            item.pendingUpload = false;
            item.remoteId = entityId;
            await _isar.focusSessionCollections.put(item);
          }
          break;
        case CollectionType.userSettings:
          final item = await _isar.userSettingsCollections
              .filter()
              .userIdEqualTo(entityId)
              .findFirst();
          if (item != null) {
            item.syncStatus = status;
            item.lastSyncedAt = now;
            item.pendingUpload = false;
            item.remoteId = entityId;
            await _isar.userSettingsCollections.put(item);
          }
          break;
        case CollectionType.task:
          final item = await _isar.taskCollections
              .filter()
              .taskIdEqualTo(entityId)
              .findFirst();
          if (item != null) {
            item.syncStatus = status;
            item.lastSyncedAt = now;
            item.pendingUpload = false;
            item.remoteId = entityId;
            await _isar.taskCollections.put(item);
          }
          break;
        case CollectionType.project:
          final item = await _isar.projectCollections
              .filter()
              .projectIdEqualTo(entityId)
              .findFirst();
          if (item != null) {
            item.syncStatus = status;
            item.lastSyncedAt = now;
            item.pendingUpload = false;
            item.remoteId = entityId;
            await _isar.projectCollections.put(item);
          }
          break;
        case CollectionType.subtask:
          final item = await _isar.subtaskCollections
              .filter()
              .subtaskIdEqualTo(entityId)
              .findFirst();
          if (item != null) {
            item.syncStatus = status;
            item.lastSyncedAt = now;
            item.pendingUpload = false;
            item.remoteId = entityId;
            await _isar.subtaskCollections.put(item);
          }
          break;
        case CollectionType.taskAnalytics:
          final item = await _isar.taskAnalyticsCollections
              .filter()
              .analyticsIdEqualTo(entityId)
              .findFirst();
          if (item != null) {
            item.syncStatus = status;
            item.lastSyncedAt = now;
            item.pendingUpload = false;
            item.remoteId = entityId;
            await _isar.taskAnalyticsCollections.put(item);
          }
          break;
        case CollectionType.recurringTask:
          final item = await _isar.recurringTaskCollections
              .filter()
              .recurringTaskIdEqualTo(entityId)
              .findFirst();
          if (item != null) {
            item.syncStatus = status;
            item.lastSyncedAt = now;
            item.pendingUpload = false;
            item.remoteId = entityId;
            await _isar.recurringTaskCollections.put(item);
          }
          break;
      }
    });
  }
}

final syncEngineProvider = Provider<SyncEngine>((ref) {
  final user = ref.watch(currentUserProvider);
  final engine = SyncEngine(
    ref.watch(databaseServiceProvider),
    ref.watch(syncQueueProvider),
    ref.watch(conflictResolverProvider),
    ref.watch(appLoggerProvider),
    user?.id,
  );
  ref.watch(syncQueueProvider).onMutationEnqueued = () {
    if (user?.id != null &&
        user!.id.trim().isNotEmpty &&
        user.id != 'local_dev_user_101') {
      engine.syncAll();
    } else {
      ref.read(appLoggerProvider).warning(
          'SyncEngine: Mutation enqueued, but sync delayed until auth fully resolves.');
    }
  };
  if (user?.id != null &&
      user!.id.trim().isNotEmpty &&
      user.id != 'local_dev_user_101') {
    Future.microtask(() => engine.syncAll());
  } else {
    ref.read(appLoggerProvider).info(
        'SyncEngine: Initialized, waiting for confirmed auth state before triggering initial sync.');
  }
  return engine;
});
