import 'package:flutter/foundation.dart';

class AnalyticsService {
  Future<void> logEvent(String name, {Map<String, dynamic>? parameters}) async {
    debugPrint('Analytics Event: $name | Params: $parameters');
  }

  Future<void> setUserId(String? userId) async {
    debugPrint('Analytics User ID set to: $userId');
  }

  Future<void> setUserProperty(String name, String value) async {
    debugPrint('Analytics Property: $name = $value');
  }
}
