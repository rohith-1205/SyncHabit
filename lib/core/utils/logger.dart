import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';

class AppLogger {
  final AppConfig _config;

  AppLogger(this._config);

  void info(String message) {
    if (!_config.enableLogging) return;
    debugPrint('[INFO] $message');
  }

  void warning(String message) {
    if (!_config.enableLogging) return;
    debugPrint('[WARNING] $message');
  }

  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    if (!_config.enableLogging) return;
    debugPrint('[ERROR] $message | Error: $error | StackTrace: $stackTrace');
  }
}

final appLoggerProvider = Provider<AppLogger>((ref) {
  return AppLogger(ref.watch(appConfigProvider));
});
