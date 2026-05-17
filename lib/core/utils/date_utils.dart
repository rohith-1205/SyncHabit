import 'package:intl/intl.dart';

class AppDateUtils {
  static String formatShortDate(DateTime date) {
    return DateFormat('MMM d').format(date);
  }

  static String formatFullDate(DateTime date) {
    return DateFormat('EEEE, MMMM d, yyyy').format(date);
  }

  static String formatTime(DateTime date) {
    return DateFormat('h:mm a').format(date);
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  static List<DateTime> getWeekDays(DateTime current) {
    final startOfWeek = current.subtract(Duration(days: current.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }
}
