// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_mutation_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSyncMutationCollectionCollection on Isar {
  IsarCollection<SyncMutationCollection> get syncMutationCollections =>
      this.collection();
}

const SyncMutationCollectionSchema = CollectionSchema(
  name: r'SyncMutationCollection',
  id: 2867482401836949110,
  properties: {
    r'collectionType': PropertySchema(
      id: 0,
      name: r'collectionType',
      type: IsarType.byte,
      enumMap: _SyncMutationCollectioncollectionTypeEnumValueMap,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'entityId': PropertySchema(
      id: 2,
      name: r'entityId',
      type: IsarType.string,
    ),
    r'lastError': PropertySchema(
      id: 3,
      name: r'lastError',
      type: IsarType.string,
    ),
    r'mutationId': PropertySchema(
      id: 4,
      name: r'mutationId',
      type: IsarType.string,
    ),
    r'mutationType': PropertySchema(
      id: 5,
      name: r'mutationType',
      type: IsarType.byte,
      enumMap: _SyncMutationCollectionmutationTypeEnumValueMap,
    ),
    r'nextRetryAt': PropertySchema(
      id: 6,
      name: r'nextRetryAt',
      type: IsarType.dateTime,
    ),
    r'payloadJson': PropertySchema(
      id: 7,
      name: r'payloadJson',
      type: IsarType.string,
    ),
    r'retryCount': PropertySchema(
      id: 8,
      name: r'retryCount',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 9,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _syncMutationCollectionEstimateSize,
  serialize: _syncMutationCollectionSerialize,
  deserialize: _syncMutationCollectionDeserialize,
  deserializeProp: _syncMutationCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'mutationId': IndexSchema(
      id: 4450546051540618180,
      name: r'mutationId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'mutationId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'collectionType': IndexSchema(
      id: -6951715544405945746,
      name: r'collectionType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'collectionType',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'mutationType': IndexSchema(
      id: 8040713435306474763,
      name: r'mutationType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'mutationType',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'entityId': IndexSchema(
      id: 745355021660786263,
      name: r'entityId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'entityId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _syncMutationCollectionGetId,
  getLinks: _syncMutationCollectionGetLinks,
  attach: _syncMutationCollectionAttach,
  version: '3.1.0+1',
);

int _syncMutationCollectionEstimateSize(
  SyncMutationCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.entityId.length * 3;
  {
    final value = object.lastError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.mutationId.length * 3;
  bytesCount += 3 + object.payloadJson.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _syncMutationCollectionSerialize(
  SyncMutationCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.collectionType.index);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.entityId);
  writer.writeString(offsets[3], object.lastError);
  writer.writeString(offsets[4], object.mutationId);
  writer.writeByte(offsets[5], object.mutationType.index);
  writer.writeDateTime(offsets[6], object.nextRetryAt);
  writer.writeString(offsets[7], object.payloadJson);
  writer.writeLong(offsets[8], object.retryCount);
  writer.writeString(offsets[9], object.userId);
}

SyncMutationCollection _syncMutationCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncMutationCollection();
  object.collectionType = _SyncMutationCollectioncollectionTypeValueEnumMap[
          reader.readByteOrNull(offsets[0])] ??
      CollectionType.habit;
  object.createdAt = reader.readDateTime(offsets[1]);
  object.entityId = reader.readString(offsets[2]);
  object.id = id;
  object.lastError = reader.readStringOrNull(offsets[3]);
  object.mutationId = reader.readString(offsets[4]);
  object.mutationType = _SyncMutationCollectionmutationTypeValueEnumMap[
          reader.readByteOrNull(offsets[5])] ??
      MutationType.create;
  object.nextRetryAt = reader.readDateTimeOrNull(offsets[6]);
  object.payloadJson = reader.readString(offsets[7]);
  object.retryCount = reader.readLong(offsets[8]);
  object.userId = reader.readString(offsets[9]);
  return object;
}

P _syncMutationCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_SyncMutationCollectioncollectionTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          CollectionType.habit) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (_SyncMutationCollectionmutationTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MutationType.create) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SyncMutationCollectioncollectionTypeEnumValueMap = {
  'habit': 0,
  'habitCompletion': 1,
  'focusSession': 2,
  'userSettings': 3,
  'task': 4,
  'project': 5,
  'subtask': 6,
  'taskAnalytics': 7,
  'recurringTask': 8,
};
const _SyncMutationCollectioncollectionTypeValueEnumMap = {
  0: CollectionType.habit,
  1: CollectionType.habitCompletion,
  2: CollectionType.focusSession,
  3: CollectionType.userSettings,
  4: CollectionType.task,
  5: CollectionType.project,
  6: CollectionType.subtask,
  7: CollectionType.taskAnalytics,
  8: CollectionType.recurringTask,
};
const _SyncMutationCollectionmutationTypeEnumValueMap = {
  'create': 0,
  'update': 1,
  'delete': 2,
};
const _SyncMutationCollectionmutationTypeValueEnumMap = {
  0: MutationType.create,
  1: MutationType.update,
  2: MutationType.delete,
};

Id _syncMutationCollectionGetId(SyncMutationCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncMutationCollectionGetLinks(
    SyncMutationCollection object) {
  return [];
}

void _syncMutationCollectionAttach(
    IsarCollection<dynamic> col, Id id, SyncMutationCollection object) {
  object.id = id;
}

extension SyncMutationCollectionByIndex
    on IsarCollection<SyncMutationCollection> {
  Future<SyncMutationCollection?> getByMutationId(String mutationId) {
    return getByIndex(r'mutationId', [mutationId]);
  }

  SyncMutationCollection? getByMutationIdSync(String mutationId) {
    return getByIndexSync(r'mutationId', [mutationId]);
  }

  Future<bool> deleteByMutationId(String mutationId) {
    return deleteByIndex(r'mutationId', [mutationId]);
  }

  bool deleteByMutationIdSync(String mutationId) {
    return deleteByIndexSync(r'mutationId', [mutationId]);
  }

  Future<List<SyncMutationCollection?>> getAllByMutationId(
      List<String> mutationIdValues) {
    final values = mutationIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'mutationId', values);
  }

  List<SyncMutationCollection?> getAllByMutationIdSync(
      List<String> mutationIdValues) {
    final values = mutationIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'mutationId', values);
  }

  Future<int> deleteAllByMutationId(List<String> mutationIdValues) {
    final values = mutationIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'mutationId', values);
  }

  int deleteAllByMutationIdSync(List<String> mutationIdValues) {
    final values = mutationIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'mutationId', values);
  }

  Future<Id> putByMutationId(SyncMutationCollection object) {
    return putByIndex(r'mutationId', object);
  }

  Id putByMutationIdSync(SyncMutationCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'mutationId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMutationId(List<SyncMutationCollection> objects) {
    return putAllByIndex(r'mutationId', objects);
  }

  List<Id> putAllByMutationIdSync(List<SyncMutationCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'mutationId', objects, saveLinks: saveLinks);
  }
}

extension SyncMutationCollectionQueryWhereSort
    on QueryBuilder<SyncMutationCollection, SyncMutationCollection, QWhere> {
  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterWhere>
      anyCollectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'collectionType'),
      );
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterWhere>
      anyMutationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'mutationType'),
      );
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterWhere>
      anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension SyncMutationCollectionQueryWhere on QueryBuilder<
    SyncMutationCollection, SyncMutationCollection, QWhereClause> {
  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> mutationIdEqualTo(String mutationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'mutationId',
        value: [mutationId],
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> mutationIdNotEqualTo(String mutationId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mutationId',
              lower: [],
              upper: [mutationId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mutationId',
              lower: [mutationId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mutationId',
              lower: [mutationId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mutationId',
              lower: [],
              upper: [mutationId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> collectionTypeEqualTo(CollectionType collectionType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'collectionType',
        value: [collectionType],
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
          QAfterWhereClause>
      collectionTypeNotEqualTo(CollectionType collectionType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionType',
              lower: [],
              upper: [collectionType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionType',
              lower: [collectionType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionType',
              lower: [collectionType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionType',
              lower: [],
              upper: [collectionType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> collectionTypeGreaterThan(
    CollectionType collectionType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'collectionType',
        lower: [collectionType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> collectionTypeLessThan(
    CollectionType collectionType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'collectionType',
        lower: [],
        upper: [collectionType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> collectionTypeBetween(
    CollectionType lowerCollectionType,
    CollectionType upperCollectionType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'collectionType',
        lower: [lowerCollectionType],
        includeLower: includeLower,
        upper: [upperCollectionType],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> mutationTypeEqualTo(MutationType mutationType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'mutationType',
        value: [mutationType],
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> mutationTypeNotEqualTo(MutationType mutationType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mutationType',
              lower: [],
              upper: [mutationType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mutationType',
              lower: [mutationType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mutationType',
              lower: [mutationType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'mutationType',
              lower: [],
              upper: [mutationType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> mutationTypeGreaterThan(
    MutationType mutationType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'mutationType',
        lower: [mutationType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> mutationTypeLessThan(
    MutationType mutationType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'mutationType',
        lower: [],
        upper: [mutationType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> mutationTypeBetween(
    MutationType lowerMutationType,
    MutationType upperMutationType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'mutationType',
        lower: [lowerMutationType],
        includeLower: includeLower,
        upper: [upperMutationType],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> entityIdEqualTo(String entityId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'entityId',
        value: [entityId],
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> entityIdNotEqualTo(String entityId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityId',
              lower: [],
              upper: [entityId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityId',
              lower: [entityId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityId',
              lower: [entityId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityId',
              lower: [],
              upper: [entityId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterWhereClause> createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SyncMutationCollectionQueryFilter on QueryBuilder<
    SyncMutationCollection, SyncMutationCollection, QFilterCondition> {
  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> collectionTypeEqualTo(CollectionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectionType',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> collectionTypeGreaterThan(
    CollectionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'collectionType',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> collectionTypeLessThan(
    CollectionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'collectionType',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> collectionTypeBetween(
    CollectionType lower,
    CollectionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'collectionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> entityIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> entityIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> entityIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> entityIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> entityIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> entityIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
          QAfterFilterCondition>
      entityIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
          QAfterFilterCondition>
      entityIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> entityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityId',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> entityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityId',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> lastErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastError',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> lastErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastError',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> lastErrorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> lastErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> lastErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> lastErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastError',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> lastErrorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> lastErrorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
          QAfterFilterCondition>
      lastErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
          QAfterFilterCondition>
      lastErrorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastError',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> lastErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastError',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> lastErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastError',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mutationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mutationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mutationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mutationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mutationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mutationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
          QAfterFilterCondition>
      mutationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mutationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
          QAfterFilterCondition>
      mutationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mutationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mutationId',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mutationId',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationTypeEqualTo(MutationType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mutationType',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationTypeGreaterThan(
    MutationType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mutationType',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationTypeLessThan(
    MutationType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mutationType',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> mutationTypeBetween(
    MutationType lower,
    MutationType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mutationType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> nextRetryAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nextRetryAt',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> nextRetryAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nextRetryAt',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> nextRetryAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextRetryAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> nextRetryAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextRetryAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> nextRetryAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextRetryAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> nextRetryAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextRetryAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> payloadJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> payloadJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> payloadJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> payloadJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'payloadJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> payloadJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> payloadJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
          QAfterFilterCondition>
      payloadJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
          QAfterFilterCondition>
      payloadJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'payloadJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> payloadJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payloadJson',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> payloadJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payloadJson',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> retryCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> retryCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> retryCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> retryCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'retryCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
          QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
          QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension SyncMutationCollectionQueryObject on QueryBuilder<
    SyncMutationCollection, SyncMutationCollection, QFilterCondition> {}

extension SyncMutationCollectionQueryLinks on QueryBuilder<
    SyncMutationCollection, SyncMutationCollection, QFilterCondition> {}

extension SyncMutationCollectionQuerySortBy
    on QueryBuilder<SyncMutationCollection, SyncMutationCollection, QSortBy> {
  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByCollectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionType', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByCollectionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionType', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByEntityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByMutationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationId', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByMutationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationId', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByMutationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationType', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByMutationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationType', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByNextRetryAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRetryAt', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByNextRetryAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRetryAt', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension SyncMutationCollectionQuerySortThenBy on QueryBuilder<
    SyncMutationCollection, SyncMutationCollection, QSortThenBy> {
  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByCollectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionType', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByCollectionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionType', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByEntityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByMutationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationId', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByMutationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationId', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByMutationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationType', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByMutationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationType', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByNextRetryAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRetryAt', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByNextRetryAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRetryAt', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension SyncMutationCollectionQueryWhereDistinct
    on QueryBuilder<SyncMutationCollection, SyncMutationCollection, QDistinct> {
  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QDistinct>
      distinctByCollectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collectionType');
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QDistinct>
      distinctByEntityId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QDistinct>
      distinctByLastError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QDistinct>
      distinctByMutationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mutationId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QDistinct>
      distinctByMutationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mutationType');
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QDistinct>
      distinctByNextRetryAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextRetryAt');
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QDistinct>
      distinctByPayloadJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payloadJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QDistinct>
      distinctByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retryCount');
    });
  }

  QueryBuilder<SyncMutationCollection, SyncMutationCollection, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension SyncMutationCollectionQueryProperty on QueryBuilder<
    SyncMutationCollection, SyncMutationCollection, QQueryProperty> {
  QueryBuilder<SyncMutationCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncMutationCollection, CollectionType, QQueryOperations>
      collectionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collectionType');
    });
  }

  QueryBuilder<SyncMutationCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SyncMutationCollection, String, QQueryOperations>
      entityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityId');
    });
  }

  QueryBuilder<SyncMutationCollection, String?, QQueryOperations>
      lastErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastError');
    });
  }

  QueryBuilder<SyncMutationCollection, String, QQueryOperations>
      mutationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mutationId');
    });
  }

  QueryBuilder<SyncMutationCollection, MutationType, QQueryOperations>
      mutationTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mutationType');
    });
  }

  QueryBuilder<SyncMutationCollection, DateTime?, QQueryOperations>
      nextRetryAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextRetryAt');
    });
  }

  QueryBuilder<SyncMutationCollection, String, QQueryOperations>
      payloadJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payloadJson');
    });
  }

  QueryBuilder<SyncMutationCollection, int, QQueryOperations>
      retryCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retryCount');
    });
  }

  QueryBuilder<SyncMutationCollection, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
