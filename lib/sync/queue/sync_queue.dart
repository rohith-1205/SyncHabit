import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../../core/utils/logger.dart';
import '../../database/database.dart';

class SyncQueue {
  final DatabaseService _dbService;
  final AppLogger _logger;
  void Function()? onMutationEnqueued;

  SyncQueue(this._dbService, this._logger);

  Isar get _isar => _dbService.isar;

  /// Enqueue a new mutation for offline-first synchronization.
  /// Prevents duplicate uploads by merging/updating existing pending mutations for the same entityId.
  Future<void> enqueue({
    required CollectionType collectionType,
    required MutationType mutationType,
    required String entityId,
    required String payloadJson,
  }) async {
    _logger.info('Enqueueing mutation: $mutationType for $collectionType ($entityId)');
    final now = DateTime.now();

    await _isar.writeTxn(() async {
      // Check for existing pending mutation for this entity
      final existing = await _isar.syncMutationCollections
          .filter()
          .entityIdEqualTo(entityId)
          .and()
          .collectionTypeEqualTo(collectionType)
          .findFirst();

      if (existing != null) {
        if (existing.mutationType == MutationType.delete && mutationType != MutationType.delete) {
          _logger.warning('Entity $entityId is already marked for deletion. Ignoring $mutationType.');
          return;
        }

        // If existing is create and new is update, keep it as create but update payload
        final effectiveMutationType = (existing.mutationType == MutationType.create && mutationType == MutationType.update)
            ? MutationType.create
            : mutationType;

        existing.mutationType = effectiveMutationType;
        existing.payloadJson = payloadJson;
        existing.createdAt = now;
        existing.retryCount = 0;
        existing.nextRetryAt = null;
        existing.lastError = null;

        await _isar.syncMutationCollections.put(existing);
        _logger.info('Updated existing mutation in queue for $entityId');
      } else {
        final entry = SyncMutationCollection()
          ..mutationId = const Uuid().v4()
          ..userId = 'current_user' // Will be scoped properly during sync
          ..collectionType = collectionType
          ..mutationType = mutationType
          ..entityId = entityId
          ..payloadJson = payloadJson
          ..createdAt = now
          ..retryCount = 0
          ..nextRetryAt = null
          ..lastError = null;

        await _isar.syncMutationCollections.put(entry);
        _logger.info('Added new mutation to queue: ${entry.mutationId}');
      }
    });

    onMutationEnqueued?.call();
  }

  /// Retrieve all pending mutations eligible for retry
  Future<List<SyncMutationCollection>> peekPending() async {
    final now = DateTime.now();
    return await _isar.syncMutationCollections
        .filter()
        .nextRetryAtIsNull()
        .or()
        .nextRetryAtLessThan(now)
        .sortByCreatedAt()
        .findAll();
  }

  /// Mark a mutation as successfully synchronized with the cloud
  Future<void> markSuccess(String mutationId) async {
    await _isar.writeTxn(() async {
      await _isar.syncMutationCollections.filter().mutationIdEqualTo(mutationId).deleteAll();
    });
    _logger.info('Mutation $mutationId successfully synced and removed from queue.');
  }

  /// Mark a mutation as failed, applying exponential retry backoff
  Future<void> markFailed(String mutationId, String error) async {
    await _isar.writeTxn(() async {
      final mutation = await _isar.syncMutationCollections.filter().mutationIdEqualTo(mutationId).findFirst();
      if (mutation != null) {
        mutation.retryCount += 1;
        mutation.lastError = error;

        // Exponential backoff: 5s, 10s, 20s, 40s, 80s... max 300s
        final backoffSeconds = min(pow(2, mutation.retryCount) * 5, 300).toInt();
        mutation.nextRetryAt = DateTime.now().add(Duration(seconds: backoffSeconds));

        await _isar.syncMutationCollections.put(mutation);
        _logger.warning('Mutation $mutationId failed (retry #${mutation.retryCount}). Next retry in ${backoffSeconds}s. Error: $error');
      }
    });
  }

  /// Clear entire queue (e.g. on user logout or hard reset)
  Future<void> clearQueue() async {
    await _isar.writeTxn(() async {
      await _isar.syncMutationCollections.clear();
    });
    _logger.warning('Sync mutation queue cleared.');
  }

  /// Reset all retry timers to immediately retry pending mutations
  Future<void> forceRetryAll() async {
    await _isar.writeTxn(() async {
      final allPending = await _isar.syncMutationCollections.where().findAll();
      for (final m in allPending) {
        m.nextRetryAt = null;
        m.retryCount = 0;
        await _isar.syncMutationCollections.put(m);
      }
    });
    _logger.info('Reset all pending mutations for immediate retry.');
  }
}

final syncQueueProvider = Provider<SyncQueue>((ref) {
  return SyncQueue(
    ref.watch(databaseServiceProvider),
    ref.watch(appLoggerProvider),
  );
});
