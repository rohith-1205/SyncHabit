import 'package:flutter/foundation.dart';

class AppLogger {
  static void info(String message) {
    debugPrint('[INFO] $message');
  }

  static void warning(String message) {
    debugPrint('[WARNING] $message');
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    debugPrint('[ERROR] $message | Error: $error | StackTrace: $stackTrace');
  }
}
