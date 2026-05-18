// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserSettingsCollectionCollection on Isar {
  IsarCollection<UserSettingsCollection> get userSettingsCollections =>
      this.collection();
}

const UserSettingsCollectionSchema = CollectionSchema(
  name: r'UserSettingsCollection',
  id: 2198677565983065002,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isDarkMode': PropertySchema(
      id: 1,
      name: r'isDarkMode',
      type: IsarType.bool,
    ),
    r'lastSyncedAt': PropertySchema(
      id: 2,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'longBreakLengthMinutes': PropertySchema(
      id: 3,
      name: r'longBreakLengthMinutes',
      type: IsarType.long,
    ),
    r'notificationsEnabled': PropertySchema(
      id: 4,
      name: r'notificationsEnabled',
      type: IsarType.bool,
    ),
    r'pendingDelete': PropertySchema(
      id: 5,
      name: r'pendingDelete',
      type: IsarType.bool,
    ),
    r'pendingUpload': PropertySchema(
      id: 6,
      name: r'pendingUpload',
      type: IsarType.bool,
    ),
    r'pomodoroLengthMinutes': PropertySchema(
      id: 7,
      name: r'pomodoroLengthMinutes',
      type: IsarType.long,
    ),
    r'remoteId': PropertySchema(
      id: 8,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'shortBreakLengthMinutes': PropertySchema(
      id: 9,
      name: r'shortBreakLengthMinutes',
      type: IsarType.long,
    ),
    r'soundEffectsEnabled': PropertySchema(
      id: 10,
      name: r'soundEffectsEnabled',
      type: IsarType.bool,
    ),
    r'syncStatus': PropertySchema(
      id: 11,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _UserSettingsCollectionsyncStatusEnumValueMap,
    ),
    r'themePrimaryColorHex': PropertySchema(
      id: 12,
      name: r'themePrimaryColorHex',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 14,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _userSettingsCollectionEstimateSize,
  serialize: _userSettingsCollectionSerialize,
  deserialize: _userSettingsCollectionDeserialize,
  deserializeProp: _userSettingsCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: true,
      replace: true,
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
  getId: _userSettingsCollectionGetId,
  getLinks: _userSettingsCollectionGetLinks,
  attach: _userSettingsCollectionAttach,
  version: '3.1.0+1',
);

int _userSettingsCollectionEstimateSize(
  UserSettingsCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.themePrimaryColorHex.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _userSettingsCollectionSerialize(
  UserSettingsCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeBool(offsets[1], object.isDarkMode);
  writer.writeDateTime(offsets[2], object.lastSyncedAt);
  writer.writeLong(offsets[3], object.longBreakLengthMinutes);
  writer.writeBool(offsets[4], object.notificationsEnabled);
  writer.writeBool(offsets[5], object.pendingDelete);
  writer.writeBool(offsets[6], object.pendingUpload);
  writer.writeLong(offsets[7], object.pomodoroLengthMinutes);
  writer.writeString(offsets[8], object.remoteId);
  writer.writeLong(offsets[9], object.shortBreakLengthMinutes);
  writer.writeBool(offsets[10], object.soundEffectsEnabled);
  writer.writeByte(offsets[11], object.syncStatus.index);
  writer.writeString(offsets[12], object.themePrimaryColorHex);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeString(offsets[14], object.userId);
}

UserSettingsCollection _userSettingsCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserSettingsCollection();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.isDarkMode = reader.readBool(offsets[1]);
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[2]);
  object.longBreakLengthMinutes = reader.readLong(offsets[3]);
  object.notificationsEnabled = reader.readBool(offsets[4]);
  object.pendingDelete = reader.readBool(offsets[5]);
  object.pendingUpload = reader.readBool(offsets[6]);
  object.pomodoroLengthMinutes = reader.readLong(offsets[7]);
  object.remoteId = reader.readStringOrNull(offsets[8]);
  object.shortBreakLengthMinutes = reader.readLong(offsets[9]);
  object.soundEffectsEnabled = reader.readBool(offsets[10]);
  object.syncStatus = _UserSettingsCollectionsyncStatusValueEnumMap[
          reader.readByteOrNull(offsets[11])] ??
      SyncStatus.synced;
  object.themePrimaryColorHex = reader.readString(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  object.userId = reader.readString(offsets[14]);
  return object;
}

P _userSettingsCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (_UserSettingsCollectionsyncStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.synced) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _UserSettingsCollectionsyncStatusEnumValueMap = {
  'synced': 0,
  'pendingUpload': 1,
  'pendingUpdate': 2,
  'pendingDelete': 3,
  'conflict': 4,
  'pending': 5,
  'failed': 6,
};
const _UserSettingsCollectionsyncStatusValueEnumMap = {
  0: SyncStatus.synced,
  1: SyncStatus.pendingUpload,
  2: SyncStatus.pendingUpdate,
  3: SyncStatus.pendingDelete,
  4: SyncStatus.conflict,
  5: SyncStatus.pending,
  6: SyncStatus.failed,
};

Id _userSettingsCollectionGetId(UserSettingsCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userSettingsCollectionGetLinks(
    UserSettingsCollection object) {
  return [];
}

void _userSettingsCollectionAttach(
    IsarCollection<dynamic> col, Id id, UserSettingsCollection object) {
  object.id = id;
}

extension UserSettingsCollectionByIndex
    on IsarCollection<UserSettingsCollection> {
  Future<UserSettingsCollection?> getByUserId(String userId) {
    return getByIndex(r'userId', [userId]);
  }

  UserSettingsCollection? getByUserIdSync(String userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<UserSettingsCollection?>> getAllByUserId(
      List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<UserSettingsCollection?> getAllByUserIdSync(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userId', values);
  }

  Future<int> deleteAllByUserId(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userId', values);
  }

  int deleteAllByUserIdSync(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userId', values);
  }

  Future<Id> putByUserId(UserSettingsCollection object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(UserSettingsCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<UserSettingsCollection> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<UserSettingsCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension UserSettingsCollectionQueryWhereSort
    on QueryBuilder<UserSettingsCollection, UserSettingsCollection, QWhere> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterWhere>
      anySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncStatus'),
      );
    });
  }
}

extension UserSettingsCollectionQueryWhere on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QWhereClause> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterWhereClause> userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterWhereClause> syncStatusEqualTo(SyncStatus syncStatus) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncStatus',
        value: [syncStatus],
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterWhereClause> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [null],
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterWhereClause> remoteIdEqualTo(String? remoteId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [remoteId],
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

extension UserSettingsCollectionQueryFilter on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QFilterCondition> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> isDarkModeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDarkMode',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> lastSyncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncedAt',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> lastSyncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncedAt',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> lastSyncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> longBreakLengthMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longBreakLengthMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> longBreakLengthMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longBreakLengthMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> longBreakLengthMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longBreakLengthMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> longBreakLengthMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longBreakLengthMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> notificationsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationsEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> pendingDeleteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendingDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> pendingUploadEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendingUpload',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> pomodoroLengthMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pomodoroLengthMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> pomodoroLengthMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pomodoroLengthMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> pomodoroLengthMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pomodoroLengthMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> pomodoroLengthMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pomodoroLengthMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> shortBreakLengthMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortBreakLengthMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> shortBreakLengthMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shortBreakLengthMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> shortBreakLengthMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shortBreakLengthMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> shortBreakLengthMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shortBreakLengthMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> soundEffectsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soundEffectsEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themePrimaryColorHexEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themePrimaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themePrimaryColorHexGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themePrimaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themePrimaryColorHexLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themePrimaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themePrimaryColorHexBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themePrimaryColorHex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themePrimaryColorHexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'themePrimaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themePrimaryColorHexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'themePrimaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
          QAfterFilterCondition>
      themePrimaryColorHexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'themePrimaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
          QAfterFilterCondition>
      themePrimaryColorHexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'themePrimaryColorHex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themePrimaryColorHexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themePrimaryColorHex',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themePrimaryColorHexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'themePrimaryColorHex',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension UserSettingsCollectionQueryObject on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QFilterCondition> {}

extension UserSettingsCollectionQueryLinks on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QFilterCondition> {}

extension UserSettingsCollectionQuerySortBy
    on QueryBuilder<UserSettingsCollection, UserSettingsCollection, QSortBy> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByIsDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByIsDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLongBreakLengthMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longBreakLengthMinutes', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLongBreakLengthMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longBreakLengthMinutes', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByPendingDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByPendingDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByPendingUpload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByPendingUploadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByPomodoroLengthMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pomodoroLengthMinutes', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByPomodoroLengthMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pomodoroLengthMinutes', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByShortBreakLengthMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortBreakLengthMinutes', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByShortBreakLengthMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortBreakLengthMinutes', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortBySoundEffectsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEffectsEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortBySoundEffectsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEffectsEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByThemePrimaryColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themePrimaryColorHex', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByThemePrimaryColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themePrimaryColorHex', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserSettingsCollectionQuerySortThenBy on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QSortThenBy> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByIsDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByIsDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLongBreakLengthMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longBreakLengthMinutes', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLongBreakLengthMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longBreakLengthMinutes', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByPendingDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByPendingDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingDelete', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByPendingUpload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByPendingUploadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingUpload', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByPomodoroLengthMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pomodoroLengthMinutes', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByPomodoroLengthMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pomodoroLengthMinutes', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByShortBreakLengthMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortBreakLengthMinutes', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByShortBreakLengthMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortBreakLengthMinutes', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenBySoundEffectsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEffectsEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenBySoundEffectsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEffectsEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByThemePrimaryColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themePrimaryColorHex', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByThemePrimaryColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themePrimaryColorHex', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserSettingsCollectionQueryWhereDistinct
    on QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByIsDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDarkMode');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByLongBreakLengthMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longBreakLengthMinutes');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationsEnabled');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByPendingDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendingDelete');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByPendingUpload() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendingUpload');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByPomodoroLengthMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pomodoroLengthMinutes');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByShortBreakLengthMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shortBreakLengthMinutes');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctBySoundEffectsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soundEffectsEnabled');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByThemePrimaryColorHex({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themePrimaryColorHex',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension UserSettingsCollectionQueryProperty on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QQueryProperty> {
  QueryBuilder<UserSettingsCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserSettingsCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<UserSettingsCollection, bool, QQueryOperations>
      isDarkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDarkMode');
    });
  }

  QueryBuilder<UserSettingsCollection, DateTime?, QQueryOperations>
      lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<UserSettingsCollection, int, QQueryOperations>
      longBreakLengthMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longBreakLengthMinutes');
    });
  }

  QueryBuilder<UserSettingsCollection, bool, QQueryOperations>
      notificationsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationsEnabled');
    });
  }

  QueryBuilder<UserSettingsCollection, bool, QQueryOperations>
      pendingDeleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendingDelete');
    });
  }

  QueryBuilder<UserSettingsCollection, bool, QQueryOperations>
      pendingUploadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendingUpload');
    });
  }

  QueryBuilder<UserSettingsCollection, int, QQueryOperations>
      pomodoroLengthMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pomodoroLengthMinutes');
    });
  }

  QueryBuilder<UserSettingsCollection, String?, QQueryOperations>
      remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<UserSettingsCollection, int, QQueryOperations>
      shortBreakLengthMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shortBreakLengthMinutes');
    });
  }

  QueryBuilder<UserSettingsCollection, bool, QQueryOperations>
      soundEffectsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soundEffectsEnabled');
    });
  }

  QueryBuilder<UserSettingsCollection, SyncStatus, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<UserSettingsCollection, String, QQueryOperations>
      themePrimaryColorHexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themePrimaryColorHex');
    });
  }

  QueryBuilder<UserSettingsCollection, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<UserSettingsCollection, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
