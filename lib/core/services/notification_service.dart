import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../utils/logger.dart';

class NotificationService {
  final AppConfig _config;
  final AppLogger _logger;

  NotificationService(this._config, this._logger);

  Future<void> initialize() async {
    _logger.info('NotificationService initialized for ${_config.appName}');
  }

  Future<void> scheduleReminder(String title, String body, DateTime scheduledTime) async {
    _logger.info('Scheduled Reminder: $title at $scheduledTime');
  }

  Future<void> cancelReminder(String id) async {
    _logger.info('Cancelled Reminder: $id');
  }
}

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref.watch(appConfigProvider), ref.watch(appLoggerProvider));
});
