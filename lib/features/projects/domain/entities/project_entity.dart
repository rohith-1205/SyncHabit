class ProjectEntity {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final String colorHex;
  final String iconName;
  final DateTime? deadline;
  final double progress; // 0.0 to 1.0 based on completed tasks
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProjectEntity({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.colorHex,
    required this.iconName,
    this.deadline,
    required this.progress,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
}
