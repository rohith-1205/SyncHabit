import 'dart:convert';
import '../../../../database/collections/habit_collection.dart'; // SyncStatus
import '../../../../database/collections/task_collection.dart';
import '../../domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.id,
    required super.userId,
    super.projectId,
    required super.title,
    super.description,
    required super.priority,
    required super.state,
    required super.category,
    required super.tags,
    required super.subtasks,
    super.notes,
    super.dueDate,
    super.scheduledStart,
    super.scheduledEnd,
    super.estimatedDurationMinutes,
    required super.actualDurationMinutes,
    super.completedAt,
    required super.createdAt,
    required super.updatedAt,
  });

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      userId: entity.userId,
      projectId: entity.projectId,
      title: entity.title,
      description: entity.description,
      priority: entity.priority,
      state: entity.state,
      category: entity.category,
      tags: entity.tags,
      subtasks: entity.subtasks,
      notes: entity.notes,
      dueDate: entity.dueDate,
      scheduledStart: entity.scheduledStart,
      scheduledEnd: entity.scheduledEnd,
      estimatedDurationMinutes: entity.estimatedDurationMinutes,
      actualDurationMinutes: entity.actualDurationMinutes,
      completedAt: entity.completedAt,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  factory TaskModel.fromCollection(TaskCollection col) {
    TaskPriority priority = TaskPriority.medium;
    try {
      priority = TaskPriority.values.firstWhere((e) => e.name == col.priority);
    } catch (_) {}

    TaskState state = TaskState.pending;
    try {
      state = TaskState.values.firstWhere((e) => e.name == col.state);
    } catch (_) {}

    List<SubtaskEntity> subtasks = [];
    if (col.subtasksJson != null) {
      try {
        subtasks = col.subtasksJson!
            .map((jsonStr) => SubtaskEntity.fromJson(jsonDecode(jsonStr)))
            .toList();
      } catch (_) {}
    }

    return TaskModel(
      id: col.taskId,
      userId: col.userId,
      projectId: col.projectId,
      title: col.title,
      description: col.description,
      priority: priority,
      state: state,
      category: col.category,
      tags: col.tags ?? [],
      subtasks: subtasks,
      notes: col.notes,
      dueDate: col.dueDate,
      scheduledStart: col.scheduledStart,
      scheduledEnd: col.scheduledEnd,
      estimatedDurationMinutes: col.estimatedDurationMinutes,
      actualDurationMinutes: col.actualDurationMinutes ?? 0,
      completedAt: col.completedAt,
      createdAt: col.createdAt,
      updatedAt: col.updatedAt,
    );
  }

  TaskCollection toCollection() {
    return TaskCollection()
      ..taskId = id
      ..userId = userId
      ..projectId = projectId
      ..title = title
      ..description = description
      ..priority = priority.name
      ..state = state.name
      ..category = category
      ..tags = tags
      ..subtasksJson = subtasks.map((st) => jsonEncode(st.toJson())).toList()
      ..notes = notes
      ..dueDate = dueDate
      ..scheduledStart = scheduledStart
      ..scheduledEnd = scheduledEnd
      ..estimatedDurationMinutes = estimatedDurationMinutes
      ..actualDurationMinutes = actualDurationMinutes
      ..completedAt = completedAt
      ..syncStatus = SyncStatus.pending
      ..createdAt = createdAt
      ..updatedAt = updatedAt;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'projectId': projectId,
      'title': title,
      'description': description,
      'priority': priority.name,
      'state': state.name,
      'category': category,
      'tags': tags,
      'subtasks': subtasks.map((st) => st.toJson()).toList(),
      'notes': notes,
      'completedAt': completedAt?.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
      'scheduledStart': scheduledStart?.toIso8601String(),
      'scheduledEnd': scheduledEnd?.toIso8601String(),
      'estimatedDurationMinutes': estimatedDurationMinutes,
      'actualDurationMinutes': actualDurationMinutes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    TaskPriority priority = TaskPriority.medium;
    try {
      priority =
          TaskPriority.values.firstWhere((e) => e.name == json['priority']);
    } catch (_) {}

    TaskState state = TaskState.pending;
    try {
      state = TaskState.values.firstWhere((e) => e.name == json['state']);
    } catch (_) {}

    List<SubtaskEntity> subtasks = [];
    if (json['subtasks'] != null) {
      subtasks = (json['subtasks'] as List)
          .map((item) => SubtaskEntity.fromJson(item))
          .toList();
    }

    return TaskModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      projectId: json['projectId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      priority: priority,
      state: state,
      category: json['category'] as String? ?? 'General',
      tags: (json['tags'] as List?)?.map((e) => e as String).toList() ?? [],
      subtasks: subtasks,
      notes: json['notes'] as String?,
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      scheduledStart: json['scheduledStart'] != null
          ? DateTime.parse(json['scheduledStart'])
          : null,
      scheduledEnd: json['scheduledEnd'] != null
          ? DateTime.parse(json['scheduledEnd'])
          : null,
      estimatedDurationMinutes: json['estimatedDurationMinutes'] as int?,
      actualDurationMinutes: json['actualDurationMinutes'] as int? ?? 0,
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
    );
  }

  static const _keepCompletedAt = Object();

  TaskModel copyWith({
    String? id,
    String? userId,
    String? projectId,
    String? title,
    String? description,
    TaskPriority? priority,
    TaskState? state,
    String? category,
    List<String>? tags,
    List<SubtaskEntity>? subtasks,
    String? notes,
    DateTime? dueDate,
    DateTime? scheduledStart,
    DateTime? scheduledEnd,
    int? estimatedDurationMinutes,
    int? actualDurationMinutes,
    Object? completedAt = _keepCompletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      projectId: projectId ?? this.projectId,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      state: state ?? this.state,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      subtasks: subtasks ?? this.subtasks,
      notes: notes ?? this.notes,
      dueDate: dueDate ?? this.dueDate,
      scheduledStart: scheduledStart ?? this.scheduledStart,
      scheduledEnd: scheduledEnd ?? this.scheduledEnd,
      estimatedDurationMinutes:
          estimatedDurationMinutes ?? this.estimatedDurationMinutes,
      actualDurationMinutes:
          actualDurationMinutes ?? this.actualDurationMinutes,
      completedAt: completedAt == _keepCompletedAt
          ? this.completedAt
          : completedAt as DateTime?,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
