import 'dart:convert';
import 'package:isar/isar.dart';
import '../../../../core/utils/logger.dart';
import '../../../../database/database.dart'; // DatabaseService, UserSettingsCollection, SyncStatus
import '../../../../sync/queue/sync_queue.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/repositories/settings_repository.dart';
import '../models/settings_model.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final DatabaseService _dbService;
  final SyncQueue _syncQueue;
  final AppLogger _logger;

  SettingsRepositoryImpl(this._dbService, this._syncQueue, this._logger);

  Isar get _isar => _dbService.isar;

  @override
  Future<SettingsEntity> getSettings(String userId) async {
    _logger.info('Fetching settings for user $userId from Isar...');
    final col = await _isar.userSettingsCollections.filter().userIdEqualTo(userId).findFirst();

    if (col == null) {
      _logger.info('No settings found in Isar for user $userId. Creating defaults...');
      final defaultSettings = SettingsModel(
        userId: userId,
        notificationsEnabled: true,
        hapticsEnabled: true,
        cloudSyncEnabled: true,
        selectedTheme: 'cyberpunk_dark',
        aiPreferences: 'balanced',
        timezone: 'UTC',
      );

      final newCol = UserSettingsCollection()
        ..userId = userId
        ..isDarkMode = true
        ..notificationsEnabled = true
        ..pomodoroLengthMinutes = 25
        ..shortBreakLengthMinutes = 5
        ..longBreakLengthMinutes = 15
        ..themePrimaryColorHex = '#8A2BE2'
        ..soundEffectsEnabled = true
        ..syncStatus = SyncStatus.pending
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      await _isar.writeTxn(() async {
        await _isar.userSettingsCollections.put(newCol);
      });

      return defaultSettings;
    }

    return SettingsModel(
      userId: col.userId,
      notificationsEnabled: col.notificationsEnabled,
      hapticsEnabled: col.soundEffectsEnabled, // map haptics to soundEffectsEnabled
      cloudSyncEnabled: true,
      selectedTheme: col.themePrimaryColorHex,
      aiPreferences: 'balanced',
      timezone: 'UTC',
    );
  }

  @override
  Future<SettingsEntity> updateSettings(SettingsEntity settings) async {
    _logger.info('Updating settings for user ${settings.userId} in Isar...');
    var col = await _isar.userSettingsCollections.filter().userIdEqualTo(settings.userId).findFirst();

    if (col == null) {
      col = UserSettingsCollection()
        ..userId = settings.userId
        ..createdAt = DateTime.now();
    }

    col.notificationsEnabled = settings.notificationsEnabled;
    col.soundEffectsEnabled = settings.hapticsEnabled;
    col.themePrimaryColorHex = settings.selectedTheme;
    col.updatedAt = DateTime.now();
    col.syncStatus = SyncStatus.pending;

    await _isar.writeTxn(() async {
      await _isar.userSettingsCollections.put(col!);
    });

    final model = SettingsModel.fromEntity(settings);
    await _syncQueue.enqueue(
      collectionType: CollectionType.userSettings,
      mutationType: MutationType.update,
      entityId: settings.userId,
      payloadJson: jsonEncode(model.toJson()),
    );

    return settings;
  }
}
