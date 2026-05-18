// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_analytics_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskAnalyticsCollectionCollection on Isar {
  IsarCollection<TaskAnalyticsCollection> get taskAnalyticsCollections =>
      this.collection();
}

const TaskAnalyticsCollectionSchema = CollectionSchema(
  name: r'TaskAnalyticsCollection',
  id: 5590578730309674428,
  properties: {
    r'aiGeneratedInsights': PropertySchema(
      id: 0,
      name: r'aiGeneratedInsights',
      type: IsarType.stringList,
    ),
    r'analyticsId': PropertySchema(
      id: 1,
      name: r'analyticsId',
      type: IsarType.string,
    ),
    r'completionRate': PropertySchema(
      id: 2,
      name: r'completionRate',
      type: IsarType.double,
    ),
    r'completionVelocity': PropertySchema(
      id: 3,
      name: r'completionVelocity',
      type: IsarType.double,
    ),
    r'consistencyScore': PropertySchema(
      id: 4,
      name: r'consistencyScore',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endDate': PropertySchema(
      id: 6,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'lastSyncedAt': PropertySchema(
      id: 7,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'pendingDelete': PropertySchema(
      id: 8,
      name: r'pendingDelete',
      type: IsarType.bool,
    ),
    r'pendingUpload': PropertySchema(
      id: 9,
      name: r'pendingUpload',
      type: IsarType.bool,
    ),
    r'period': PropertySchema(
      id: 10,
      name: r'period',
      type: IsarType.string,
    ),
    r'procrastinationPatterns': PropertySchema(
      id: 11,
      name: r'procrastinationPatterns',
      type: IsarType.stringList,
    ),
    r'remoteId': PropertySchema(
      id: 12,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 13,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'syncStatus': PropertySchema(
      id: 14,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _TaskAnalyticsCollectionsyncStatusEnumValueMap,
    ),
    r'totalFocusTimeMinutes': PropertySchema(
      id: 15,
      name: r'totalFocusTimeMinutes',
      type: IsarType.long,
    ),
    r'totalOverdueTasks': PropertySchema(
      id: 16,
      name: r'totalOverdueTasks',
      type: IsarType.long,
    ),
    r'totalTasksCompleted': PropertySchema(
      id: 17,
      name: r'totalTasksCompleted',
      type: IsarType.long,
    ),
    r'totalTasksCreated': PropertySchema(
      id: 18,
      name: r'totalTasksCreated',
      type: IsarType.long,
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
  estimateSize: _taskAnalyticsCollectionEstimateSize,
  serialize: _taskAnalyticsCollectionSerialize,
  deserialize: _taskAnalyticsCollectionDeserialize,
  deserializeProp: _taskAnalyticsCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'analyticsId': IndexSchema(
      id: 3955952810955643145,
      name: r'analyticsId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'analyticsId',
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
  getId: _taskAnalyticsCollectionGetId,
  getLinks: _taskAnalyticsCollectionGetLinks,
  attach: _taskAnalyticsCollectionAttach,
  version: '3.1.0+1',
);

int _taskAnalyticsCollectionEstimateSize(
  TaskAnalyticsCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.aiGeneratedInsights;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.analyticsId.length * 3;
  bytesCount += 3 + object.period.length * 3;
  {
    final list = object.procrastinationPatterns;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _taskAnalyticsCollectionSerialize(
  TaskAnalyticsCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.aiGeneratedInsights);
  writer.writeString(offsets[1], object.analyticsId);
  writer.writeDouble(offsets[2], object.completionRate);
  writer.writeDouble(offsets[3], object.completionVelocity);
  writer.writeDouble(offsets[4], object.consistencyScore);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeDateTime(offsets[6], object.endDate);
  writer.writeDateTime(offsets[7], object.lastSyncedAt);
  writer.writeBool(offsets[8], object.pendingDelete);
  writer.writeBool(offsets[9], object.pendingUpload);
  writer.writeString(offsets[10], object.period);
  writer.writeStringList(offsets[11], object.procrastinationPatterns);
  writer.writeString(offsets[12], object.remoteId);
  writer.writeDateTime(offsets[13], object.startDate);
  writer.writeByte(offsets[14], object.syncStatus.index);
  writer.writeLong(offsets[15], object.totalFocusTimeMinutes);
  writer.writeLong(offsets[16], object.totalOverdueTasks);
  writer.writeLong(offsets[17], object.totalTasksCompleted);
  writer.writeLong(offsets[18], object.totalTasksCreated);
  writer.writeDateTime(offsets[19], object.updatedAt);
  writer.writeString(offsets[20], object.userId);
}

TaskAnalyticsCollection _taskAnalyticsCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskAnalyticsCollection();
  object.aiGeneratedInsights = reader.readStringList(offsets[0]);
  object.analyticsId = reader.readString(offsets[1]);
  object.completionRate = reader.readDouble(offsets[2]);
  object.completionVelocity = reader.readDouble(offsets[3]);
  object.consistencyScore = reader.readDouble(offsets[4]);
  object.createdAt = reader.readDateTime(offsets[5]);
  object.endDate = reader.readDateTime(offsets[6]);
  object.id = id;
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[7]);
  object.pendingDelete = reader.readBool(offsets[8]);
  object.pendingUpload = reader.readBool(offsets[9]);
  object.period = reader.readString(offsets[10]);
  object.procrastinationPatterns = reader.readStringList(offsets[11]);
  object.remoteId = reader.readStringOrNull(offsets[12]);
  object.startDate = reader.readDateTime(offsets[13]);
  object.syncStatus = _TaskAnalyticsCollectionsyncStatusValueEnumMap[
          reader.readByteOrNull(offsets[14])] ??
      SyncStatus.synced;
  object.totalFocusTimeMinutes = reader.readLong(offsets[15]);
  object.totalOverdueTasks = reader.readLong(offsets[16]);
  object.totalTasksCompleted = reader.readLong(offsets[17]);
  object.totalTasksCreated = reader.readLong(offsets[18]);
  object.updatedAt = reader.readDateTime(offsets[19]);
  object.userId = reader.readString(offsets[20]);
  return object;
}

P _taskAnalyticsCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringList(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (_TaskAnalyticsCollectionsyncStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.synced) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TaskAnalyticsCollectionsyncStatusEnumValueMap = {
  'synced': 0,
  'pendingUpload': 1,
  'pendingUpdate': 2,
  'pendingDelete': 3,
  'conflict': 4,
  'pending': 5,
  'failed': 6,
};
const _TaskAnalyticsCollectionsyncStatusValueEnumMap = {
  0: SyncStatus.synced,
  1: SyncStatus.pendingUpload,
  2: SyncStatus.pendingUpdate,
  3: SyncStatus.pendingDelete,
  4: SyncStatus.conflict,
  5: SyncStatus.pending,
  6: SyncStatus.failed,
};

Id _taskAnalyticsCollectionGetId(TaskAnalyticsCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskAnalyticsCollectionGetLinks(
    TaskAnalyticsCollection object) {
  return [];
}

void _taskAnalyticsCollectionAttach(
    IsarCollection<dynamic> col, Id id, TaskAnalyticsCollection object) {
  object.id = id;
}

extension TaskAnalyticsCollectionByIndex
    on IsarCollection<TaskAnalyticsCollection> {
  Future<TaskAnalyticsCollection?> getByAnalyticsId(String analyticsId) {
    return getByIndex(r'analyticsId', [analyticsId]);
  }

  TaskAnalyticsCollection? getByAnalyticsIdSync(String analyticsId) {
    return getByIndexSync(r'analyticsId', [analyticsId]);
  }

  Future<bool> deleteByAnalyticsId(String analyticsId) {
    return deleteByIndex(r'analyticsId', [analyticsId]);
  }

  bool deleteByAnalyticsIdSync(String analyticsId) {
    return deleteByIndexSync(r'analyticsId', [analyticsId]);
  }

  Future<List<TaskAnalyticsCollection?>> getAllByAnalyticsId(
      List<String> analyticsIdValues) {
    final values = analyticsIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'analyticsId', values);
  }

  List<TaskAnalyticsCollection?> getAllByAnalyticsIdSync(
      List<String> analyticsIdValues) {
    final values = analyticsIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'analyticsId', values);
  }

  Future<int> deleteAllByAnalyticsId(List<String> analyticsIdValues) {
    final values = analyticsIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'analyticsId', values);
  }

  int deleteAllByAnalyticsIdSync(List<String> analyticsIdValues) {
    final values = analyticsIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'analyticsId', values);
  }

  Future<Id> putByAnalyticsId(TaskAnalyticsCollection object) {
    return putByIndex(r'analyticsId', object);
  }

  Id putByAnalyticsIdSync(TaskAnalyticsCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'analyticsId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAnalyticsId(List<TaskAnalyticsCollection> objects) {
    return putAllByIndex(r'analyticsId', objects);
  }

  List<Id> putAllByAnalyticsIdSync(List<TaskAnalyticsCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'analyticsId', objects, saveLinks: saveLinks);
  }
}

extension TaskAnalyticsCollectionQueryWhereSort
    on QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QWhere> {
  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterWhere>
      anySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncStatus'),
      );
    });
  }
}

extension TaskAnalyticsCollectionQueryWhere on QueryBuilder<
    TaskAnalyticsCollection, TaskAnalyticsCollection, QWhereClause> {
  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterWhereClause> analyticsIdEqualTo(String analyticsId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'analyticsId',
        value: [analyticsId],
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterWhereClause> analyticsIdNotEqualTo(String analyticsId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'analyticsId',
              lower: [],
              upper: [analyticsId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'analyticsId',
              lower: [analyticsId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'analyticsId',
              lower: [analyticsId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'analyticsId',
              lower: [],
              upper: [analyticsId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterWhereClause> userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterWhereClause> syncStatusEqualTo(SyncStatus syncStatus) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncStatus',
        value: [syncStatus],
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterWhereClause> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterWhereClause> remoteIdEqualTo(String? remoteId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [remoteId],
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

extension TaskAnalyticsCollectionQueryFilter on QueryBuilder<
    TaskAnalyticsCollection, TaskAnalyticsCollection, QFilterCondition> {
  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aiGeneratedInsights',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aiGeneratedInsights',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiGeneratedInsights',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aiGeneratedInsights',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aiGeneratedInsights',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aiGeneratedInsights',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aiGeneratedInsights',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aiGeneratedInsights',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
          QAfterFilterCondition>
      aiGeneratedInsightsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aiGeneratedInsights',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
          QAfterFilterCondition>
      aiGeneratedInsightsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aiGeneratedInsights',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiGeneratedInsights',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aiGeneratedInsights',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aiGeneratedInsights',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aiGeneratedInsights',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aiGeneratedInsights',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aiGeneratedInsights',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aiGeneratedInsights',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> aiGeneratedInsightsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aiGeneratedInsights',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> analyticsIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'analyticsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> analyticsIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'analyticsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> analyticsIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'analyticsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> analyticsIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'analyticsId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> analyticsIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'analyticsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> analyticsIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'analyticsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
          QAfterFilterCondition>
      analyticsIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'analyticsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
          QAfterFilterCondition>
      analyticsIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'analyticsId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> analyticsIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'analyticsId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> analyticsIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'analyticsId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> completionRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> completionRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> completionRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> completionRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completionRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> completionVelocityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completionVelocity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> completionVelocityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completionVelocity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> completionVelocityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completionVelocity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> completionVelocityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completionVelocity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> consistencyScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'consistencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> consistencyScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'consistencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> consistencyScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'consistencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> consistencyScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'consistencyScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> endDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> endDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> endDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> endDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> lastSyncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncedAt',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> lastSyncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncedAt',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> lastSyncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> pendingDeleteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendingDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> pendingUploadEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendingUpload',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> periodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> periodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> periodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> periodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'period',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> periodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> periodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
          QAfterFilterCondition>
      periodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
          QAfterFilterCondition>
      periodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'period',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> periodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'period',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> periodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'period',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'procrastinationPatterns',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'procrastinationPatterns',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'procrastinationPatterns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'procrastinationPatterns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'procrastinationPatterns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'procrastinationPatterns',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'procrastinationPatterns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'procrastinationPatterns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
          QAfterFilterCondition>
      procrastinationPatternsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'procrastinationPatterns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
          QAfterFilterCondition>
      procrastinationPatternsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'procrastinationPatterns',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'procrastinationPatterns',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'procrastinationPatterns',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'procrastinationPatterns',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'procrastinationPatterns',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'procrastinationPatterns',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'procrastinationPatterns',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'procrastinationPatterns',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> procrastinationPatternsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'procrastinationPatterns',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> startDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> startDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalFocusTimeMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFocusTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalFocusTimeMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalFocusTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalFocusTimeMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalFocusTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalFocusTimeMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalFocusTimeMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalOverdueTasksEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalOverdueTasks',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalOverdueTasksGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalOverdueTasks',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalOverdueTasksLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalOverdueTasks',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalOverdueTasksBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalOverdueTasks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalTasksCompletedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTasksCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalTasksCompletedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalTasksCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalTasksCompletedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalTasksCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalTasksCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalTasksCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalTasksCreatedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTasksCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalTasksCreatedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalTasksCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalTasksCreatedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalTasksCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> totalTasksCreatedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalTasksCreated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
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

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension TaskAnalyticsCollectionQueryObject on QueryBuilder<
    TaskAnalyticsCollection, TaskAnalyticsCollection, QFilterCondition> {}

extension TaskAnalyticsCollectionQueryLinks on QueryBuilder<
    TaskAnalyticsCollection, TaskAnalyticsCollection, QFilterCondition> {}

extension TaskAnalyticsCollectionQuerySortBy
    on QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QSortBy> {
  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByAnalyticsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyticsId', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByAnalyticsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyticsId', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByCompletionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRate', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByCompletionRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRate', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByCompletionVelocity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionVelocity', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByCompletionVelocityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionVelocity', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByConsistencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByConsistencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByPendingDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByPendingDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByPendingUpload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByPendingUploadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByTotalFocusTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFocusTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByTotalFocusTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFocusTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByTotalOverdueTasks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOverdueTasks', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByTotalOverdueTasksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOverdueTasks', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByTotalTasksCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasksCompleted', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByTotalTasksCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasksCompleted', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByTotalTasksCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasksCreated', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByTotalTasksCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasksCreated', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension TaskAnalyticsCollectionQuerySortThenBy on QueryBuilder<
    TaskAnalyticsCollection, TaskAnalyticsCollection, QSortThenBy> {
  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByAnalyticsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyticsId', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByAnalyticsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyticsId', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByCompletionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRate', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByCompletionRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRate', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByCompletionVelocity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionVelocity', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByCompletionVelocityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionVelocity', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByConsistencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByConsistencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByPendingDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByPendingDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByPendingUpload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByPendingUploadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByTotalFocusTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFocusTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByTotalFocusTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFocusTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByTotalOverdueTasks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOverdueTasks', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByTotalOverdueTasksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOverdueTasks', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByTotalTasksCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasksCompleted', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByTotalTasksCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasksCompleted', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByTotalTasksCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasksCreated', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByTotalTasksCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasksCreated', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension TaskAnalyticsCollectionQueryWhereDistinct on QueryBuilder<
    TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct> {
  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByAiGeneratedInsights() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aiGeneratedInsights');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByAnalyticsId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'analyticsId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByCompletionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completionRate');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByCompletionVelocity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completionVelocity');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByConsistencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consistencyScore');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByPendingDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendingDelete');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByPendingUpload() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendingUpload');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByPeriod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'period', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByProcrastinationPatterns() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'procrastinationPatterns');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByTotalFocusTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFocusTimeMinutes');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByTotalOverdueTasks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalOverdueTasks');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByTotalTasksCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTasksCompleted');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByTotalTasksCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTasksCreated');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, TaskAnalyticsCollection, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension TaskAnalyticsCollectionQueryProperty on QueryBuilder<
    TaskAnalyticsCollection, TaskAnalyticsCollection, QQueryProperty> {
  QueryBuilder<TaskAnalyticsCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, List<String>?, QQueryOperations>
      aiGeneratedInsightsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aiGeneratedInsights');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, String, QQueryOperations>
      analyticsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'analyticsId');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, double, QQueryOperations>
      completionRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completionRate');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, double, QQueryOperations>
      completionVelocityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completionVelocity');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, double, QQueryOperations>
      consistencyScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consistencyScore');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, DateTime, QQueryOperations>
      endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, DateTime?, QQueryOperations>
      lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, bool, QQueryOperations>
      pendingDeleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendingDelete');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, bool, QQueryOperations>
      pendingUploadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendingUpload');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, String, QQueryOperations>
      periodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'period');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, List<String>?, QQueryOperations>
      procrastinationPatternsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'procrastinationPatterns');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, String?, QQueryOperations>
      remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, DateTime, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, SyncStatus, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, int, QQueryOperations>
      totalFocusTimeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFocusTimeMinutes');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, int, QQueryOperations>
      totalOverdueTasksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalOverdueTasks');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, int, QQueryOperations>
      totalTasksCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTasksCompleted');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, int, QQueryOperations>
      totalTasksCreatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTasksCreated');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TaskAnalyticsCollection, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
