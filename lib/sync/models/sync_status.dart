import '../../database/collections/habit_collection.dart';

export '../../database/collections/habit_collection.dart' show SyncStatus;

extension SyncStatusExtension on SyncStatus {
  bool get isPending => 
      this == SyncStatus.pendingUpload || 
      this == SyncStatus.pendingUpdate || 
      this == SyncStatus.pendingDelete || 
      this == SyncStatus.pending;

  bool get isSynced => this == SyncStatus.synced;
  bool get isConflict => this == SyncStatus.conflict;
  bool get isFailed => this == SyncStatus.failed;
}
