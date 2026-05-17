class BurnoutMetrics {
  final double burnoutProbability; // 0.0 to 1.0
  final double cognitiveLoad; // 0.0 to 1.0
  final double sleepDebtImpact; // 0.0 to 1.0
  final String riskLevel; // 'Low', 'Moderate', 'High', 'Critical'
  final List<String> recommendedActions;

  BurnoutMetrics({
    required this.burnoutProbability,
    required this.cognitiveLoad,
    required this.sleepDebtImpact,
    required this.riskLevel,
    required this.recommendedActions,
  });
}
