import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/logger.dart';
import '../../../../database/database.dart';
import '../../../../sync/queue/sync_queue.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../infrastructure/models/settings_model.dart';
import '../../infrastructure/repositories/settings_repository_impl.dart';
import '../controllers/settings_controller.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl(
    ref.watch(databaseServiceProvider),
    ref.watch(syncQueueProvider),
    ref.watch(appLoggerProvider),
  );
});

final settingsNotifierProvider = StateNotifierProvider<SettingsController, AsyncValue<SettingsModel>>((ref) {
  final user = ref.watch(currentUserProvider);
  return SettingsController(
    ref.watch(settingsRepositoryProvider),
    user?.id ?? 'default_user',
  );
});
