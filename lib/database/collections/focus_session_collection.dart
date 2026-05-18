import 'package:isar/isar.dart';
import 'habit_collection.dart'; // For SyncStatus enum

part 'focus_session_collection.g.dart';

@collection
class FocusSessionCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String sessionId;

  @Index()
  late String userId;

  late String? habitId;

  @Index()
  String? taskId;

  @Index()
  String? projectId;

  late String title;

  late int durationMinutes;

  late int completedMinutes;

  late String mode; // e.g. pomodoro, deep_work, flow

  @Index()
  late DateTime startTime;

  late DateTime? endTime;

  late bool isCompleted;

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
