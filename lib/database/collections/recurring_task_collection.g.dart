// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_task_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecurringTaskCollectionCollection on Isar {
  IsarCollection<RecurringTaskCollection> get recurringTaskCollections =>
      this.collection();
}

const RecurringTaskCollectionSchema = CollectionSchema(
  name: r'RecurringTaskCollection',
  id: -4040041955866840772,
  properties: {
    r'bestStreak': PropertySchema(
      id: 0,
      name: r'bestStreak',
      type: IsarType.long,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentStreak': PropertySchema(
      id: 3,
      name: r'currentStreak',
      type: IsarType.long,
    ),
    r'customRepeatDays': PropertySchema(
      id: 4,
      name: r'customRepeatDays',
      type: IsarType.longList,
    ),
    r'description': PropertySchema(
      id: 5,
      name: r'description',
      type: IsarType.string,
    ),
    r'instancesCompletedCount': PropertySchema(
      id: 6,
      name: r'instancesCompletedCount',
      type: IsarType.long,
    ),
    r'instancesGeneratedCount': PropertySchema(
      id: 7,
      name: r'instancesGeneratedCount',
      type: IsarType.long,
    ),
    r'lastSyncedAt': PropertySchema(
      id: 8,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'pendingDelete': PropertySchema(
      id: 9,
      name: r'pendingDelete',
      type: IsarType.bool,
    ),
    r'pendingUpload': PropertySchema(
      id: 10,
      name: r'pendingUpload',
      type: IsarType.bool,
    ),
    r'priority': PropertySchema(
      id: 11,
      name: r'priority',
      type: IsarType.string,
    ),
    r'recurringTaskId': PropertySchema(
      id: 12,
      name: r'recurringTaskId',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 13,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'repeatCountLimit': PropertySchema(
      id: 14,
      name: r'repeatCountLimit',
      type: IsarType.long,
    ),
    r'repeatInterval': PropertySchema(
      id: 15,
      name: r'repeatInterval',
      type: IsarType.string,
    ),
    r'repeatUntilDate': PropertySchema(
      id: 16,
      name: r'repeatUntilDate',
      type: IsarType.dateTime,
    ),
    r'syncStatus': PropertySchema(
      id: 17,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _RecurringTaskCollectionsyncStatusEnumValueMap,
    ),
    r'title': PropertySchema(
      id: 18,
      name: r'title',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 19,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 20,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _recurringTaskCollectionEstimateSize,
  serialize: _recurringTaskCollectionSerialize,
  deserialize: _recurringTaskCollectionDeserialize,
  deserializeProp: _recurringTaskCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'recurringTaskId': IndexSchema(
      id: -205931347154871345,
      name: r'recurringTaskId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'recurringTaskId',
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
    r'syncStatus': IndexSchema(
      id: 8239539375045684509,
      name: r'syncStatus',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'syncStatus',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'remoteId': IndexSchema(
      id: 6301175856541681032,
      name: r'remoteId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'remoteId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _recurringTaskCollectionGetId,
  getLinks: _recurringTaskCollectionGetLinks,
  attach: _recurringTaskCollectionAttach,
  version: '3.1.0+1',
);

int _recurringTaskCollectionEstimateSize(
  RecurringTaskCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  {
    final value = object.customRepeatDays;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.priority.length * 3;
  bytesCount += 3 + object.recurringTaskId.length * 3;
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.repeatInterval.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _recurringTaskCollectionSerialize(
  RecurringTaskCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bestStreak);
  writer.writeString(offsets[1], object.category);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeLong(offsets[3], object.currentStreak);
  writer.writeLongList(offsets[4], object.customRepeatDays);
  writer.writeString(offsets[5], object.description);
  writer.writeLong(offsets[6], object.instancesCompletedCount);
  writer.writeLong(offsets[7], object.instancesGeneratedCount);
  writer.writeDateTime(offsets[8], object.lastSyncedAt);
  writer.writeBool(offsets[9], object.pendingDelete);
  writer.writeBool(offsets[10], object.pendingUpload);
  writer.writeString(offsets[11], object.priority);
  writer.writeString(offsets[12], object.recurringTaskId);
  writer.writeString(offsets[13], object.remoteId);
  writer.writeLong(offsets[14], object.repeatCountLimit);
  writer.writeString(offsets[15], object.repeatInterval);
  writer.writeDateTime(offsets[16], object.repeatUntilDate);
  writer.writeByte(offsets[17], object.syncStatus.index);
  writer.writeString(offsets[18], object.title);
  writer.writeDateTime(offsets[19], object.updatedAt);
  writer.writeString(offsets[20], object.userId);
}

RecurringTaskCollection _recurringTaskCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecurringTaskCollection();
  object.bestStreak = reader.readLong(offsets[0]);
  object.category = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.currentStreak = reader.readLong(offsets[3]);
  object.customRepeatDays = reader.readLongList(offsets[4]);
  object.description = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.instancesCompletedCount = reader.readLong(offsets[6]);
  object.instancesGeneratedCount = reader.readLong(offsets[7]);
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[8]);
  object.pendingDelete = reader.readBool(offsets[9]);
  object.pendingUpload = reader.readBool(offsets[10]);
  object.priority = reader.readString(offsets[11]);
  object.recurringTaskId = reader.readString(offsets[12]);
  object.remoteId = reader.readStringOrNull(offsets[13]);
  object.repeatCountLimit = reader.readLongOrNull(offsets[14]);
  object.repeatInterval = reader.readString(offsets[15]);
  object.repeatUntilDate = reader.readDateTimeOrNull(offsets[16]);
  object.syncStatus = _RecurringTaskCollectionsyncStatusValueEnumMap[
          reader.readByteOrNull(offsets[17])] ??
      SyncStatus.synced;
  object.title = reader.readString(offsets[18]);
  object.updatedAt = reader.readDateTime(offsets[19]);
  object.userId = reader.readString(offsets[20]);
  return object;
}

P _recurringTaskCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLongList(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (_RecurringTaskCollectionsyncStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.synced) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RecurringTaskCollectionsyncStatusEnumValueMap = {
  'synced': 0,
  'pendingUpload': 1,
  'pendingUpdate': 2,
  'pendingDelete': 3,
  'conflict': 4,
  'pending': 5,
  'failed': 6,
};
const _RecurringTaskCollectionsyncStatusValueEnumMap = {
  0: SyncStatus.synced,
  1: SyncStatus.pendingUpload,
  2: SyncStatus.pendingUpdate,
  3: SyncStatus.pendingDelete,
  4: SyncStatus.conflict,
  5: SyncStatus.pending,
  6: SyncStatus.failed,
};

Id _recurringTaskCollectionGetId(RecurringTaskCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recurringTaskCollectionGetLinks(
    RecurringTaskCollection object) {
  return [];
}

void _recurringTaskCollectionAttach(
    IsarCollection<dynamic> col, Id id, RecurringTaskCollection object) {
  object.id = id;
}

extension RecurringTaskCollectionByIndex
    on IsarCollection<RecurringTaskCollection> {
  Future<RecurringTaskCollection?> getByRecurringTaskId(
      String recurringTaskId) {
    return getByIndex(r'recurringTaskId', [recurringTaskId]);
  }

  RecurringTaskCollection? getByRecurringTaskIdSync(String recurringTaskId) {
    return getByIndexSync(r'recurringTaskId', [recurringTaskId]);
  }

  Future<bool> deleteByRecurringTaskId(String recurringTaskId) {
    return deleteByIndex(r'recurringTaskId', [recurringTaskId]);
  }

  bool deleteByRecurringTaskIdSync(String recurringTaskId) {
    return deleteByIndexSync(r'recurringTaskId', [recurringTaskId]);
  }

  Future<List<RecurringTaskCollection?>> getAllByRecurringTaskId(
      List<String> recurringTaskIdValues) {
    final values = recurringTaskIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'recurringTaskId', values);
  }

  List<RecurringTaskCollection?> getAllByRecurringTaskIdSync(
      List<String> recurringTaskIdValues) {
    final values = recurringTaskIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'recurringTaskId', values);
  }

  Future<int> deleteAllByRecurringTaskId(List<String> recurringTaskIdValues) {
    final values = recurringTaskIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'recurringTaskId', values);
  }

  int deleteAllByRecurringTaskIdSync(List<String> recurringTaskIdValues) {
    final values = recurringTaskIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'recurringTaskId', values);
  }

  Future<Id> putByRecurringTaskId(RecurringTaskCollection object) {
    return putByIndex(r'recurringTaskId', object);
  }

  Id putByRecurringTaskIdSync(RecurringTaskCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'recurringTaskId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecurringTaskId(
      List<RecurringTaskCollection> objects) {
    return putAllByIndex(r'recurringTaskId', objects);
  }

  List<Id> putAllByRecurringTaskIdSync(List<RecurringTaskCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'recurringTaskId', objects, saveLinks: saveLinks);
  }
}

extension RecurringTaskCollectionQueryWhereSort
    on QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QWhere> {
  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterWhere>
      anySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncStatus'),
      );
    });
  }
}

extension RecurringTaskCollectionQueryWhere on QueryBuilder<
    RecurringTaskCollection, RecurringTaskCollection, QWhereClause> {
  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> recurringTaskIdEqualTo(String recurringTaskId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recurringTaskId',
        value: [recurringTaskId],
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> recurringTaskIdNotEqualTo(String recurringTaskId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurringTaskId',
              lower: [],
              upper: [recurringTaskId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurringTaskId',
              lower: [recurringTaskId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurringTaskId',
              lower: [recurringTaskId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurringTaskId',
              lower: [],
              upper: [recurringTaskId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> syncStatusEqualTo(SyncStatus syncStatus) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncStatus',
        value: [syncStatus],
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> syncStatusNotEqualTo(SyncStatus syncStatus) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncStatus',
              lower: [],
              upper: [syncStatus],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncStatus',
              lower: [syncStatus],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncStatus',
              lower: [syncStatus],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncStatus',
              lower: [],
              upper: [syncStatus],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> syncStatusGreaterThan(
    SyncStatus syncStatus, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncStatus',
        lower: [syncStatus],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> syncStatusLessThan(
    SyncStatus syncStatus, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncStatus',
        lower: [],
        upper: [syncStatus],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> syncStatusBetween(
    SyncStatus lowerSyncStatus,
    SyncStatus upperSyncStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncStatus',
        lower: [lowerSyncStatus],
        includeLower: includeLower,
        upper: [upperSyncStatus],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [null],
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'remoteId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> remoteIdEqualTo(String? remoteId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [remoteId],
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterWhereClause> remoteIdNotEqualTo(String? remoteId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RecurringTaskCollectionQueryFilter on QueryBuilder<
    RecurringTaskCollection, RecurringTaskCollection, QFilterCondition> {
  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> bestStreakEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bestStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> bestStreakGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bestStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> bestStreakLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bestStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> bestStreakBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bestStreak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> currentStreakEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> currentStreakGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> currentStreakLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> currentStreakBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentStreak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customRepeatDays',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customRepeatDays',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customRepeatDays',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customRepeatDays',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customRepeatDays',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customRepeatDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customRepeatDays',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customRepeatDays',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customRepeatDays',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customRepeatDays',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customRepeatDays',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> customRepeatDaysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customRepeatDays',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> instancesCompletedCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instancesCompletedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> instancesCompletedCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instancesCompletedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> instancesCompletedCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instancesCompletedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> instancesCompletedCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instancesCompletedCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> instancesGeneratedCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instancesGeneratedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> instancesGeneratedCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instancesGeneratedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> instancesGeneratedCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instancesGeneratedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> instancesGeneratedCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instancesGeneratedCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> lastSyncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncedAt',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> lastSyncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncedAt',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> lastSyncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> lastSyncedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> lastSyncedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> lastSyncedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> pendingDeleteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendingDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> pendingUploadEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendingUpload',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> priorityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> priorityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> priorityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> priorityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priority',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> priorityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> priorityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      priorityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      priorityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priority',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> priorityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> priorityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priority',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> recurringTaskIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurringTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> recurringTaskIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurringTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> recurringTaskIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurringTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> recurringTaskIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurringTaskId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> recurringTaskIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recurringTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> recurringTaskIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recurringTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      recurringTaskIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recurringTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      recurringTaskIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recurringTaskId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> recurringTaskIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurringTaskId',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> recurringTaskIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recurringTaskId',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> remoteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> remoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> remoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> remoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatCountLimitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'repeatCountLimit',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatCountLimitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'repeatCountLimit',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatCountLimitEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeatCountLimit',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatCountLimitGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repeatCountLimit',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatCountLimitLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repeatCountLimit',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatCountLimitBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repeatCountLimit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatIntervalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeatInterval',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatIntervalGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repeatInterval',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatIntervalLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repeatInterval',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatIntervalBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repeatInterval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatIntervalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'repeatInterval',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatIntervalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'repeatInterval',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      repeatIntervalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'repeatInterval',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      repeatIntervalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'repeatInterval',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatIntervalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeatInterval',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatIntervalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'repeatInterval',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatUntilDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'repeatUntilDate',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatUntilDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'repeatUntilDate',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatUntilDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeatUntilDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatUntilDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repeatUntilDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatUntilDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repeatUntilDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> repeatUntilDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repeatUntilDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> syncStatusGreaterThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> syncStatusLessThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> syncStatusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
          QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
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

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension RecurringTaskCollectionQueryObject on QueryBuilder<
    RecurringTaskCollection, RecurringTaskCollection, QFilterCondition> {}

extension RecurringTaskCollectionQueryLinks on QueryBuilder<
    RecurringTaskCollection, RecurringTaskCollection, QFilterCondition> {}

extension RecurringTaskCollectionQuerySortBy
    on QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QSortBy> {
  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByBestStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestStreak', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByBestStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestStreak', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByCurrentStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStreak', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByCurrentStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStreak', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByInstancesCompletedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instancesCompletedCount', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByInstancesCompletedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instancesCompletedCount', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByInstancesGeneratedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instancesGeneratedCount', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByInstancesGeneratedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instancesGeneratedCount', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByPendingDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByPendingDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByPendingUpload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByPendingUploadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByRecurringTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringTaskId', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByRecurringTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringTaskId', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByRepeatCountLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatCountLimit', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByRepeatCountLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatCountLimit', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByRepeatInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatInterval', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByRepeatIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatInterval', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByRepeatUntilDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatUntilDate', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByRepeatUntilDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatUntilDate', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension RecurringTaskCollectionQuerySortThenBy on QueryBuilder<
    RecurringTaskCollection, RecurringTaskCollection, QSortThenBy> {
  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByBestStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestStreak', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByBestStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestStreak', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByCurrentStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStreak', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByCurrentStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStreak', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByInstancesCompletedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instancesCompletedCount', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByInstancesCompletedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instancesCompletedCount', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByInstancesGeneratedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instancesGeneratedCount', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByInstancesGeneratedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instancesGeneratedCount', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByPendingDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByPendingDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByPendingUpload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByPendingUploadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByRecurringTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringTaskId', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByRecurringTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringTaskId', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByRepeatCountLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatCountLimit', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByRepeatCountLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatCountLimit', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByRepeatInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatInterval', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByRepeatIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatInterval', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByRepeatUntilDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatUntilDate', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByRepeatUntilDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatUntilDate', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension RecurringTaskCollectionQueryWhereDistinct on QueryBuilder<
    RecurringTaskCollection, RecurringTaskCollection, QDistinct> {
  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByBestStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bestStreak');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByCurrentStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentStreak');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByCustomRepeatDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customRepeatDays');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByInstancesCompletedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instancesCompletedCount');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByInstancesGeneratedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instancesGeneratedCount');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByPendingDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendingDelete');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByPendingUpload() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendingUpload');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByPriority({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByRecurringTaskId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurringTaskId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByRepeatCountLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeatCountLimit');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByRepeatInterval({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeatInterval',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByRepeatUntilDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeatUntilDate');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<RecurringTaskCollection, RecurringTaskCollection, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension RecurringTaskCollectionQueryProperty on QueryBuilder<
    RecurringTaskCollection, RecurringTaskCollection, QQueryProperty> {
  QueryBuilder<RecurringTaskCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecurringTaskCollection, int, QQueryOperations>
      bestStreakProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bestStreak');
    });
  }

  QueryBuilder<RecurringTaskCollection, String, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<RecurringTaskCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RecurringTaskCollection, int, QQueryOperations>
      currentStreakProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentStreak');
    });
  }

  QueryBuilder<RecurringTaskCollection, List<int>?, QQueryOperations>
      customRepeatDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customRepeatDays');
    });
  }

  QueryBuilder<RecurringTaskCollection, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<RecurringTaskCollection, int, QQueryOperations>
      instancesCompletedCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instancesCompletedCount');
    });
  }

  QueryBuilder<RecurringTaskCollection, int, QQueryOperations>
      instancesGeneratedCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instancesGeneratedCount');
    });
  }

  QueryBuilder<RecurringTaskCollection, DateTime?, QQueryOperations>
      lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<RecurringTaskCollection, bool, QQueryOperations>
      pendingDeleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendingDelete');
    });
  }

  QueryBuilder<RecurringTaskCollection, bool, QQueryOperations>
      pendingUploadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendingUpload');
    });
  }

  QueryBuilder<RecurringTaskCollection, String, QQueryOperations>
      priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<RecurringTaskCollection, String, QQueryOperations>
      recurringTaskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurringTaskId');
    });
  }

  QueryBuilder<RecurringTaskCollection, String?, QQueryOperations>
      remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<RecurringTaskCollection, int?, QQueryOperations>
      repeatCountLimitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeatCountLimit');
    });
  }

  QueryBuilder<RecurringTaskCollection, String, QQueryOperations>
      repeatIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeatInterval');
    });
  }

  QueryBuilder<RecurringTaskCollection, DateTime?, QQueryOperations>
      repeatUntilDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeatUntilDate');
    });
  }

  QueryBuilder<RecurringTaskCollection, SyncStatus, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<RecurringTaskCollection, String, QQueryOperations>
      titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<RecurringTaskCollection, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<RecurringTaskCollection, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
