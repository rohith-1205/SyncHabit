import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/habit_model.dart';
import '../repositories/habit_repository.dart';

final habitRepositoryProvider = Provider<HabitRepository>((ref) {
  return HabitRepository();
});

class HabitNotifier extends StateNotifier<AsyncValue<List<HabitModel>>> {
  final HabitRepository _repository;

  HabitNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadHabits();
  }

  Future<void> loadHabits() async {
    state = const AsyncValue.loading();
    try {
      final habits = await _repository.getHabits();
      state = AsyncValue.data(habits);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> toggleHabit(HabitModel habit) async {
    if (state.value == null) return;
    try {
      final updatedHabit = await _repository.toggleHabit(habit);
      final updatedList = state.value!.map((h) => h.id == habit.id ? updatedHabit : h).toList();
      state = AsyncValue.data(updatedList);
    } catch (e, st) {
      // Revert or log error
    }
  }

  void addHabit(HabitModel habit) {
    if (state.value != null) {
      state = AsyncValue.data([...state.value!, habit]);
    }
  }

  void removeHabit(String id) {
    if (state.value != null) {
      state = AsyncValue.data(state.value!.where((h) => h.id != id).toList());
    }
  }
}

final habitNotifierProvider = StateNotifierProvider<HabitNotifier, AsyncValue<List<HabitModel>>>((ref) {
  return HabitNotifier(ref.watch(habitRepositoryProvider));
});
