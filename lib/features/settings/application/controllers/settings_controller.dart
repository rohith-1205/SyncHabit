import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../infrastructure/models/settings_model.dart';

class SettingsController extends StateNotifier<AsyncValue<SettingsModel>> {
  final SettingsRepository _repository;
  final String _userId;

  SettingsController(this._repository, this._userId) : super(const AsyncValue.loading()) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    state = const AsyncValue.loading();
    try {
      final settings = await _repository.getSettings(_userId);
      state = AsyncValue.data(settings as SettingsModel);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateNotifications(bool enabled) async {
    if (state.value == null) return;
    final updated = state.value!.copyWith(notificationsEnabled: enabled);
    state = AsyncValue.data(updated);
    await _repository.updateSettings(updated);
  }

  Future<void> updateHaptics(bool enabled) async {
    if (state.value == null) return;
    final updated = state.value!.copyWith(hapticsEnabled: enabled);
    state = AsyncValue.data(updated);
    await _repository.updateSettings(updated);
  }

  Future<void> updateCloudSync(bool enabled) async {
    if (state.value == null) return;
    final updated = state.value!.copyWith(cloudSyncEnabled: enabled);
    state = AsyncValue.data(updated);
    await _repository.updateSettings(updated);
  }
}
