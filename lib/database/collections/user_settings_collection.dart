import 'package:isar/isar.dart';
import 'habit_collection.dart'; // For SyncStatus enum

part 'user_settings_collection.g.dart';

@collection
class UserSettingsCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String userId;

  late bool isDarkMode;

  late bool notificationsEnabled;

  late int pomodoroLengthMinutes;

  late int shortBreakLengthMinutes;

  late int longBreakLengthMinutes;

  late String themePrimaryColorHex;

  late bool soundEffectsEnabled;

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
