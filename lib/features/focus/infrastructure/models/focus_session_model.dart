import '../../domain/entities/focus_session_entity.dart';

class FocusSessionModel extends FocusSessionEntity {
  const FocusSessionModel({
    required super.sessionId,
    required super.userId,
    super.habitId,
    required super.title,
    required super.durationMinutes,
    required super.completedMinutes,
    required super.mode,
    required super.startTime,
    super.endTime,
    required super.isCompleted,
    required super.interruptionsCount,
  });

  factory FocusSessionModel.fromEntity(FocusSessionEntity entity) {
    return FocusSessionModel(
      sessionId: entity.sessionId,
      userId: entity.userId,
      habitId: entity.habitId,
      title: entity.title,
      durationMinutes: entity.durationMinutes,
      completedMinutes: entity.completedMinutes,
      mode: entity.mode,
      startTime: entity.startTime,
      endTime: entity.endTime,
      isCompleted: entity.isCompleted,
      interruptionsCount: entity.interruptionsCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      'userId': userId,
      'habitId': habitId,
      'title': title,
      'durationMinutes': durationMinutes,
      'completedMinutes': completedMinutes,
      'mode': mode,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'isCompleted': isCompleted,
      'interruptionsCount': interruptionsCount,
    };
  }

  FocusSessionModel copyWith({
    String? sessionId,
    String? userId,
    String? habitId,
    String? title,
    int? durationMinutes,
    int? completedMinutes,
    String? mode,
    DateTime? startTime,
    DateTime? endTime,
    bool? isCompleted,
    int? interruptionsCount,
  }) {
    return FocusSessionModel(
      sessionId: sessionId ?? this.sessionId,
      userId: userId ?? this.userId,
      habitId: habitId ?? this.habitId,
      title: title ?? this.title,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      completedMinutes: completedMinutes ?? this.completedMinutes,
      mode: mode ?? this.mode,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isCompleted: isCompleted ?? this.isCompleted,
      interruptionsCount: interruptionsCount ?? this.interruptionsCount,
    );
  }
}
