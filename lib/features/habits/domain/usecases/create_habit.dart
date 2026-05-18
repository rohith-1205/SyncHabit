import '../../../../core/utils/result.dart';
import '../entities/habit_entity.dart';
import '../repositories/habit_repository.dart';

class CreateHabitUseCase {
  final HabitRepository _repository;

  const CreateHabitUseCase(this._repository);

  Future<Result<HabitEntity>> call(HabitEntity habit) => _repository.createHabit(habit);
}
