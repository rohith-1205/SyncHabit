import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/habit_entity.dart';
import '../../domain/repositories/habit_repository.dart';
import '../datasources/local/habit_local_datasource.dart';
import '../models/habit_model.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HabitLocalDataSource _localDataSource;

  const HabitRepositoryImpl(this._localDataSource);

  @override
  Future<Result<List<HabitEntity>>> getHabits() async {
    try {
      final habits = await _localDataSource.getHabits();
      return Result.success(habits);
    } on DatabaseException catch (e) {
      return Result.failure(DatabaseFailure(e.message, e.code));
    } catch (e) {
      return Result.failure(DatabaseFailure('Failed to load habits: $e'));
    }
  }

  @override
  Future<Result<HabitEntity>> toggleHabit(HabitEntity habit) async {
    try {
      final model = HabitModel.fromEntity(habit);
      final updated = await _localDataSource.toggleHabit(model);
      return Result.success(updated);
    } on DatabaseException catch (e) {
      return Result.failure(DatabaseFailure(e.message, e.code));
    } catch (e) {
      return Result.failure(DatabaseFailure('Failed to toggle habit: $e'));
    }
  }

  @override
  Future<Result<HabitEntity>> createHabit(HabitEntity habit) async {
    try {
      final model = HabitModel.fromEntity(habit);
      final created = await _localDataSource.createHabit(model);
      return Result.success(created);
    } on DatabaseException catch (e) {
      return Result.failure(DatabaseFailure(e.message, e.code));
    } catch (e) {
      return Result.failure(DatabaseFailure('Failed to create habit: $e'));
    }
  }

  @override
  Future<Result<HabitEntity>> updateHabit(HabitEntity habit) async {
    try {
      final model = HabitModel.fromEntity(habit);
      final updated = await _localDataSource.updateHabit(model);
      return Result.success(updated);
    } on DatabaseException catch (e) {
      return Result.failure(DatabaseFailure(e.message, e.code));
    } catch (e) {
      return Result.failure(DatabaseFailure('Failed to update habit: $e'));
    }
  }

  @override
  Future<Result<void>> deleteHabit(String id) async {
    try {
      await _localDataSource.deleteHabit(id);
      return Result.success(null);
    } on DatabaseException catch (e) {
      return Result.failure(DatabaseFailure(e.message, e.code));
    } catch (e) {
      return Result.failure(DatabaseFailure('Failed to delete habit: $e'));
    }
  }
}
