class AiInsight {
  final String id;
  final String title;
  final String description;
  final String category; // 'habits', 'focus', 'burnout', 'scheduling'
  final double confidenceScore;
  final DateTime generatedAt;

  AiInsight({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.confidenceScore,
    required this.generatedAt,
  });
}
