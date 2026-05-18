import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/result.dart';
import '../../../../database/database.dart';
import '../../../../sync/queue/sync_queue.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final DatabaseService _dbService;
  final SyncQueue _syncQueue;
  final AppLogger _logger;
  final String _userId;

  const TaskRepositoryImpl(
      this._dbService, this._syncQueue, this._logger, this._userId);

  Isar get _isar => _dbService.isar;

  @override
  Future<Result<List<TaskEntity>>> getTasks() async {
    _logger.info('Fetching all tasks for user $_userId from Isar...');
    try {
      final collections =
          await _isar.taskCollections.filter().userIdEqualTo(_userId).findAll();
      final models =
          collections.map((col) => TaskModel.fromCollection(col)).toList();
      return Result.success(models);
    } catch (e) {
      _logger.error('Failed to get tasks: $e');
      return Result.failure(DatabaseFailure('Failed to load tasks: $e'));
    }
  }

  @override
  Future<Result<List<TaskEntity>>> getTasksForDate(DateTime date) async {
    _logger.info('Fetching tasks for date: $date for user $_userId');
    try {
      final collections =
          await _isar.taskCollections.filter().userIdEqualTo(_userId).findAll();
      final filtered = collections.where((col) {
        if (col.dueDate == null) return false;
        return col.dueDate!.year == date.year &&
            col.dueDate!.month == date.month &&
            col.dueDate!.day == date.day;
      }).toList();

      final models =
          filtered.map((col) => TaskModel.fromCollection(col)).toList();
      return Result.success(models);
    } catch (e) {
      _logger.error('Failed to get tasks for date: $e');
      return Result.failure(
          DatabaseFailure('Failed to load tasks for date: $e'));
    }
  }

  @override
  Future<Result<List<TaskEntity>>> getTasksForProject(String projectId) async {
    _logger.info('Fetching tasks for project: $projectId for user $_userId');
    try {
      final collections = await _isar.taskCollections
          .filter()
          .userIdEqualTo(_userId)
          .projectIdEqualTo(projectId)
          .findAll();
      final models =
          collections.map((col) => TaskModel.fromCollection(col)).toList();
      return Result.success(models);
    } catch (e) {
      _logger.error('Failed to get tasks for project: $e');
      return Result.failure(
          DatabaseFailure('Failed to load tasks for project: $e'));
    }
  }

  @override
  Future<Result<TaskEntity>> createTask(TaskEntity task) async {
    _logger.info('Creating task: ${task.title}');
    try {
      final model = TaskModel.fromEntity(task);
      final col = model.toCollection();

      await _isar.writeTxn(() async {
        await _isar.taskCollections.put(col);
      });

      await _syncQueue.enqueue(
        collectionType: CollectionType.task,
        mutationType: MutationType.create,
        entityId: task.id,
        payloadJson: jsonEncode(model.toJson()),
      );

      return Result.success(model);
    } catch (e) {
      _logger.error('Failed to create task: $e');
      return Result.failure(DatabaseFailure('Failed to create task: $e'));
    }
  }

  @override
  Future<Result<TaskEntity>> updateTask(TaskEntity task) async {
    _logger.info('Updating task: ${task.title}');
    try {
      final model = TaskModel.fromEntity(task);
      final col = model.toCollection();

      await _isar.writeTxn(() async {
        await _isar.taskCollections.put(col);
      });

      await _syncQueue.enqueue(
        collectionType: CollectionType.task,
        mutationType: MutationType.update,
        entityId: task.id,
        payloadJson: jsonEncode(model.toJson()),
      );

      return Result.success(model);
    } catch (e) {
      _logger.error('Failed to update task: $e');
      return Result.failure(DatabaseFailure('Failed to update task: $e'));
    }
  }

  @override
  Future<Result<void>> deleteTask(String id) async {
    _logger.info('Deleting task: $id');
    try {
      await _isar.writeTxn(() async {
        await _isar.taskCollections.filter().taskIdEqualTo(id).deleteAll();
      });

      await _syncQueue.enqueue(
        collectionType: CollectionType.task,
        mutationType: MutationType.delete,
        entityId: id,
        payloadJson: jsonEncode({'id': id}),
      );

      return Result.success(null);
    } catch (e) {
      _logger.error('Failed to delete task: $e');
      return Result.failure(DatabaseFailure('Failed to delete task: $e'));
    }
  }

  @override
  Future<Result<TaskEntity>> toggleTaskCompletion(String id) async {
    _logger.info('Toggling task completion: $id');
    try {
      final col =
          await _isar.taskCollections.filter().taskIdEqualTo(id).findFirst();
      if (col == null) {
        return Result.failure(const DatabaseFailure('Task not found'));
      }

      final model = TaskModel.fromCollection(col);
      final nextState = model.state == TaskState.completed
          ? TaskState.pending
          : TaskState.completed;
      final updatedModel = model.copyWith(
        state: nextState,
        completedAt: nextState == TaskState.completed ? DateTime.now() : null,
        updatedAt: DateTime.now(),
      );

      final updatedCol = updatedModel.toCollection();
      await _isar.writeTxn(() async {
        await _isar.taskCollections.put(updatedCol);
      });

      await _syncQueue.enqueue(
        collectionType: CollectionType.task,
        mutationType: MutationType.update,
        entityId: id,
        payloadJson: jsonEncode(updatedModel.toJson()),
      );

      return Result.success(updatedModel);
    } catch (e) {
      _logger.error('Failed to toggle task: $e');
      return Result.failure(DatabaseFailure('Failed to toggle task: $e'));
    }
  }

  @override
  Future<Result<TaskEntity>> toggleTaskArchive(String id) async {
    _logger.info('Toggling task archive: $id');
    try {
      final col =
          await _isar.taskCollections.filter().taskIdEqualTo(id).findFirst();
      if (col == null) {
        return Result.failure(const DatabaseFailure('Task not found'));
      }

      final model = TaskModel.fromCollection(col);
      final nextState = model.state == TaskState.archived
          ? TaskState.pending
          : TaskState.archived;
      final updatedModel = model.copyWith(
        state: nextState,
        completedAt: nextState == TaskState.completed ? DateTime.now() : null,
        updatedAt: DateTime.now(),
      );

      final updatedCol = updatedModel.toCollection();
      await _isar.writeTxn(() async {
        await _isar.taskCollections.put(updatedCol);
      });

      await _syncQueue.enqueue(
        collectionType: CollectionType.task,
        mutationType: MutationType.update,
        entityId: id,
        payloadJson: jsonEncode(updatedModel.toJson()),
      );

      return Result.success(updatedModel);
    } catch (e) {
      _logger.error('Failed to toggle task archive: $e');
      return Result.failure(
          DatabaseFailure('Failed to toggle task archive: $e'));
    }
  }

  @override
  Future<Result<TaskEntity>> updateTaskSubtasks(
      String taskId, List<SubtaskEntity> subtasks) async {
    _logger.info('Updating subtasks for task: $taskId');
    try {
      final col = await _isar.taskCollections
          .filter()
          .taskIdEqualTo(taskId)
          .findFirst();
      if (col == null) {
        return Result.failure(const DatabaseFailure('Task not found'));
      }

      final model = TaskModel.fromCollection(col);
      final updatedModel = model.copyWith(
        subtasks: subtasks,
        updatedAt: DateTime.now(),
      );

      final updatedCol = updatedModel.toCollection();
      await _isar.writeTxn(() async {
        await _isar.taskCollections.put(updatedCol);
        for (final st in subtasks) {
          final subtaskCol = SubtaskCollection()
            ..subtaskId = st.id
            ..taskId = taskId
            ..title = st.title
            ..isCompleted = st.isCompleted
            ..orderIndex = st.orderIndex
            ..syncStatus = SyncStatus.pending
            ..createdAt = DateTime.now()
            ..updatedAt = DateTime.now();
          await _isar.subtaskCollections.put(subtaskCol);

          await _syncQueue.enqueue(
            collectionType: CollectionType.subtask,
            mutationType: MutationType.update,
            entityId: st.id,
            payloadJson: jsonEncode({
              'id': st.id,
              'taskId': taskId,
              'title': st.title,
              'isCompleted': st.isCompleted,
              'orderIndex': st.orderIndex,
            }),
          );
        }
      });

      await _syncQueue.enqueue(
        collectionType: CollectionType.task,
        mutationType: MutationType.update,
        entityId: taskId,
        payloadJson: jsonEncode(updatedModel.toJson()),
      );

      return Result.success(updatedModel);
    } catch (e) {
      _logger.error('Failed to update task subtasks: $e');
      return Result.failure(
          DatabaseFailure('Failed to update task subtasks: $e'));
    }
  }

  @override
  Future<Result<void>> generateRecurringInstances() async {
    _logger.info('Generating recurring task instances for user $_userId...');
    try {
      final recurringList = await _isar.recurringTaskCollections
          .filter()
          .userIdEqualTo(_userId)
          .findAll();
      final now = DateTime.now();

      await _isar.writeTxn(() async {
        for (final recurring in recurringList) {
          if (recurring.repeatUntilDate != null &&
              recurring.repeatUntilDate!.isBefore(now)) {
            continue;
          }
          if (recurring.repeatCountLimit != null &&
              recurring.instancesGeneratedCount >=
                  recurring.repeatCountLimit!) {
            continue;
          }

          final targetDate = DateTime(now.year, now.month, now.day);
          final existing = await _isar.taskCollections
              .filter()
              .userIdEqualTo(_userId)
              .titleEqualTo(recurring.title)
              .dueDateEqualTo(targetDate)
              .findFirst();

          if (existing == null) {
            final newTaskId = const Uuid().v4();
            final newTask = TaskModel(
              id: newTaskId,
              userId: recurring.userId,
              title: recurring.title,
              description: recurring.description,
              priority: TaskPriority.values.firstWhere(
                  (e) => e.name == recurring.priority,
                  orElse: () => TaskPriority.medium),
              state: TaskState.scheduled,
              category: recurring.category,
              tags: ['recurring', recurring.repeatInterval],
              subtasks: [],
              dueDate: targetDate,
              actualDurationMinutes: 0,
              createdAt: now,
              updatedAt: now,
            );

            await _isar.taskCollections.put(newTask.toCollection());

            recurring.instancesGeneratedCount += 1;
            recurring.updatedAt = now;
            await _isar.recurringTaskCollections.put(recurring);

            await _syncQueue.enqueue(
              collectionType: CollectionType.task,
              mutationType: MutationType.create,
              entityId: newTaskId,
              payloadJson: jsonEncode(newTask.toJson()),
            );
          }
        }
      });

      return Result.success(null);
    } catch (e) {
      _logger.error('Failed to generate recurring instances: $e');
      return Result.failure(
          DatabaseFailure('Failed to generate recurring instances: $e'));
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getTaskAnalyticsSummary() async {
    _logger.info('Calculating task analytics summary for user $_userId...');
    try {
      final collections =
          await _isar.taskCollections.filter().userIdEqualTo(_userId).findAll();
      final now = DateTime.now();

      int totalCreated = collections.length;
      int totalCompleted =
          collections.where((t) => t.state == TaskState.completed.name).length;
      int totalOverdue = collections.where((t) {
        if (t.state == TaskState.completed.name ||
            t.state == TaskState.archived.name) return false;
        return t.dueDate != null &&
            t.dueDate!.isBefore(DateTime(now.year, now.month, now.day));
      }).length;

      int totalFocusMinutes =
          collections.fold(0, (sum, t) => sum + (t.actualDurationMinutes ?? 0));
      double completionRate =
          totalCreated > 0 ? totalCompleted / totalCreated : 0.0;
      double consistencyScore =
          (completionRate * 0.7) + (totalOverdue == 0 ? 0.3 : 0.1);
      double completionVelocity = totalCompleted / 7.0;

      final summary = {
        'totalCreated': totalCreated,
        'totalCompleted': totalCompleted,
        'totalOverdue': totalOverdue,
        'totalFocusMinutes': totalFocusMinutes,
        'completionRate': completionRate,
        'consistencyScore': consistencyScore,
        'completionVelocity': completionVelocity,
        'procrastinationPatterns': totalOverdue > 3
            ? ['High overdue frequency detected on complex tasks']
            : ['Optimal task pacing maintained'],
        'aiGeneratedInsights': totalCompleted > totalOverdue
            ? [
                'Great execution momentum! Keep tackling high priority items first.'
              ]
            : [
                'Warning: Task backlog accumulation. Suggesting micro-timeboxing.'
              ],
      };

      await _isar.writeTxn(() async {
        final analyticsCol = await _isar.taskAnalyticsCollections
                .filter()
                .periodEqualTo('all_time')
                .findFirst() ??
            TaskAnalyticsCollection();
        analyticsCol
          ..analyticsId = analyticsCol.analyticsId.isEmpty
              ? 'analytics_all_time'
              : analyticsCol.analyticsId
          ..userId =
              collections.isNotEmpty ? collections.first.userId : 'default_user'
          ..period = 'all_time'
          ..startDate = DateTime.now().subtract(const Duration(days: 30))
          ..endDate = DateTime.now()
          ..totalTasksCreated = totalCreated
          ..totalTasksCompleted = totalCompleted
          ..totalOverdueTasks = totalOverdue
          ..totalFocusTimeMinutes = totalFocusMinutes
          ..completionRate = completionRate
          ..consistencyScore = consistencyScore
          ..completionVelocity = completionVelocity
          ..procrastinationPatterns =
              summary['procrastinationPatterns'] as List<String>?
          ..aiGeneratedInsights =
              summary['aiGeneratedInsights'] as List<String>?
          ..syncStatus = SyncStatus.pending
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now();

        await _isar.taskAnalyticsCollections.put(analyticsCol);

        await _syncQueue.enqueue(
          collectionType: CollectionType.taskAnalytics,
          mutationType: MutationType.update,
          entityId: analyticsCol.analyticsId,
          payloadJson: jsonEncode(summary),
        );
      });

      return Result.success(summary);
    } catch (e) {
      _logger.error('Failed to get task analytics summary: $e');
      return Result.failure(
          DatabaseFailure('Failed to calculate task analytics: $e'));
    }
  }
}
