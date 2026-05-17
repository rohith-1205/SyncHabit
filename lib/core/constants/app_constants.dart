class AppConstants {
  static const String appTitle = 'SyncHabit';
  static const String habitBox = 'habit_box';
  static const String focusBox = 'focus_box';
  static const String settingsBox = 'settings_box';
  
  // Animation Durations
  static const Duration quickAnimation = Duration(milliseconds: 200);
  static const Duration normalAnimation = Duration(milliseconds: 350);
  static const Duration slowAnimation = Duration(milliseconds: 600);

  // Free Tier Limitations
  static const int maxFreeHabits = 5;
  static const int maxFreeFocusSessions = 3;
  static const int maxFreeDuels = 2;
  static const int maxFreeAnalyticsDays = 7;
}
