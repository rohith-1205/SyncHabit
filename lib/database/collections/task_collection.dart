import 'package:isar/isar.dart';
import 'habit_collection.dart'; // For SyncStatus enum

part 'task_collection.g.dart';

@collection
class TaskCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String taskId;

  @Index()
  late String userId;

  @Index()
  String? projectId;

  late String title;

  String? description;

  late String priority; // low, medium, high, critical

  late String state; // pending, scheduled, inProgress, completed, archived

  late String category;

  List<String>? tags;

  List<String>? subtasksJson; // Serialized list of subtasks DTOs

  String? notes;

  DateTime? completedAt;

  DateTime? dueDate;

  DateTime? scheduledStart;

  DateTime? scheduledEnd;

  int? estimatedDurationMinutes;

  int? actualDurationMinutes;

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
