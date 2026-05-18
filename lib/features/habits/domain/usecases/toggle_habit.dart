import '../../../../core/utils/result.dart';
import '../entities/habit_entity.dart';
import '../repositories/habit_repository.dart';

class ToggleHabitUseCase {
  final HabitRepository _repository;

  const ToggleHabitUseCase(this._repository);

  Future<Result<HabitEntity>> call(HabitEntity habit) => _repository.toggleHabit(habit);
}
