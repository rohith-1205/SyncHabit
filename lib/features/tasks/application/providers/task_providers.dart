import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/logger.dart';
import '../../../../database/database.dart';
import '../../../../sync/engine/sync_engine.dart';
import '../../../../sync/queue/sync_queue.dart';
import '../../../auth/application/providers/auth_providers.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../../infrastructure/repositories/task_repository_impl.dart';
import '../controllers/task_controller.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  ref.watch(syncEngineProvider);
  final user = ref.watch(currentUserProvider);
  final userId = user?.id ?? 'local_dev_user_101';
  return TaskRepositoryImpl(
    ref.watch(databaseServiceProvider),
    ref.watch(syncQueueProvider),
    ref.watch(appLoggerProvider),
    userId,
  );
});

final taskNotifierProvider = StateNotifierProvider<TaskController, AsyncValue<List<TaskEntity>>>((ref) {
  return TaskController(
    ref.watch(taskRepositoryProvider),
    () => ref.read(authNotifierProvider).value?.isPro ?? false,
    ref.watch(appLoggerProvider),
  );
});
