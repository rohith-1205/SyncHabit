import '../../../../core/utils/result.dart';
import '../entities/habit_entity.dart';

abstract class HabitRepository {
  Future<Result<List<HabitEntity>>> getHabits();
  Future<Result<HabitEntity>> toggleHabit(HabitEntity habit);
  Future<Result<HabitEntity>> createHabit(HabitEntity habit);
  Future<Result<HabitEntity>> updateHabit(HabitEntity habit);
  Future<Result<void>> deleteHabit(String id);
}
