import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../core/utils/logger.dart';
import '../collections/local_cache_collection.dart';
import '../collections/habit_collection.dart';
import '../collections/habit_completion_collection.dart';
import '../collections/focus_session_collection.dart';
import '../collections/user_settings_collection.dart';
import '../collections/cached_ai_insight_collection.dart';
import '../collections/sync_mutation_collection.dart';
import '../collections/task_collection.dart';
import '../collections/project_collection.dart';
import '../collections/subtask_collection.dart';
import '../collections/task_analytics_collection.dart';
import '../collections/recurring_task_collection.dart';
import '../migrations/migration_service.dart';

abstract class DatabaseService {
  Isar get isar;
  Future<void> init();
  Future<void> close();
  Future<void> cleanDatabase();
  Future<void> setCache(String key, String payload, {Duration? ttl});
  Future<String?> getCache(String key);
  Future<void> removeCache(String key);
}

class IsarDatabaseServiceImpl implements DatabaseService {
  final AppLogger _logger;
  final DatabaseMigrationService _migrationService;
  late final Isar _isar;

  IsarDatabaseServiceImpl(this._logger, this._migrationService);

  @override
  Isar get isar => _isar;

  @override
  Future<void> init() async {
    _logger.info('Initializing Isar Database Service...');
    try {
      final dir = await getApplicationDocumentsDirectory();
      _isar = await Isar.open(
        [
          LocalCacheCollectionSchema,
          HabitCollectionSchema,
          HabitCompletionCollectionSchema,
          FocusSessionCollectionSchema,
          UserSettingsCollectionSchema,
          CachedAiInsightCollectionSchema,
          SyncMutationCollectionSchema,
          TaskCollectionSchema,
          ProjectCollectionSchema,
          SubtaskCollectionSchema,
          TaskAnalyticsCollectionSchema,
          RecurringTaskCollectionSchema,
        ],
        directory: dir.path,
        name: 'synchabit_offline_db',
        inspector: true, // Enable Isar Inspector for debugging
      );

      await _migrationService.runMigrations(_isar);
      _logger.info('Isar Database initialized successfully at ${dir.path}');
    } catch (e, st) {
      _logger.error('Failed to initialize Isar Database', e, st);
      rethrow;
    }
  }

  @override
  Future<void> close() async {
    _logger.info('Closing Isar Database...');
    if (_isar.isOpen) {
      await _isar.close();
      _logger.info('Isar Database closed.');
    }
  }

  @override
  Future<void> cleanDatabase() async {
    _logger.warning('Cleaning entire Isar Database...');
    await _isar.writeTxn(() async {
      await _isar.clear();
    });
    _logger.info('Isar Database cleaned.');
  }

  @override
  Future<void> setCache(String key, String payload, {Duration? ttl}) async {
    final now = DateTime.now();
    final expiresAt = ttl != null ? now.add(ttl) : null;

    final entry = LocalCacheCollection()
      ..cacheKey = key
      ..payload = payload
      ..updatedAt = now
      ..expiresAt = expiresAt;

    await _isar.writeTxn(() async {
      await _isar.localCacheCollections.put(entry);
    });
    _logger.info('Cache set for key: $key');
  }

  @override
  Future<String?> getCache(String key) async {
    final entry = await _isar.localCacheCollections.filter().cacheKeyEqualTo(key).findFirst();

    if (entry == null) return null;

    if (entry.expiresAt != null && entry.expiresAt!.isBefore(DateTime.now())) {
      _logger.info('Cache expired for key: $key');
      await removeCache(key);
      return null;
    }

    return entry.payload;
  }

  @override
  Future<void> removeCache(String key) async {
    await _isar.writeTxn(() async {
      await _isar.localCacheCollections.filter().cacheKeyEqualTo(key).deleteAll();
    });
    _logger.info('Cache removed for key: $key');
  }
}
