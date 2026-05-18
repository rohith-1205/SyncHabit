enum PlannerItemType { task, habit, focusSession, aiRecommendation }

class PlannerItem {
  final String id;
  final PlannerItemType type;
  final String title;
  final String subtitle;
  final String colorHex;
  final String iconName;
  final bool isCompleted;
  final DateTime? scheduledTime;
  final dynamic rawEntity;

  const PlannerItem({
    required this.id,
    required this.type,
    required this.title,
    required this.subtitle,
    required this.colorHex,
    required this.iconName,
    required this.isCompleted,
    this.scheduledTime,
    this.rawEntity,
  });

  PlannerItem copyWith({
    String? id,
    PlannerItemType? type,
    String? title,
    String? subtitle,
    String? colorHex,
    String? iconName,
    bool? isCompleted,
    DateTime? scheduledTime,
    dynamic rawEntity,
  }) {
    return PlannerItem(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      colorHex: colorHex ?? this.colorHex,
      iconName: iconName ?? this.iconName,
      isCompleted: isCompleted ?? this.isCompleted,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      rawEntity: rawEntity ?? this.rawEntity,
    );
  }
}
