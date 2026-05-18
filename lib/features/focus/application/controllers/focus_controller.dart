import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/repositories/focus_repository.dart';
import '../../infrastructure/models/focus_session_model.dart';

class FocusControllerState {
  final FocusSessionModel? activeSession;
  final bool isRunning;
  final int remainingSeconds;

  const FocusControllerState({
    this.activeSession,
    this.isRunning = false,
    this.remainingSeconds = 45 * 60,
  });

  FocusControllerState copyWith({
    FocusSessionModel? activeSession,
    bool? isRunning,
    int? remainingSeconds,
  }) {
    return FocusControllerState(
      activeSession: activeSession ?? this.activeSession,
      isRunning: isRunning ?? this.isRunning,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}

class FocusController extends StateNotifier<AsyncValue<FocusControllerState>> {
  final FocusRepository _repository;
  final String _userId;
  Timer? _timer;

  FocusController(this._repository, this._userId) : super(const AsyncValue.loading()) {
    restoreActiveSession();
  }

  Future<void> restoreActiveSession() async {
    state = const AsyncValue.loading();
    try {
      final active = await _repository.getActiveSession(_userId);
      if (active != null) {
        final elapsed = DateTime.now().difference(active.startTime).inSeconds;
        final totalSec = active.durationMinutes * 60;
        final rem = totalSec - elapsed;

        if (rem > 0) {
          state = AsyncValue.data(FocusControllerState(
            activeSession: active as FocusSessionModel,
            isRunning: true,
            remainingSeconds: rem,
          ));
          _startInternalTimer();
        } else {
          // Session finished while offline/background
          final completed = (active as FocusSessionModel).copyWith(isCompleted: true, endTime: DateTime.now(), completedMinutes: active.durationMinutes);
          await _repository.saveSession(completed);
          state = AsyncValue.data(FocusControllerState(activeSession: completed, isRunning: false, remainingSeconds: 0));
        }
      } else {
        state = const AsyncValue.data(FocusControllerState(activeSession: null, isRunning: false, remainingSeconds: 45 * 60));
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void _startInternalTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.value == null) return;
      final curr = state.value!;
      if (curr.isRunning && curr.remainingSeconds > 0) {
        state = AsyncValue.data(curr.copyWith(remainingSeconds: curr.remainingSeconds - 1));
      } else if (curr.remainingSeconds <= 0 && curr.isRunning) {
        completeSession();
      }
    });
  }

  void togglePlayPause() {
    if (state.value == null) return;
    final curr = state.value!;
    final nextRunning = !curr.isRunning;
    state = AsyncValue.data(curr.copyWith(isRunning: nextRunning));
    if (nextRunning) {
      _startInternalTimer();
    } else {
      _timer?.cancel();
      if (curr.activeSession != null) {
        final updated = curr.activeSession!.copyWith(interruptionsCount: curr.activeSession!.interruptionsCount + 1);
        _repository.saveSession(updated);
        state = AsyncValue.data(state.value!.copyWith(activeSession: updated));
      }
    }
  }

  Future<void> completeSession() async {
    _timer?.cancel();
    if (state.value == null || state.value!.activeSession == null) return;
    final curr = state.value!;
    final completed = curr.activeSession!.copyWith(
      isCompleted: true,
      endTime: DateTime.now(),
      completedMinutes: curr.activeSession!.durationMinutes - (curr.remainingSeconds ~/ 60),
    );
    await _repository.saveSession(completed);
    state = AsyncValue.data(curr.copyWith(activeSession: completed, isRunning: false, remainingSeconds: 0));
  }

  Future<void> addFiveMinutes() async {
    if (state.value == null || state.value!.activeSession == null) return;
    final curr = state.value!;
    final updatedDur = curr.activeSession!.durationMinutes + 5;
    final updatedSession = curr.activeSession!.copyWith(durationMinutes: updatedDur);
    await _repository.saveSession(updatedSession);
    state = AsyncValue.data(curr.copyWith(activeSession: updatedSession, remainingSeconds: curr.remainingSeconds + (5 * 60)));
  }

  Future<void> reduceToTenMinutes() async {
    if (state.value == null || state.value!.activeSession == null) return;
    final curr = state.value!;
    final updatedSession = curr.activeSession!.copyWith(durationMinutes: 10);
    await _repository.saveSession(updatedSession);
    state = AsyncValue.data(curr.copyWith(activeSession: updatedSession, remainingSeconds: 10 * 60));
  }

  Future<void> switchToReading() async {
    if (state.value == null || state.value!.activeSession == null) return;
    final curr = state.value!;
    final updatedSession = curr.activeSession!.copyWith(title: 'Reading Habit', durationMinutes: 30);
    await _repository.saveSession(updatedSession);
    state = AsyncValue.data(curr.copyWith(activeSession: updatedSession, remainingSeconds: 30 * 60));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
