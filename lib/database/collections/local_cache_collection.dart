import 'package:isar/isar.dart';

part 'local_cache_collection.g.dart';

@collection
class LocalCacheCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String cacheKey;

  late String payload;

  late DateTime updatedAt;

  late DateTime? expiresAt;
}
