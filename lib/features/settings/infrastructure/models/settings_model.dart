import '../../domain/entities/settings_entity.dart';

class SettingsModel extends SettingsEntity {
  const SettingsModel({
    required super.userId,
    required super.notificationsEnabled,
    required super.hapticsEnabled,
    required super.cloudSyncEnabled,
    required super.selectedTheme,
    required super.aiPreferences,
    required super.timezone,
  });

  factory SettingsModel.fromEntity(SettingsEntity entity) {
    return SettingsModel(
      userId: entity.userId,
      notificationsEnabled: entity.notificationsEnabled,
      hapticsEnabled: entity.hapticsEnabled,
      cloudSyncEnabled: entity.cloudSyncEnabled,
      selectedTheme: entity.selectedTheme,
      aiPreferences: entity.aiPreferences,
      timezone: entity.timezone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'notificationsEnabled': notificationsEnabled,
      'hapticsEnabled': hapticsEnabled,
      'cloudSyncEnabled': cloudSyncEnabled,
      'selectedTheme': selectedTheme,
      'aiPreferences': aiPreferences,
      'timezone': timezone,
    };
  }

  SettingsModel copyWith({
    String? userId,
    bool? notificationsEnabled,
    bool? hapticsEnabled,
    bool? cloudSyncEnabled,
    String? selectedTheme,
    String? aiPreferences,
    String? timezone,
  }) {
    return SettingsModel(
      userId: userId ?? this.userId,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      hapticsEnabled: hapticsEnabled ?? this.hapticsEnabled,
      cloudSyncEnabled: cloudSyncEnabled ?? this.cloudSyncEnabled,
      selectedTheme: selectedTheme ?? this.selectedTheme,
      aiPreferences: aiPreferences ?? this.aiPreferences,
      timezone: timezone ?? this.timezone,
    );
  }
}
