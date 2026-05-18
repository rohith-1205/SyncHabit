import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/logger.dart';

enum ConflictDecision { useLocal, useRemote }

class ConflictResolver {
  final AppLogger _logger;

  ConflictResolver(this._logger);

  /// Implements Last-Write-Wins (LWW) conflict resolution strategy.
  /// Compares local [updatedAt] against remote [remoteUpdatedAt] and [lastSyncedAt].
  ConflictDecision resolve({
    required String entityId,
    required String collectionName,
    required DateTime localUpdatedAt,
    required DateTime remoteUpdatedAt,
    required DateTime? lastSyncedAt,
  }) {
    _logger.info('Resolving conflict for $collectionName ($entityId)...');
    _logger.info('Local updatedAt: $localUpdatedAt | Remote updatedAt: $remoteUpdatedAt | Last syncedAt: $lastSyncedAt');

    // If local was never synced, or local was updated after the remote change
    if (lastSyncedAt == null || localUpdatedAt.isAfter(remoteUpdatedAt)) {
      _logger.warning('Conflict resolved: LOCAL wins (Last-Write-Wins) for $entityId');
      return ConflictDecision.useLocal;
    }

    // Otherwise, remote has a newer timestamp than our local update
    _logger.warning('Conflict resolved: REMOTE wins (Last-Write-Wins) for $entityId');
    return ConflictDecision.useRemote;
  }
}

final conflictResolverProvider = Provider<ConflictResolver>((ref) {
  return ConflictResolver(ref.watch(appLoggerProvider));
});
