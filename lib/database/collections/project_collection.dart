import 'package:isar/isar.dart';
import 'habit_collection.dart'; // For SyncStatus enum

part 'project_collection.g.dart';

@collection
class ProjectCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String projectId;

  @Index()
  late String userId;

  late String title;

  String? description;

  late String colorHex;

  late String iconName;

  DateTime? deadline;

  late double progress;

  late bool isArchived;

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
