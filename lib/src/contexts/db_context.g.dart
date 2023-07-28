// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_context.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDBContextCollection on Isar {
  IsarCollection<DBContext> get dBContexts => this.collection();
}

const DBContextSchema = CollectionSchema(
  name: r'DBContext',
  id: -2221799641085509619,
  properties: {
    r'contextName': PropertySchema(
      id: 0,
      name: r'contextName',
      type: IsarType.string,
    ),
    r'dataInString': PropertySchema(
      id: 1,
      name: r'dataInString',
      type: IsarType.string,
    ),
    r'isImportant': PropertySchema(
      id: 2,
      name: r'isImportant',
      type: IsarType.bool,
    )
  },
  estimateSize: _dBContextEstimateSize,
  serialize: _dBContextSerialize,
  deserialize: _dBContextDeserialize,
  deserializeProp: _dBContextDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dBContextGetId,
  getLinks: _dBContextGetLinks,
  attach: _dBContextAttach,
  version: '3.1.0+1',
);

int _dBContextEstimateSize(
  DBContext object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.contextName.length * 3;
  bytesCount += 3 + object.dataInString.length * 3;
  return bytesCount;
}

void _dBContextSerialize(
  DBContext object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.contextName);
  writer.writeString(offsets[1], object.dataInString);
  writer.writeBool(offsets[2], object.isImportant);
}

DBContext _dBContextDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DBContext(
    reader.readString(offsets[0]),
  );
  object.id = id;
  object.isImportant = reader.readBool(offsets[2]);
  return object;
}

P _dBContextDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dBContextGetId(DBContext object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dBContextGetLinks(DBContext object) {
  return [];
}

void _dBContextAttach(IsarCollection<dynamic> col, Id id, DBContext object) {
  object.id = id;
}

extension DBContextQueryWhereSort
    on QueryBuilder<DBContext, DBContext, QWhere> {
  QueryBuilder<DBContext, DBContext, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DBContextQueryWhere
    on QueryBuilder<DBContext, DBContext, QWhereClause> {
  QueryBuilder<DBContext, DBContext, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DBContext, DBContext, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterWhereClause> idBetween(
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
}

extension DBContextQueryFilter
    on QueryBuilder<DBContext, DBContext, QFilterCondition> {
  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> contextNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contextName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition>
      contextNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contextName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> contextNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contextName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> contextNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contextName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition>
      contextNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contextName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> contextNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contextName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> contextNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contextName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> contextNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contextName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition>
      contextNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contextName',
        value: '',
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition>
      contextNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contextName',
        value: '',
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> dataInStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataInString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition>
      dataInStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataInString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition>
      dataInStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataInString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> dataInStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataInString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition>
      dataInStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dataInString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition>
      dataInStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dataInString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition>
      dataInStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataInString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> dataInStringMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dataInString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition>
      dataInStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataInString',
        value: '',
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition>
      dataInStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataInString',
        value: '',
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DBContext, DBContext, QAfterFilterCondition> isImportantEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isImportant',
        value: value,
      ));
    });
  }
}

extension DBContextQueryObject
    on QueryBuilder<DBContext, DBContext, QFilterCondition> {}

extension DBContextQueryLinks
    on QueryBuilder<DBContext, DBContext, QFilterCondition> {}

extension DBContextQuerySortBy on QueryBuilder<DBContext, DBContext, QSortBy> {
  QueryBuilder<DBContext, DBContext, QAfterSortBy> sortByContextName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contextName', Sort.asc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> sortByContextNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contextName', Sort.desc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> sortByDataInString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInString', Sort.asc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> sortByDataInStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInString', Sort.desc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> sortByIsImportant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isImportant', Sort.asc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> sortByIsImportantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isImportant', Sort.desc);
    });
  }
}

extension DBContextQuerySortThenBy
    on QueryBuilder<DBContext, DBContext, QSortThenBy> {
  QueryBuilder<DBContext, DBContext, QAfterSortBy> thenByContextName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contextName', Sort.asc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> thenByContextNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contextName', Sort.desc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> thenByDataInString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInString', Sort.asc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> thenByDataInStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInString', Sort.desc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> thenByIsImportant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isImportant', Sort.asc);
    });
  }

  QueryBuilder<DBContext, DBContext, QAfterSortBy> thenByIsImportantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isImportant', Sort.desc);
    });
  }
}

extension DBContextQueryWhereDistinct
    on QueryBuilder<DBContext, DBContext, QDistinct> {
  QueryBuilder<DBContext, DBContext, QDistinct> distinctByContextName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contextName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DBContext, DBContext, QDistinct> distinctByDataInString(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataInString', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DBContext, DBContext, QDistinct> distinctByIsImportant() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isImportant');
    });
  }
}

extension DBContextQueryProperty
    on QueryBuilder<DBContext, DBContext, QQueryProperty> {
  QueryBuilder<DBContext, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DBContext, String, QQueryOperations> contextNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contextName');
    });
  }

  QueryBuilder<DBContext, String, QQueryOperations> dataInStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataInString');
    });
  }

  QueryBuilder<DBContext, bool, QQueryOperations> isImportantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isImportant');
    });
  }
}
