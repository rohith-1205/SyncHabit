import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/logger.dart';
import '../../../../database/database.dart';
import '../../../../sync/queue/sync_queue.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../domain/entities/focus_session_entity.dart';
import '../../domain/repositories/focus_repository.dart';
import '../../infrastructure/repositories/focus_repository_impl.dart';
import '../controllers/focus_controller.dart';

final focusRepositoryProvider = Provider<FocusRepository>((ref) {
  return FocusRepositoryImpl(
    ref.watch(databaseServiceProvider),
    ref.watch(syncQueueProvider),
    ref.watch(appLoggerProvider),
  );
});

final focusNotifierProvider = StateNotifierProvider<FocusController, AsyncValue<FocusControllerState>>((ref) {
  final user = ref.watch(currentUserProvider);
  return FocusController(
    ref.watch(focusRepositoryProvider),
    user?.id ?? 'default_user',
  );
});

final completedFocusSessionsProvider = FutureProvider<List<FocusSessionEntity>>((ref) async {
  final user = ref.watch(currentUserProvider);
  final repo = ref.watch(focusRepositoryProvider);
  return repo.getCompletedSessions(user?.id ?? 'default_user');
});
