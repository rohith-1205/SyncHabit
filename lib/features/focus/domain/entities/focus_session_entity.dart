class FocusSessionEntity {
  final String sessionId;
  final String userId;
  final String? habitId;
  final String title;
  final int durationMinutes;
  final int completedMinutes;
  final String mode; // pomodoro, deep_work
  final DateTime startTime;
  final DateTime? endTime;
  final bool isCompleted;
  final int interruptionsCount;

  const FocusSessionEntity({
    required this.sessionId,
    required this.userId,
    this.habitId,
    required this.title,
    required this.durationMinutes,
    required this.completedMinutes,
    required this.mode,
    required this.startTime,
    this.endTime,
    required this.isCompleted,
    required this.interruptionsCount,
  });
}
