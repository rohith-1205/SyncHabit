import 'package:isar/isar.dart';
import 'habit_collection.dart'; // For SyncStatus enum

part 'recurring_task_collection.g.dart';

@collection
class RecurringTaskCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String recurringTaskId;

  @Index()
  late String userId;

  late String title;

  String? description;

  late String priority;

  late String category;

  late String repeatInterval; // 'daily', 'weekly', 'monthly', 'custom'

  List<int>? customRepeatDays;

  DateTime? repeatUntilDate;

  int? repeatCountLimit;

  late int instancesGeneratedCount;

  late int instancesCompletedCount;

  late int currentStreak;

  late int bestStreak;

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
