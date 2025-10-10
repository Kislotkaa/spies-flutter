/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../core/models/data/word_category_data.dart' as _i2;

abstract class WordData
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  WordData._({
    _i1.UuidValue? id,
    required this.word,
    this.hint,
    this.wordCategoryId,
    this.wordCategory,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory WordData({
    _i1.UuidValue? id,
    required String word,
    String? hint,
    _i1.UuidValue? wordCategoryId,
    _i2.WordCategoryData? wordCategory,
  }) = _WordDataImpl;

  factory WordData.fromJson(Map<String, dynamic> jsonSerialization) {
    return WordData(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      word: jsonSerialization['word'] as String,
      hint: jsonSerialization['hint'] as String?,
      wordCategoryId: jsonSerialization['wordCategoryId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['wordCategoryId']),
      wordCategory: jsonSerialization['wordCategory'] == null
          ? null
          : _i2.WordCategoryData.fromJson(
              (jsonSerialization['wordCategory'] as Map<String, dynamic>)),
    );
  }

  static final t = WordDataTable();

  static const db = WordDataRepository._();

  @override
  _i1.UuidValue id;

  String word;

  String? hint;

  _i1.UuidValue? wordCategoryId;

  _i2.WordCategoryData? wordCategory;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [WordData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WordData copyWith({
    _i1.UuidValue? id,
    String? word,
    String? hint,
    _i1.UuidValue? wordCategoryId,
    _i2.WordCategoryData? wordCategory,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'word': word,
      if (hint != null) 'hint': hint,
      if (wordCategoryId != null) 'wordCategoryId': wordCategoryId?.toJson(),
      if (wordCategory != null) 'wordCategory': wordCategory?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'word': word,
      if (hint != null) 'hint': hint,
      if (wordCategoryId != null) 'wordCategoryId': wordCategoryId?.toJson(),
      if (wordCategory != null)
        'wordCategory': wordCategory?.toJsonForProtocol(),
    };
  }

  static WordDataInclude include({_i2.WordCategoryDataInclude? wordCategory}) {
    return WordDataInclude._(wordCategory: wordCategory);
  }

  static WordDataIncludeList includeList({
    _i1.WhereExpressionBuilder<WordDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WordDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WordDataTable>? orderByList,
    WordDataInclude? include,
  }) {
    return WordDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WordData.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WordData.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WordDataImpl extends WordData {
  _WordDataImpl({
    _i1.UuidValue? id,
    required String word,
    String? hint,
    _i1.UuidValue? wordCategoryId,
    _i2.WordCategoryData? wordCategory,
  }) : super._(
          id: id,
          word: word,
          hint: hint,
          wordCategoryId: wordCategoryId,
          wordCategory: wordCategory,
        );

  /// Returns a shallow copy of this [WordData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WordData copyWith({
    _i1.UuidValue? id,
    String? word,
    Object? hint = _Undefined,
    Object? wordCategoryId = _Undefined,
    Object? wordCategory = _Undefined,
  }) {
    return WordData(
      id: id ?? this.id,
      word: word ?? this.word,
      hint: hint is String? ? hint : this.hint,
      wordCategoryId: wordCategoryId is _i1.UuidValue?
          ? wordCategoryId
          : this.wordCategoryId,
      wordCategory: wordCategory is _i2.WordCategoryData?
          ? wordCategory
          : this.wordCategory?.copyWith(),
    );
  }
}

class WordDataTable extends _i1.Table<_i1.UuidValue> {
  WordDataTable({super.tableRelation}) : super(tableName: 'words') {
    word = _i1.ColumnString(
      'word',
      this,
    );
    hint = _i1.ColumnString(
      'hint',
      this,
    );
    wordCategoryId = _i1.ColumnUuid(
      'wordCategoryId',
      this,
    );
  }

  late final _i1.ColumnString word;

  late final _i1.ColumnString hint;

  late final _i1.ColumnUuid wordCategoryId;

  _i2.WordCategoryDataTable? _wordCategory;

  _i2.WordCategoryDataTable get wordCategory {
    if (_wordCategory != null) return _wordCategory!;
    _wordCategory = _i1.createRelationTable(
      relationFieldName: 'wordCategory',
      field: WordData.t.wordCategoryId,
      foreignField: _i2.WordCategoryData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.WordCategoryDataTable(tableRelation: foreignTableRelation),
    );
    return _wordCategory!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        word,
        hint,
        wordCategoryId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'wordCategory') {
      return wordCategory;
    }
    return null;
  }
}

class WordDataInclude extends _i1.IncludeObject {
  WordDataInclude._({_i2.WordCategoryDataInclude? wordCategory}) {
    _wordCategory = wordCategory;
  }

  _i2.WordCategoryDataInclude? _wordCategory;

  @override
  Map<String, _i1.Include?> get includes => {'wordCategory': _wordCategory};

  @override
  _i1.Table<_i1.UuidValue> get table => WordData.t;
}

class WordDataIncludeList extends _i1.IncludeList {
  WordDataIncludeList._({
    _i1.WhereExpressionBuilder<WordDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WordData.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => WordData.t;
}

class WordDataRepository {
  const WordDataRepository._();

  final attachRow = const WordDataAttachRowRepository._();

  final detachRow = const WordDataDetachRowRepository._();

  /// Returns a list of [WordData]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<WordData>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WordDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WordDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WordDataTable>? orderByList,
    _i1.Transaction? transaction,
    WordDataInclude? include,
  }) async {
    return session.db.find<WordData>(
      where: where?.call(WordData.t),
      orderBy: orderBy?.call(WordData.t),
      orderByList: orderByList?.call(WordData.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [WordData] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<WordData?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WordDataTable>? where,
    int? offset,
    _i1.OrderByBuilder<WordDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WordDataTable>? orderByList,
    _i1.Transaction? transaction,
    WordDataInclude? include,
  }) async {
    return session.db.findFirstRow<WordData>(
      where: where?.call(WordData.t),
      orderBy: orderBy?.call(WordData.t),
      orderByList: orderByList?.call(WordData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [WordData] by its [id] or null if no such row exists.
  Future<WordData?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    WordDataInclude? include,
  }) async {
    return session.db.findById<WordData>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [WordData]s in the list and returns the inserted rows.
  ///
  /// The returned [WordData]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<WordData>> insert(
    _i1.Session session,
    List<WordData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<WordData>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [WordData] and returns the inserted row.
  ///
  /// The returned [WordData] will have its `id` field set.
  Future<WordData> insertRow(
    _i1.Session session,
    WordData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<WordData>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [WordData]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<WordData>> update(
    _i1.Session session,
    List<WordData> rows, {
    _i1.ColumnSelections<WordDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<WordData>(
      rows,
      columns: columns?.call(WordData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WordData]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<WordData> updateRow(
    _i1.Session session,
    WordData row, {
    _i1.ColumnSelections<WordDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<WordData>(
      row,
      columns: columns?.call(WordData.t),
      transaction: transaction,
    );
  }

  /// Deletes all [WordData]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<WordData>> delete(
    _i1.Session session,
    List<WordData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WordData>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [WordData].
  Future<WordData> deleteRow(
    _i1.Session session,
    WordData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<WordData>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<WordData>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WordDataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<WordData>(
      where: where(WordData.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WordDataTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WordData>(
      where: where?.call(WordData.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class WordDataAttachRowRepository {
  const WordDataAttachRowRepository._();

  /// Creates a relation between the given [WordData] and [WordCategoryData]
  /// by setting the [WordData]'s foreign key `wordCategoryId` to refer to the [WordCategoryData].
  Future<void> wordCategory(
    _i1.Session session,
    WordData wordData,
    _i2.WordCategoryData wordCategory, {
    _i1.Transaction? transaction,
  }) async {
    if (wordData.id == null) {
      throw ArgumentError.notNull('wordData.id');
    }
    if (wordCategory.id == null) {
      throw ArgumentError.notNull('wordCategory.id');
    }

    var $wordData = wordData.copyWith(wordCategoryId: wordCategory.id);
    await session.db.updateRow<WordData>(
      $wordData,
      columns: [WordData.t.wordCategoryId],
      transaction: transaction,
    );
  }
}

class WordDataDetachRowRepository {
  const WordDataDetachRowRepository._();

  /// Detaches the relation between this [WordData] and the [WordCategoryData] set in `wordCategory`
  /// by setting the [WordData]'s foreign key `wordCategoryId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> wordCategory(
    _i1.Session session,
    WordData worddata, {
    _i1.Transaction? transaction,
  }) async {
    if (worddata.id == null) {
      throw ArgumentError.notNull('worddata.id');
    }

    var $worddata = worddata.copyWith(wordCategoryId: null);
    await session.db.updateRow<WordData>(
      $worddata,
      columns: [WordData.t.wordCategoryId],
      transaction: transaction,
    );
  }
}
