import '../../../../core/utils/result.dart';
import '../repositories/habit_repository.dart';

class DeleteHabitUseCase {
  final HabitRepository _repository;

  const DeleteHabitUseCase(this._repository);

  Future<Result<void>> call(String id) => _repository.deleteHabit(id);
}
