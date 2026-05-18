import 'dart:convert';
import 'package:isar/isar.dart';
import '../../../../core/utils/logger.dart';
import '../../../../database/database.dart'; // DatabaseService, FocusSessionCollection, SyncStatus
import '../../../../sync/queue/sync_queue.dart';
import '../../domain/entities/focus_session_entity.dart';
import '../../domain/repositories/focus_repository.dart';
import '../models/focus_session_model.dart';

class FocusRepositoryImpl implements FocusRepository {
  final DatabaseService _dbService;
  final SyncQueue _syncQueue;
  final AppLogger _logger;

  FocusRepositoryImpl(this._dbService, this._syncQueue, this._logger);

  Isar get _isar => _dbService.isar;

  @override
  Future<FocusSessionEntity> saveSession(FocusSessionEntity session) async {
    _logger.info('Saving focus session ${session.sessionId} to Isar...');
    final col = FocusSessionCollection()
      ..sessionId = session.sessionId
      ..userId = session.userId
      ..habitId = session.habitId
      ..title = session.title
      ..durationMinutes = session.durationMinutes
      ..completedMinutes = session.completedMinutes
      ..mode = session.mode
      ..startTime = session.startTime
      ..endTime = session.endTime
      ..isCompleted = session.isCompleted
      ..syncStatus = SyncStatus.pending
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.focusSessionCollections.put(col);
    });

    final model = FocusSessionModel.fromEntity(session);
    await _syncQueue.enqueue(
      collectionType: CollectionType.focusSession,
      mutationType: MutationType.update, // save covers create & update
      entityId: session.sessionId,
      payloadJson: jsonEncode(model.toJson()),
    );

    return session;
  }

  @override
  Future<FocusSessionEntity?> getActiveSession(String userId) async {
    _logger.info('Checking for active focus session in Isar for user $userId...');
    final col = await _isar.focusSessionCollections
        .filter()
        .userIdEqualTo(userId)
        .isCompletedEqualTo(false)
        .sortByStartTimeDesc()
        .findFirst();

    if (col == null) return null;

    return FocusSessionModel(
      sessionId: col.sessionId,
      userId: col.userId,
      habitId: col.habitId,
      title: col.title,
      durationMinutes: col.durationMinutes,
      completedMinutes: col.completedMinutes,
      mode: col.mode,
      startTime: col.startTime,
      endTime: col.endTime,
      isCompleted: col.isCompleted,
      interruptionsCount: 0,
    );
  }

  @override
  Future<List<FocusSessionEntity>> getCompletedSessions(String userId) async {
    final cols = await _isar.focusSessionCollections
        .filter()
        .userIdEqualTo(userId)
        .isCompletedEqualTo(true)
        .sortByStartTimeDesc()
        .findAll();

    return cols.map((col) => FocusSessionModel(
      sessionId: col.sessionId,
      userId: col.userId,
      habitId: col.habitId,
      title: col.title,
      durationMinutes: col.durationMinutes,
      completedMinutes: col.completedMinutes,
      mode: col.mode,
      startTime: col.startTime,
      endTime: col.endTime,
      isCompleted: col.isCompleted,
      interruptionsCount: 0,
    )).toList();
  }

  @override
  Future<void> deleteSession(String sessionId) async {
    await _isar.writeTxn(() async {
      await _isar.focusSessionCollections.filter().sessionIdEqualTo(sessionId).deleteAll();
    });

    await _syncQueue.enqueue(
      collectionType: CollectionType.focusSession,
      mutationType: MutationType.delete,
      entityId: sessionId,
      payloadJson: jsonEncode({'sessionId': sessionId}),
    );
  }
}
