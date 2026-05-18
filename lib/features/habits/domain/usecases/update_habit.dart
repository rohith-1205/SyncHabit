import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../entities/habit_entity.dart';
import '../repositories/habit_repository.dart';

class UpdateHabitUseCase {
  final HabitRepository _repository;

  const UpdateHabitUseCase(this._repository);

  Future<Result<HabitEntity>> call(HabitEntity habit) {
    return _repository.updateHabit(habit);
  }
}
