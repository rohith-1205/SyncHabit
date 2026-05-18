import 'package:isar/isar.dart';

part 'cached_ai_insight_collection.g.dart';

@collection
class CachedAiInsightCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String insightId;

  @Index()
  late String userId;

  late String category; // e.g. burnout_warning, habit_optimization, schedule_tweak

  late String summary;

  late String fullPromptResponse;

  late List<String> actionableSteps;

  late bool isRead;

  @Index()
  late DateTime generatedAt;

  late DateTime expiresAt;
}
