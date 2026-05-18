import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/usecases/create_habit.dart';
import '../../domain/usecases/delete_habit.dart';
import '../../domain/usecases/get_habits.dart';
import '../../domain/usecases/toggle_habit.dart';
import '../../domain/usecases/update_habit.dart';
import '../../infrastructure/models/habit_model.dart';

class HabitController extends StateNotifier<AsyncValue<List<HabitModel>>> {
  final GetHabitsUseCase _getHabits;
  final ToggleHabitUseCase _toggleHabit;
  final CreateHabitUseCase _createHabit;
  final UpdateHabitUseCase _updateHabit;
  final DeleteHabitUseCase _deleteHabit;
  final AppConfig _config;
  final AppLogger _logger;

  HabitController({
    required GetHabitsUseCase getHabits,
    required ToggleHabitUseCase toggleHabit,
    required CreateHabitUseCase createHabit,
    required UpdateHabitUseCase updateHabit,
    required DeleteHabitUseCase deleteHabit,
    required AppConfig config,
    required AppLogger logger,
  }) : _getHabits = getHabits,
       _toggleHabit = toggleHabit,
       _createHabit = createHabit,
       _updateHabit = updateHabit,
       _deleteHabit = deleteHabit,
       _config = config,
       _logger = logger,
       super(const AsyncValue.loading()) {
    _logger.info('HabitController initialized in ${_config.environment.name} mode');
    loadHabits();
  }

  Future<void> loadHabits() async {
    _logger.info('Loading habits via GetHabitsUseCase');
    state = const AsyncValue.loading();
    final result = await _getHabits();
    result.fold(
      (failure) {
        _logger.error('Failed to load habits: ${failure.message}');
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (habits) {
        final models = habits.map((e) => HabitModel.fromEntity(e)).toList();
        _logger.info('Successfully loaded ${models.length} habits');
        state = AsyncValue.data(models);
      },
    );
  }

  Future<void> toggleHabit(HabitModel habit) async {
    if (state.value == null) return;
    _logger.info('Toggling habit via ToggleHabitUseCase: ${habit.title}');
    final result = await _toggleHabit(habit);
    result.fold(
      (failure) {
        _logger.error('Failed to toggle habit: ${failure.message}');
      },
      (updated) {
        final updatedModel = HabitModel.fromEntity(updated);
        final updatedList = state.value!.map((h) => h.id == habit.id ? updatedModel : h).toList();
        state = AsyncValue.data(updatedList);
      },
    );
  }

  Future<void> addHabit(HabitModel habit) async {
    if (state.value == null) return;
    _logger.info('Adding habit via CreateHabitUseCase: ${habit.title}');
    final result = await _createHabit(habit);
    result.fold(
      (failure) {
        _logger.error('Failed to create habit: ${failure.message}');
      },
      (created) {
        final createdModel = HabitModel.fromEntity(created);
        state = AsyncValue.data([...state.value!, createdModel]);
      },
    );
  }

  Future<void> updateHabit(HabitModel habit) async {
    if (state.value == null) return;
    _logger.info('Updating habit via UpdateHabitUseCase: ${habit.title}');
    final result = await _updateHabit(habit);
    result.fold(
      (failure) {
        _logger.error('Failed to update habit: ${failure.message}');
      },
      (updated) {
        final updatedModel = HabitModel.fromEntity(updated);
        final updatedList = state.value!.map((h) => h.id == habit.id ? updatedModel : h).toList();
        state = AsyncValue.data(updatedList);
      },
    );
  }

  Future<void> removeHabit(String id) async {
    if (state.value == null) return;
    _logger.info('Removing habit via DeleteHabitUseCase: $id');
    final result = await _deleteHabit(id);
    result.fold(
      (failure) {
        _logger.error('Failed to delete habit: ${failure.message}');
      },
      (_) {
        state = AsyncValue.data(state.value!.where((h) => h.id != id).toList());
      },
    );
  }
}
