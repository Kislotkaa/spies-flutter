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

abstract class UserData
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  UserData._({
    _i1.UuidValue? id,
    required this.deviceId,
    required this.name,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory UserData({
    _i1.UuidValue? id,
    required String deviceId,
    required String name,
  }) = _UserDataImpl;

  factory UserData.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserData(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      deviceId: jsonSerialization['deviceId'] as String,
      name: jsonSerialization['name'] as String,
    );
  }

  static final t = UserDataTable();

  static const db = UserDataRepository._();

  @override
  _i1.UuidValue id;

  String deviceId;

  String name;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [UserData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserData copyWith({
    _i1.UuidValue? id,
    String? deviceId,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'deviceId': deviceId,
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'deviceId': deviceId,
      'name': name,
    };
  }

  static UserDataInclude include() {
    return UserDataInclude._();
  }

  static UserDataIncludeList includeList({
    _i1.WhereExpressionBuilder<UserDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserDataTable>? orderByList,
    UserDataInclude? include,
  }) {
    return UserDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserData.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserData.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UserDataImpl extends UserData {
  _UserDataImpl({
    _i1.UuidValue? id,
    required String deviceId,
    required String name,
  }) : super._(
          id: id,
          deviceId: deviceId,
          name: name,
        );

  /// Returns a shallow copy of this [UserData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserData copyWith({
    _i1.UuidValue? id,
    String? deviceId,
    String? name,
  }) {
    return UserData(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      name: name ?? this.name,
    );
  }
}

class UserDataTable extends _i1.Table<_i1.UuidValue> {
  UserDataTable({super.tableRelation}) : super(tableName: 'users') {
    deviceId = _i1.ColumnString(
      'deviceId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final _i1.ColumnString deviceId;

  late final _i1.ColumnString name;

  @override
  List<_i1.Column> get columns => [
        id,
        deviceId,
        name,
      ];
}

class UserDataInclude extends _i1.IncludeObject {
  UserDataInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => UserData.t;
}

class UserDataIncludeList extends _i1.IncludeList {
  UserDataIncludeList._({
    _i1.WhereExpressionBuilder<UserDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserData.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => UserData.t;
}

class UserDataRepository {
  const UserDataRepository._();

  /// Returns a list of [UserData]s matching the given query parameters.
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
  Future<List<UserData>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserData>(
      where: where?.call(UserData.t),
      orderBy: orderBy?.call(UserData.t),
      orderByList: orderByList?.call(UserData.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserData] matching the given query parameters.
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
  Future<UserData?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserDataTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserData>(
      where: where?.call(UserData.t),
      orderBy: orderBy?.call(UserData.t),
      orderByList: orderByList?.call(UserData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserData] by its [id] or null if no such row exists.
  Future<UserData?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserData>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserData]s in the list and returns the inserted rows.
  ///
  /// The returned [UserData]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserData>> insert(
    _i1.Session session,
    List<UserData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserData>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserData] and returns the inserted row.
  ///
  /// The returned [UserData] will have its `id` field set.
  Future<UserData> insertRow(
    _i1.Session session,
    UserData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserData>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserData]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserData>> update(
    _i1.Session session,
    List<UserData> rows, {
    _i1.ColumnSelections<UserDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserData>(
      rows,
      columns: columns?.call(UserData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserData]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserData> updateRow(
    _i1.Session session,
    UserData row, {
    _i1.ColumnSelections<UserDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserData>(
      row,
      columns: columns?.call(UserData.t),
      transaction: transaction,
    );
  }

  /// Deletes all [UserData]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserData>> delete(
    _i1.Session session,
    List<UserData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserData>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserData].
  Future<UserData> deleteRow(
    _i1.Session session,
    UserData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserData>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserData>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserDataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserData>(
      where: where(UserData.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserDataTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserData>(
      where: where?.call(UserData.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
