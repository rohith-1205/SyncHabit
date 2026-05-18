import 'package:isar/isar.dart';
import 'habit_collection.dart'; // For SyncStatus enum

part 'subtask_collection.g.dart';

@collection
class SubtaskCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String subtaskId;

  @Index()
  late String taskId;

  late String title;

  late bool isCompleted;

  late int orderIndex;

  @enumerated
  @Index()
  late SyncStatus syncStatus;

  DateTime? lastSyncedAt;

  bool pendingUpload = false;

  bool pendingDelete = false;

  @Index()
  String? remoteId;

  late DateTime createdAt;

  late DateTime updatedAt;
}
