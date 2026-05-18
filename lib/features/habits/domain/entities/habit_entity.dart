class HabitEntity {
  final String id;
  final String title;
  final String iconName;
  final int streakCount;
  final bool isCompletedToday;
  final double progress; // 0.0 to 1.0
  final String category;

  const HabitEntity({
    required this.id,
    required this.title,
    required this.iconName,
    required this.streakCount,
    required this.isCompletedToday,
    required this.progress,
    required this.category,
  });

  HabitEntity copyWith({
    String? id,
    String? title,
    String? iconName,
    int? streakCount,
    bool? isCompletedToday,
    double? progress,
    String? category,
  }) {
    return HabitEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      iconName: iconName ?? this.iconName,
      streakCount: streakCount ?? this.streakCount,
      isCompletedToday: isCompletedToday ?? this.isCompletedToday,
      progress: progress ?? this.progress,
      category: category ?? this.category,
    );
  }
}
