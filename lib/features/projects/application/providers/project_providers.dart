import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/logger.dart';
import '../../../../database/database.dart';
import '../../../../sync/queue/sync_queue.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/project_repository.dart';
import '../../infrastructure/models/project_model.dart';
import '../../infrastructure/repositories/project_repository_impl.dart';
import '../controllers/project_controller.dart';
import '../../../tasks/application/providers/task_providers.dart';
import '../../../tasks/domain/entities/task_entity.dart';

import '../../../auth/providers/auth_provider.dart';

final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  final user = ref.watch(currentUserProvider);
  final userId = user?.id ?? 'local_dev_user_101';
  return ProjectRepositoryImpl(
    ref.watch(databaseServiceProvider),
    ref.watch(syncQueueProvider),
    ref.watch(appLoggerProvider),
    userId,
  );
});

final projectNotifierProvider = StateNotifierProvider<ProjectController, AsyncValue<List<ProjectEntity>>>((ref) {
  return ProjectController(
    ref.watch(projectRepositoryProvider),
    ref.watch(appLoggerProvider),
  );
});

final projectListWithProgressProvider = Provider<List<ProjectEntity>>((ref) {
  final projects = ref.watch(projectNotifierProvider).value ?? [];
  final tasks = ref.watch(taskNotifierProvider).value ?? [];

  return projects.map((proj) {
    final projTasks = tasks.where((t) => t.projectId == proj.id).toList();
    if (projTasks.isEmpty) return proj;

    final completed = projTasks.where((t) => t.state == TaskState.completed).length;
    final calculatedProgress = completed / projTasks.length;

    return ProjectModel.fromEntity(proj).copyWith(progress: calculatedProgress);
  }).toList();
});
