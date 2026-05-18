import '../../../../database/collections/habit_collection.dart'; // SyncStatus
import '../../../../database/collections/project_collection.dart';
import '../../domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.id,
    required super.userId,
    required super.title,
    super.description,
    required super.colorHex,
    required super.iconName,
    super.deadline,
    required super.progress,
    required super.isArchived,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProjectModel.fromEntity(ProjectEntity entity) {
    return ProjectModel(
      id: entity.id,
      userId: entity.userId,
      title: entity.title,
      description: entity.description,
      colorHex: entity.colorHex,
      iconName: entity.iconName,
      deadline: entity.deadline,
      progress: entity.progress,
      isArchived: entity.isArchived,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  factory ProjectModel.fromCollection(ProjectCollection col) {
    return ProjectModel(
      id: col.projectId,
      userId: col.userId,
      title: col.title,
      description: col.description,
      colorHex: col.colorHex,
      iconName: col.iconName,
      deadline: col.deadline,
      progress: col.progress,
      isArchived: col.isArchived,
      createdAt: col.createdAt,
      updatedAt: col.updatedAt,
    );
  }

  ProjectCollection toCollection() {
    return ProjectCollection()
      ..projectId = id
      ..userId = userId
      ..title = title
      ..description = description
      ..colorHex = colorHex
      ..iconName = iconName
      ..deadline = deadline
      ..progress = progress
      ..isArchived = isArchived
      ..syncStatus = SyncStatus.pending
      ..createdAt = createdAt
      ..updatedAt = updatedAt;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'colorHex': colorHex,
      'iconName': iconName,
      'deadline': deadline?.toIso8601String(),
      'progress': progress,
      'isArchived': isArchived,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      colorHex: json['colorHex'] as String? ?? '#8A2BE2',
      iconName: json['iconName'] as String? ?? 'work',
      deadline: json['deadline'] != null ? DateTime.parse(json['deadline']) : null,
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
      isArchived: json['isArchived'] as bool? ?? false,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : DateTime.now(),
    );
  }

  ProjectModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? colorHex,
    String? iconName,
    DateTime? deadline,
    double? progress,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      colorHex: colorHex ?? this.colorHex,
      iconName: iconName ?? this.iconName,
      deadline: deadline ?? this.deadline,
      progress: progress ?? this.progress,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
