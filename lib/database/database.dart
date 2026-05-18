import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/utils/logger.dart';
import 'migrations/migration_service.dart';
import 'services/database_service.dart';

export 'collections/local_cache_collection.dart';
export 'collections/habit_collection.dart';
export 'collections/habit_completion_collection.dart';
export 'collections/focus_session_collection.dart';
export 'collections/user_settings_collection.dart';
export 'collections/cached_ai_insight_collection.dart';
export 'collections/sync_mutation_collection.dart';
export 'collections/task_collection.dart';
export 'collections/project_collection.dart';
export 'collections/subtask_collection.dart';
export 'collections/task_analytics_collection.dart';
export 'collections/recurring_task_collection.dart';
export 'converters/json_converter.dart';
export 'migrations/migration_service.dart';
export 'services/database_service.dart';

final databaseMigrationServiceProvider = Provider<DatabaseMigrationService>((ref) {
  return DatabaseMigrationService(ref.watch(appLoggerProvider));
});

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return IsarDatabaseServiceImpl(
    ref.watch(appLoggerProvider),
    ref.watch(databaseMigrationServiceProvider),
  );
});
