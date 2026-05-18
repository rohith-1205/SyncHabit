enum TaskPriority { low, medium, high, critical }

enum TaskState { pending, scheduled, inProgress, completed, archived, overdue }

class SubtaskEntity {
  final String id;
  final String title;
  final bool isCompleted;
  final int orderIndex;

  const SubtaskEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.orderIndex = 0,
  });

  SubtaskEntity copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    int? orderIndex,
  }) {
    return SubtaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'orderIndex': orderIndex,
    };
  }

  factory SubtaskEntity.fromJson(Map<String, dynamic> json) {
    return SubtaskEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      orderIndex: json['orderIndex'] as int? ?? 0,
    );
  }
}

class TaskEntity {
  final String id;
  final String userId;
  final String? projectId;
  final String title;
  final String? description;
  final TaskPriority priority;
  final TaskState state;
  final String category;
  final List<String> tags;
  final List<SubtaskEntity> subtasks;
  final String? notes;
  final DateTime? dueDate;
  final DateTime? scheduledStart;
  final DateTime? scheduledEnd;
  final int? estimatedDurationMinutes;
  final int actualDurationMinutes;
  final DateTime? completedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TaskEntity({
    required this.id,
    required this.userId,
    this.projectId,
    required this.title,
    this.description,
    required this.priority,
    required this.state,
    required this.category,
    required this.tags,
    required this.subtasks,
    this.notes,
    this.dueDate,
    this.scheduledStart,
    this.scheduledEnd,
    this.estimatedDurationMinutes,
    required this.actualDurationMinutes,
    this.completedAt,
    required this.createdAt,
    required this.updatedAt,
  });
}
