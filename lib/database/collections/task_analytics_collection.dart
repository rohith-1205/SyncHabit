import 'package:isar/isar.dart';
import 'habit_collection.dart'; // For SyncStatus enum

part 'task_analytics_collection.g.dart';

@collection
class TaskAnalyticsCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String analyticsId;

  @Index()
  late String userId;

  late String period;

  late DateTime startDate;

  late DateTime endDate;

  late int totalTasksCreated;

  late int totalTasksCompleted;

  late int totalOverdueTasks;

  late int totalFocusTimeMinutes;

  late double completionRate;

  late double consistencyScore;

  late double completionVelocity;

  List<String>? procrastinationPatterns;

  List<String>? aiGeneratedInsights;

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
