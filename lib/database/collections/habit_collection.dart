import 'package:isar/isar.dart';

part 'habit_collection.g.dart';

enum SyncStatus {
  synced,
  pendingUpload,
  pendingUpdate,
  pendingDelete,
  conflict,
  // Legacy values for backward compatibility and smooth migration:
  pending,
  failed,
}

@collection
class HabitCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String habitId;

  @Index()
  late String userId;

  late String title;

  late String? description;

  late String frequency; // e.g. daily, weekly

  late List<int> targetDays; // e.g. [1, 2, 3, 4, 5] for Mon-Fri

  late int targetCount;

  late String category;

  late String colorHex;

  late String iconName;

  late int streakCount;

  late bool isCompletedToday;

  late double progress;

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
