import '../entities/settings_entity.dart';

abstract class SettingsRepository {
  Future<SettingsEntity> getSettings(String userId);
  Future<SettingsEntity> updateSettings(SettingsEntity settings);
}
