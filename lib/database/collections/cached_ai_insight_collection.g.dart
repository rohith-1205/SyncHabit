// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_ai_insight_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCachedAiInsightCollectionCollection on Isar {
  IsarCollection<CachedAiInsightCollection> get cachedAiInsightCollections =>
      this.collection();
}

const CachedAiInsightCollectionSchema = CollectionSchema(
  name: r'CachedAiInsightCollection',
  id: -8357808432378924830,
  properties: {
    r'actionableSteps': PropertySchema(
      id: 0,
      name: r'actionableSteps',
      type: IsarType.stringList,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
    ),
    r'expiresAt': PropertySchema(
      id: 2,
      name: r'expiresAt',
      type: IsarType.dateTime,
    ),
    r'fullPromptResponse': PropertySchema(
      id: 3,
      name: r'fullPromptResponse',
      type: IsarType.string,
    ),
    r'generatedAt': PropertySchema(
      id: 4,
      name: r'generatedAt',
      type: IsarType.dateTime,
    ),
    r'insightId': PropertySchema(
      id: 5,
      name: r'insightId',
      type: IsarType.string,
    ),
    r'isRead': PropertySchema(
      id: 6,
      name: r'isRead',
      type: IsarType.bool,
    ),
    r'summary': PropertySchema(
      id: 7,
      name: r'summary',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 8,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _cachedAiInsightCollectionEstimateSize,
  serialize: _cachedAiInsightCollectionSerialize,
  deserialize: _cachedAiInsightCollectionDeserialize,
  deserializeProp: _cachedAiInsightCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'insightId': IndexSchema(
      id: 5818887354909674719,
      name: r'insightId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'insightId',
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
    r'generatedAt': IndexSchema(
      id: 4527473099475400258,
      name: r'generatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'generatedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _cachedAiInsightCollectionGetId,
  getLinks: _cachedAiInsightCollectionGetLinks,
  attach: _cachedAiInsightCollectionAttach,
  version: '3.1.0+1',
);

int _cachedAiInsightCollectionEstimateSize(
  CachedAiInsightCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.actionableSteps.length * 3;
  {
    for (var i = 0; i < object.actionableSteps.length; i++) {
      final value = object.actionableSteps[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.fullPromptResponse.length * 3;
  bytesCount += 3 + object.insightId.length * 3;
  bytesCount += 3 + object.summary.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _cachedAiInsightCollectionSerialize(
  CachedAiInsightCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.actionableSteps);
  writer.writeString(offsets[1], object.category);
  writer.writeDateTime(offsets[2], object.expiresAt);
  writer.writeString(offsets[3], object.fullPromptResponse);
  writer.writeDateTime(offsets[4], object.generatedAt);
  writer.writeString(offsets[5], object.insightId);
  writer.writeBool(offsets[6], object.isRead);
  writer.writeString(offsets[7], object.summary);
  writer.writeString(offsets[8], object.userId);
}

CachedAiInsightCollection _cachedAiInsightCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CachedAiInsightCollection();
  object.actionableSteps = reader.readStringList(offsets[0]) ?? [];
  object.category = reader.readString(offsets[1]);
  object.expiresAt = reader.readDateTime(offsets[2]);
  object.fullPromptResponse = reader.readString(offsets[3]);
  object.generatedAt = reader.readDateTime(offsets[4]);
  object.id = id;
  object.insightId = reader.readString(offsets[5]);
  object.isRead = reader.readBool(offsets[6]);
  object.summary = reader.readString(offsets[7]);
  object.userId = reader.readString(offsets[8]);
  return object;
}

P _cachedAiInsightCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cachedAiInsightCollectionGetId(CachedAiInsightCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cachedAiInsightCollectionGetLinks(
    CachedAiInsightCollection object) {
  return [];
}

void _cachedAiInsightCollectionAttach(
    IsarCollection<dynamic> col, Id id, CachedAiInsightCollection object) {
  object.id = id;
}

extension CachedAiInsightCollectionByIndex
    on IsarCollection<CachedAiInsightCollection> {
  Future<CachedAiInsightCollection?> getByInsightId(String insightId) {
    return getByIndex(r'insightId', [insightId]);
  }

  CachedAiInsightCollection? getByInsightIdSync(String insightId) {
    return getByIndexSync(r'insightId', [insightId]);
  }

  Future<bool> deleteByInsightId(String insightId) {
    return deleteByIndex(r'insightId', [insightId]);
  }

  bool deleteByInsightIdSync(String insightId) {
    return deleteByIndexSync(r'insightId', [insightId]);
  }

  Future<List<CachedAiInsightCollection?>> getAllByInsightId(
      List<String> insightIdValues) {
    final values = insightIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'insightId', values);
  }

  List<CachedAiInsightCollection?> getAllByInsightIdSync(
      List<String> insightIdValues) {
    final values = insightIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'insightId', values);
  }

  Future<int> deleteAllByInsightId(List<String> insightIdValues) {
    final values = insightIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'insightId', values);
  }

  int deleteAllByInsightIdSync(List<String> insightIdValues) {
    final values = insightIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'insightId', values);
  }

  Future<Id> putByInsightId(CachedAiInsightCollection object) {
    return putByIndex(r'insightId', object);
  }

  Id putByInsightIdSync(CachedAiInsightCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'insightId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInsightId(List<CachedAiInsightCollection> objects) {
    return putAllByIndex(r'insightId', objects);
  }

  List<Id> putAllByInsightIdSync(List<CachedAiInsightCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'insightId', objects, saveLinks: saveLinks);
  }
}

extension CachedAiInsightCollectionQueryWhereSort on QueryBuilder<
    CachedAiInsightCollection, CachedAiInsightCollection, QWhere> {
  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhere> anyGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'generatedAt'),
      );
    });
  }
}

extension CachedAiInsightCollectionQueryWhere on QueryBuilder<
    CachedAiInsightCollection, CachedAiInsightCollection, QWhereClause> {
  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhereClause> insightIdEqualTo(String insightId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'insightId',
        value: [insightId],
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhereClause> insightIdNotEqualTo(String insightId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'insightId',
              lower: [],
              upper: [insightId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'insightId',
              lower: [insightId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'insightId',
              lower: [insightId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'insightId',
              lower: [],
              upper: [insightId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhereClause> userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhereClause> generatedAtEqualTo(DateTime generatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'generatedAt',
        value: [generatedAt],
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhereClause> generatedAtNotEqualTo(DateTime generatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'generatedAt',
              lower: [],
              upper: [generatedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'generatedAt',
              lower: [generatedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'generatedAt',
              lower: [generatedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'generatedAt',
              lower: [],
              upper: [generatedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhereClause> generatedAtGreaterThan(
    DateTime generatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'generatedAt',
        lower: [generatedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhereClause> generatedAtLessThan(
    DateTime generatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'generatedAt',
        lower: [],
        upper: [generatedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterWhereClause> generatedAtBetween(
    DateTime lowerGeneratedAt,
    DateTime upperGeneratedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'generatedAt',
        lower: [lowerGeneratedAt],
        includeLower: includeLower,
        upper: [upperGeneratedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CachedAiInsightCollectionQueryFilter on QueryBuilder<
    CachedAiInsightCollection, CachedAiInsightCollection, QFilterCondition> {
  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionableSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actionableSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actionableSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actionableSteps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actionableSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actionableSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
          QAfterFilterCondition>
      actionableStepsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actionableSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
          QAfterFilterCondition>
      actionableStepsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actionableSteps',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionableSteps',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actionableSteps',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionableSteps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionableSteps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionableSteps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionableSteps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionableSteps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> actionableStepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionableSteps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> expiresAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> expiresAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> expiresAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> expiresAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiresAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> fullPromptResponseEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullPromptResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> fullPromptResponseGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullPromptResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> fullPromptResponseLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullPromptResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> fullPromptResponseBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullPromptResponse',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> fullPromptResponseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullPromptResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> fullPromptResponseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullPromptResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
          QAfterFilterCondition>
      fullPromptResponseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullPromptResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
          QAfterFilterCondition>
      fullPromptResponseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullPromptResponse',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> fullPromptResponseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullPromptResponse',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> fullPromptResponseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullPromptResponse',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> generatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> generatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> generatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> generatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> insightIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insightId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> insightIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'insightId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> insightIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'insightId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> insightIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'insightId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> insightIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'insightId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> insightIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'insightId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
          QAfterFilterCondition>
      insightIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'insightId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
          QAfterFilterCondition>
      insightIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'insightId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> insightIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insightId',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> insightIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'insightId',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> isReadEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRead',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> summaryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> summaryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> summaryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> summaryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'summary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> summaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> summaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
          QAfterFilterCondition>
      summaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
          QAfterFilterCondition>
      summaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'summary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> summaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> summaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
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

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension CachedAiInsightCollectionQueryObject on QueryBuilder<
    CachedAiInsightCollection, CachedAiInsightCollection, QFilterCondition> {}

extension CachedAiInsightCollectionQueryLinks on QueryBuilder<
    CachedAiInsightCollection, CachedAiInsightCollection, QFilterCondition> {}

extension CachedAiInsightCollectionQuerySortBy on QueryBuilder<
    CachedAiInsightCollection, CachedAiInsightCollection, QSortBy> {
  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByFullPromptResponse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullPromptResponse', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByFullPromptResponseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullPromptResponse', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByInsightId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insightId', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByInsightIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insightId', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension CachedAiInsightCollectionQuerySortThenBy on QueryBuilder<
    CachedAiInsightCollection, CachedAiInsightCollection, QSortThenBy> {
  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByFullPromptResponse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullPromptResponse', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByFullPromptResponseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullPromptResponse', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByInsightId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insightId', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByInsightIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'insightId', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection,
      QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension CachedAiInsightCollectionQueryWhereDistinct on QueryBuilder<
    CachedAiInsightCollection, CachedAiInsightCollection, QDistinct> {
  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection, QDistinct>
      distinctByActionableSteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actionableSteps');
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection, QDistinct>
      distinctByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiresAt');
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection, QDistinct>
      distinctByFullPromptResponse({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullPromptResponse',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection, QDistinct>
      distinctByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generatedAt');
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection, QDistinct>
      distinctByInsightId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'insightId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection, QDistinct>
      distinctByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRead');
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection, QDistinct>
      distinctBySummary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CachedAiInsightCollection, CachedAiInsightCollection, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension CachedAiInsightCollectionQueryProperty on QueryBuilder<
    CachedAiInsightCollection, CachedAiInsightCollection, QQueryProperty> {
  QueryBuilder<CachedAiInsightCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CachedAiInsightCollection, List<String>, QQueryOperations>
      actionableStepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actionableSteps');
    });
  }

  QueryBuilder<CachedAiInsightCollection, String, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<CachedAiInsightCollection, DateTime, QQueryOperations>
      expiresAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiresAt');
    });
  }

  QueryBuilder<CachedAiInsightCollection, String, QQueryOperations>
      fullPromptResponseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullPromptResponse');
    });
  }

  QueryBuilder<CachedAiInsightCollection, DateTime, QQueryOperations>
      generatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generatedAt');
    });
  }

  QueryBuilder<CachedAiInsightCollection, String, QQueryOperations>
      insightIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'insightId');
    });
  }

  QueryBuilder<CachedAiInsightCollection, bool, QQueryOperations>
      isReadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRead');
    });
  }

  QueryBuilder<CachedAiInsightCollection, String, QQueryOperations>
      summaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summary');
    });
  }

  QueryBuilder<CachedAiInsightCollection, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
