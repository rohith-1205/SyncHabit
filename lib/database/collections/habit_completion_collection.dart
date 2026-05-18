import 'package:isar/isar.dart';
import 'habit_collection.dart'; // For SyncStatus enum

part 'habit_completion_collection.g.dart';

@collection
class HabitCompletionCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String completionId;

  @Index()
  late String habitId;

  @Index()
  late String userId;

  @Index()
  late DateTime completedAt;

  late int count;

  late String? notes;

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
