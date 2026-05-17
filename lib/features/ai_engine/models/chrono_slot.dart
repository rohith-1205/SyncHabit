class ChronoSlot {
  final String id;
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final String slotType; // 'Optimal Focus', 'Deep Work Injection', 'Reflection Window', 'Protected Block'
  final bool isAiInjected;
  final double productivityPotential; // 0.0 to 1.0

  ChronoSlot({
    required this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.slotType,
    this.isAiInjected = true,
    required this.productivityPotential,
  });
}
