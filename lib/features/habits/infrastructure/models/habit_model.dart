import '../../domain/entities/habit_entity.dart';

class HabitModel extends HabitEntity {
  const HabitModel({
    required super.id,
    required super.title,
    required super.iconName,
    required super.streakCount,
    required super.isCompletedToday,
    required super.progress,
    required super.category,
  });

  factory HabitModel.fromEntity(HabitEntity entity) {
    return HabitModel(
      id: entity.id,
      title: entity.title,
      iconName: entity.iconName,
      streakCount: entity.streakCount,
      isCompletedToday: entity.isCompletedToday,
      progress: entity.progress,
      category: entity.category,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'iconName': iconName,
      'streakCount': streakCount,
      'isCompletedToday': isCompletedToday,
      'progress': progress,
      'category': category,
    };
  }

  @override
  HabitModel copyWith({
    String? id,
    String? title,
    String? iconName,
    int? streakCount,
    bool? isCompletedToday,
    double? progress,
    String? category,
  }) {
    return HabitModel(
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
