import '../models/habit_model.dart';

class HabitRepository {
  final List<HabitModel> _initialHabits = [
    HabitModel(id: '1', title: 'Neural Alignment (Meditation)', iconName: 'self_improvement', streakCount: 14, isCompletedToday: true, progress: 1.0, category: 'Mind'),
    HabitModel(id: '2', title: 'Deep Work Core (Coding)', iconName: 'code', streakCount: 8, isCompletedToday: false, progress: 0.65, category: 'Work'),
    HabitModel(id: '3', title: 'Hydration Matrix (Water)', iconName: 'water_drop', streakCount: 22, isCompletedToday: true, progress: 1.0, category: 'Health'),
    HabitModel(id: '4', title: 'Physical Protocol (Gym)', iconName: 'fitness_center', streakCount: 5, isCompletedToday: false, progress: 0.2, category: 'Health'),
    HabitModel(id: '5', title: 'Cognitive Expansion (Reading)', iconName: 'menu_book', streakCount: 19, isCompletedToday: false, progress: 0.0, category: 'Mind'),
  ];

  Future<List<HabitModel>> getHabits() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [..._initialHabits];
  }

  Future<HabitModel> toggleHabit(HabitModel habit) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final updated = habit.copyWith(
      isCompletedToday: !habit.isCompletedToday,
      streakCount: habit.isCompletedToday ? habit.streakCount - 1 : habit.streakCount + 1,
      progress: habit.isCompletedToday ? 0.0 : 1.0,
    );
    return updated;
  }
}
