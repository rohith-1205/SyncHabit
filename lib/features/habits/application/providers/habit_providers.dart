import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/utils/logger.dart';
import '../../../../database/database.dart';
import '../../../../sync/engine/sync_engine.dart';
import '../../../../sync/queue/sync_queue.dart';
import '../../domain/repositories/habit_repository.dart';
import '../../domain/usecases/create_habit.dart';
import '../../domain/usecases/delete_habit.dart';
import '../../domain/usecases/get_habits.dart';
import '../../domain/usecases/toggle_habit.dart';
import '../../domain/usecases/update_habit.dart';
import '../../infrastructure/datasources/local/habit_local_datasource.dart';
import '../../infrastructure/models/habit_model.dart';
import '../../infrastructure/repositories/habit_repository_impl.dart';
import '../controllers/habit_controller.dart';
import '../../../auth/providers/auth_provider.dart';

final habitLocalDataSourceProvider = Provider<HabitLocalDataSource>((ref) {
  ref.watch(syncEngineProvider);
  final user = ref.watch(currentUserProvider);
  return HabitLocalDataSourceImpl(
    ref.watch(databaseServiceProvider),
    ref.watch(syncQueueProvider),
    ref.watch(appLoggerProvider),
    user?.id ?? 'local_dev_user_101',
  );
});

final habitRepositoryInterfaceProvider = Provider<HabitRepository>((ref) {
  return HabitRepositoryImpl(ref.watch(habitLocalDataSourceProvider));
});

final getHabitsUseCaseProvider = Provider<GetHabitsUseCase>((ref) {
  return GetHabitsUseCase(ref.watch(habitRepositoryInterfaceProvider));
});

final toggleHabitUseCaseProvider = Provider<ToggleHabitUseCase>((ref) {
  return ToggleHabitUseCase(ref.watch(habitRepositoryInterfaceProvider));
});

final createHabitUseCaseProvider = Provider<CreateHabitUseCase>((ref) {
  return CreateHabitUseCase(ref.watch(habitRepositoryInterfaceProvider));
});

final updateHabitUseCaseProvider = Provider<UpdateHabitUseCase>((ref) {
  return UpdateHabitUseCase(ref.watch(habitRepositoryInterfaceProvider));
});

final deleteHabitUseCaseProvider = Provider<DeleteHabitUseCase>((ref) {
  return DeleteHabitUseCase(ref.watch(habitRepositoryInterfaceProvider));
});

final habitNotifierProvider = StateNotifierProvider<HabitController, AsyncValue<List<HabitModel>>>((ref) {
  return HabitController(
    getHabits: ref.watch(getHabitsUseCaseProvider),
    toggleHabit: ref.watch(toggleHabitUseCaseProvider),
    createHabit: ref.watch(createHabitUseCaseProvider),
    updateHabit: ref.watch(updateHabitUseCaseProvider),
    deleteHabit: ref.watch(deleteHabitUseCaseProvider),
    config: ref.watch(appConfigProvider),
    logger: ref.watch(appLoggerProvider),
  );
});

// Legacy repository provider alias for backward compatibility if needed
final habitRepositoryProvider = Provider<dynamic>((ref) {
  return ref.watch(habitRepositoryInterfaceProvider);
});

final habitCompletionsProvider = FutureProvider<List<HabitCompletionCollection>>((ref) async {
  ref.watch(syncEngineProvider);
  final db = ref.watch(databaseServiceProvider);
  final user = ref.watch(currentUserProvider);
  final userId = user?.id ?? 'local_dev_user_101';
  return db.isar.habitCompletionCollections.filter().userIdEqualTo(userId).findAll();
});
