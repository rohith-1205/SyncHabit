class SettingsEntity {
  final String userId;
  final bool notificationsEnabled;
  final bool hapticsEnabled;
  final bool cloudSyncEnabled;
  final String selectedTheme;
  final String aiPreferences;
  final String timezone;

  const SettingsEntity({
    required this.userId,
    required this.notificationsEnabled,
    required this.hapticsEnabled,
    required this.cloudSyncEnabled,
    required this.selectedTheme,
    required this.aiPreferences,
    required this.timezone,
  });
}
