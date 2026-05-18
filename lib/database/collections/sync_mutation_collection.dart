import 'package:isar/isar.dart';

part 'sync_mutation_collection.g.dart';

enum MutationType { create, update, delete }
enum CollectionType { habit, habitCompletion, focusSession, userSettings, task, project, subtask, taskAnalytics, recurringTask }

@collection
class SyncMutationCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String mutationId;

  @Index()
  late String userId;

  @enumerated
  @Index()
  late CollectionType collectionType;

  @enumerated
  @Index()
  late MutationType mutationType;

  @Index()
  late String entityId; // e.g. habitId, sessionId, etc.

  late String payloadJson; // Serialized DTO JSON string

  @Index()
  late DateTime createdAt;

  late int retryCount;

  DateTime? nextRetryAt;

  String? lastError;
}
