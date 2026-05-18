import '../../../../core/utils/result.dart';
import '../entities/habit_entity.dart';
import '../repositories/habit_repository.dart';

class GetHabitsUseCase {
  final HabitRepository _repository;

  const GetHabitsUseCase(this._repository);

  Future<Result<List<HabitEntity>>> call() => _repository.getHabits();
}
