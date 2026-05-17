import 'package:flutter/foundation.dart';

class NotificationService {
  Future<void> initialize() async {
    debugPrint('NotificationService initialized');
  }

  Future<void> scheduleReminder(String title, String body, DateTime scheduledTime) async {
    debugPrint('Scheduled Reminder: $title at $scheduledTime');
  }

  Future<void> cancelReminder(String id) async {
    debugPrint('Cancelled Reminder: $id');
  }
}
