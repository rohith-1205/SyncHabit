import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../utils/logger.dart';

class AnalyticsService {
  final AppConfig _config;
  final AppLogger _logger;

  AnalyticsService(this._config, this._logger);

  Future<void> logEvent(String name, {Map<String, dynamic>? parameters}) async {
    _logger.info('Analytics Event [${_config.environment.name}]: $name | Params: $parameters');
  }

  Future<void> setUserId(String? userId) async {
    _logger.info('Analytics User ID set to: $userId');
  }

  Future<void> setUserProperty(String name, String value) async {
    _logger.info('Analytics Property: $name = $value');
  }
}

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  return AnalyticsService(ref.watch(appConfigProvider), ref.watch(appLoggerProvider));
});
