/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class WordCategoryData
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  WordCategoryData._({
    _i1.UuidValue? id,
    required this.name,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory WordCategoryData({
    _i1.UuidValue? id,
    required String name,
  }) = _WordCategoryDataImpl;

  factory WordCategoryData.fromJson(Map<String, dynamic> jsonSerialization) {
    return WordCategoryData(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
    );
  }

  static final t = WordCategoryDataTable();

  static const db = WordCategoryDataRepository._();

  @override
  _i1.UuidValue id;

  String name;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [WordCategoryData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WordCategoryData copyWith({
    _i1.UuidValue? id,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'name': name,
    };
  }

  static WordCategoryDataInclude include() {
    return WordCategoryDataInclude._();
  }

  static WordCategoryDataIncludeList includeList({
    _i1.WhereExpressionBuilder<WordCategoryDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WordCategoryDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WordCategoryDataTable>? orderByList,
    WordCategoryDataInclude? include,
  }) {
    return WordCategoryDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WordCategoryData.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WordCategoryData.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _WordCategoryDataImpl extends WordCategoryData {
  _WordCategoryDataImpl({
    _i1.UuidValue? id,
    required String name,
  }) : super._(
          id: id,
          name: name,
        );

  /// Returns a shallow copy of this [WordCategoryData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WordCategoryData copyWith({
    _i1.UuidValue? id,
    String? name,
  }) {
    return WordCategoryData(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

class WordCategoryDataTable extends _i1.Table<_i1.UuidValue> {
  WordCategoryDataTable({super.tableRelation})
      : super(tableName: 'word_categories') {
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final _i1.ColumnString name;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
      ];
}

class WordCategoryDataInclude extends _i1.IncludeObject {
  WordCategoryDataInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => WordCategoryData.t;
}

class WordCategoryDataIncludeList extends _i1.IncludeList {
  WordCategoryDataIncludeList._({
    _i1.WhereExpressionBuilder<WordCategoryDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WordCategoryData.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => WordCategoryData.t;
}

class WordCategoryDataRepository {
  const WordCategoryDataRepository._();

  /// Returns a list of [WordCategoryData]s matching the given query parameters.
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
  Future<List<WordCategoryData>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WordCategoryDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WordCategoryDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WordCategoryDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<WordCategoryData>(
      where: where?.call(WordCategoryData.t),
      orderBy: orderBy?.call(WordCategoryData.t),
      orderByList: orderByList?.call(WordCategoryData.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [WordCategoryData] matching the given query parameters.
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
  Future<WordCategoryData?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WordCategoryDataTable>? where,
    int? offset,
    _i1.OrderByBuilder<WordCategoryDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WordCategoryDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<WordCategoryData>(
      where: where?.call(WordCategoryData.t),
      orderBy: orderBy?.call(WordCategoryData.t),
      orderByList: orderByList?.call(WordCategoryData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [WordCategoryData] by its [id] or null if no such row exists.
  Future<WordCategoryData?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<WordCategoryData>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [WordCategoryData]s in the list and returns the inserted rows.
  ///
  /// The returned [WordCategoryData]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<WordCategoryData>> insert(
    _i1.Session session,
    List<WordCategoryData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<WordCategoryData>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [WordCategoryData] and returns the inserted row.
  ///
  /// The returned [WordCategoryData] will have its `id` field set.
  Future<WordCategoryData> insertRow(
    _i1.Session session,
    WordCategoryData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<WordCategoryData>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [WordCategoryData]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<WordCategoryData>> update(
    _i1.Session session,
    List<WordCategoryData> rows, {
    _i1.ColumnSelections<WordCategoryDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<WordCategoryData>(
      rows,
      columns: columns?.call(WordCategoryData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WordCategoryData]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<WordCategoryData> updateRow(
    _i1.Session session,
    WordCategoryData row, {
    _i1.ColumnSelections<WordCategoryDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<WordCategoryData>(
      row,
      columns: columns?.call(WordCategoryData.t),
      transaction: transaction,
    );
  }

  /// Deletes all [WordCategoryData]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<WordCategoryData>> delete(
    _i1.Session session,
    List<WordCategoryData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WordCategoryData>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [WordCategoryData].
  Future<WordCategoryData> deleteRow(
    _i1.Session session,
    WordCategoryData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<WordCategoryData>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<WordCategoryData>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WordCategoryDataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<WordCategoryData>(
      where: where(WordCategoryData.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WordCategoryDataTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WordCategoryData>(
      where: where?.call(WordCategoryData.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
