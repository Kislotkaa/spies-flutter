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
import '../enums/game_status.dart' as _i2;
import '../data/user_data.dart' as _i3;
import '../data/word_data.dart' as _i4;
import '../data/suggest_word_data.dart' as _i5;
import '../data/word_category_data.dart' as _i6;

abstract class GameData
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  GameData._({
    _i1.UuidValue? id,
    required this.owner,
    required this.name,
    required this.code,
    this.spyUserId,
    this.currentWordId,
    this.currentWord,
    this.nextWordId,
    this.nextWord,
    this.suggestWord,
    required this.wordCategoryList,
    required this.playerList,
    required this.isShowWordHint,
    required this.isSubmittedUserWord,
    DateTime? createAt,
    _i2.GameStatus? status,
  })  : id = id ?? _i1.Uuid().v4obj(),
        createAt = createAt ?? DateTime.now(),
        status = status ?? _i2.GameStatus.created;

  factory GameData({
    _i1.UuidValue? id,
    required _i3.UserData owner,
    required String name,
    required String code,
    _i1.UuidValue? spyUserId,
    _i1.UuidValue? currentWordId,
    _i4.WordData? currentWord,
    _i1.UuidValue? nextWordId,
    _i4.WordData? nextWord,
    _i5.SuggestWordData? suggestWord,
    required List<_i6.WordCategoryData> wordCategoryList,
    required List<_i3.UserData> playerList,
    required bool isShowWordHint,
    required bool isSubmittedUserWord,
    DateTime? createAt,
    _i2.GameStatus? status,
  }) = _GameDataImpl;

  factory GameData.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameData(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      owner: _i3.UserData.fromJson(
          (jsonSerialization['owner'] as Map<String, dynamic>)),
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      spyUserId: jsonSerialization['spyUserId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['spyUserId']),
      currentWordId: jsonSerialization['currentWordId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['currentWordId']),
      currentWord: jsonSerialization['currentWord'] == null
          ? null
          : _i4.WordData.fromJson(
              (jsonSerialization['currentWord'] as Map<String, dynamic>)),
      nextWordId: jsonSerialization['nextWordId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['nextWordId']),
      nextWord: jsonSerialization['nextWord'] == null
          ? null
          : _i4.WordData.fromJson(
              (jsonSerialization['nextWord'] as Map<String, dynamic>)),
      suggestWord: jsonSerialization['suggestWord'] == null
          ? null
          : _i5.SuggestWordData.fromJson(
              (jsonSerialization['suggestWord'] as Map<String, dynamic>)),
      wordCategoryList: (jsonSerialization['wordCategoryList'] as List)
          .map(
              (e) => _i6.WordCategoryData.fromJson((e as Map<String, dynamic>)))
          .toList(),
      playerList: (jsonSerialization['playerList'] as List)
          .map((e) => _i3.UserData.fromJson((e as Map<String, dynamic>)))
          .toList(),
      isShowWordHint: jsonSerialization['isShowWordHint'] as bool,
      isSubmittedUserWord: jsonSerialization['isSubmittedUserWord'] as bool,
      createAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createAt']),
      status: _i2.GameStatus.fromJson((jsonSerialization['status'] as int)),
    );
  }

  static final t = GameDataTable();

  static const db = GameDataRepository._();

  @override
  _i1.UuidValue id;

  _i3.UserData owner;

  String name;

  String code;

  _i1.UuidValue? spyUserId;

  _i1.UuidValue? currentWordId;

  _i4.WordData? currentWord;

  _i1.UuidValue? nextWordId;

  _i4.WordData? nextWord;

  _i5.SuggestWordData? suggestWord;

  List<_i6.WordCategoryData> wordCategoryList;

  List<_i3.UserData> playerList;

  bool isShowWordHint;

  bool isSubmittedUserWord;

  DateTime createAt;

  _i2.GameStatus status;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [GameData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GameData copyWith({
    _i1.UuidValue? id,
    _i3.UserData? owner,
    String? name,
    String? code,
    _i1.UuidValue? spyUserId,
    _i1.UuidValue? currentWordId,
    _i4.WordData? currentWord,
    _i1.UuidValue? nextWordId,
    _i4.WordData? nextWord,
    _i5.SuggestWordData? suggestWord,
    List<_i6.WordCategoryData>? wordCategoryList,
    List<_i3.UserData>? playerList,
    bool? isShowWordHint,
    bool? isSubmittedUserWord,
    DateTime? createAt,
    _i2.GameStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'owner': owner.toJson(),
      'name': name,
      'code': code,
      if (spyUserId != null) 'spyUserId': spyUserId?.toJson(),
      if (currentWordId != null) 'currentWordId': currentWordId?.toJson(),
      if (currentWord != null) 'currentWord': currentWord?.toJson(),
      if (nextWordId != null) 'nextWordId': nextWordId?.toJson(),
      if (nextWord != null) 'nextWord': nextWord?.toJson(),
      if (suggestWord != null) 'suggestWord': suggestWord?.toJson(),
      'wordCategoryList':
          wordCategoryList.toJson(valueToJson: (v) => v.toJson()),
      'playerList': playerList.toJson(valueToJson: (v) => v.toJson()),
      'isShowWordHint': isShowWordHint,
      'isSubmittedUserWord': isSubmittedUserWord,
      'createAt': createAt.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'owner': owner.toJsonForProtocol(),
      'name': name,
      'code': code,
      if (spyUserId != null) 'spyUserId': spyUserId?.toJson(),
      if (currentWordId != null) 'currentWordId': currentWordId?.toJson(),
      if (currentWord != null) 'currentWord': currentWord?.toJsonForProtocol(),
      if (nextWordId != null) 'nextWordId': nextWordId?.toJson(),
      if (nextWord != null) 'nextWord': nextWord?.toJsonForProtocol(),
      if (suggestWord != null) 'suggestWord': suggestWord?.toJsonForProtocol(),
      'wordCategoryList':
          wordCategoryList.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'playerList':
          playerList.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'isShowWordHint': isShowWordHint,
      'isSubmittedUserWord': isSubmittedUserWord,
      'createAt': createAt.toJson(),
      'status': status.toJson(),
    };
  }

  static GameDataInclude include({
    _i4.WordDataInclude? currentWord,
    _i4.WordDataInclude? nextWord,
  }) {
    return GameDataInclude._(
      currentWord: currentWord,
      nextWord: nextWord,
    );
  }

  static GameDataIncludeList includeList({
    _i1.WhereExpressionBuilder<GameDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameDataTable>? orderByList,
    GameDataInclude? include,
  }) {
    return GameDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GameData.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GameData.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GameDataImpl extends GameData {
  _GameDataImpl({
    _i1.UuidValue? id,
    required _i3.UserData owner,
    required String name,
    required String code,
    _i1.UuidValue? spyUserId,
    _i1.UuidValue? currentWordId,
    _i4.WordData? currentWord,
    _i1.UuidValue? nextWordId,
    _i4.WordData? nextWord,
    _i5.SuggestWordData? suggestWord,
    required List<_i6.WordCategoryData> wordCategoryList,
    required List<_i3.UserData> playerList,
    required bool isShowWordHint,
    required bool isSubmittedUserWord,
    DateTime? createAt,
    _i2.GameStatus? status,
  }) : super._(
          id: id,
          owner: owner,
          name: name,
          code: code,
          spyUserId: spyUserId,
          currentWordId: currentWordId,
          currentWord: currentWord,
          nextWordId: nextWordId,
          nextWord: nextWord,
          suggestWord: suggestWord,
          wordCategoryList: wordCategoryList,
          playerList: playerList,
          isShowWordHint: isShowWordHint,
          isSubmittedUserWord: isSubmittedUserWord,
          createAt: createAt,
          status: status,
        );

  /// Returns a shallow copy of this [GameData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GameData copyWith({
    _i1.UuidValue? id,
    _i3.UserData? owner,
    String? name,
    String? code,
    Object? spyUserId = _Undefined,
    Object? currentWordId = _Undefined,
    Object? currentWord = _Undefined,
    Object? nextWordId = _Undefined,
    Object? nextWord = _Undefined,
    Object? suggestWord = _Undefined,
    List<_i6.WordCategoryData>? wordCategoryList,
    List<_i3.UserData>? playerList,
    bool? isShowWordHint,
    bool? isSubmittedUserWord,
    DateTime? createAt,
    _i2.GameStatus? status,
  }) {
    return GameData(
      id: id ?? this.id,
      owner: owner ?? this.owner.copyWith(),
      name: name ?? this.name,
      code: code ?? this.code,
      spyUserId: spyUserId is _i1.UuidValue? ? spyUserId : this.spyUserId,
      currentWordId:
          currentWordId is _i1.UuidValue? ? currentWordId : this.currentWordId,
      currentWord: currentWord is _i4.WordData?
          ? currentWord
          : this.currentWord?.copyWith(),
      nextWordId: nextWordId is _i1.UuidValue? ? nextWordId : this.nextWordId,
      nextWord:
          nextWord is _i4.WordData? ? nextWord : this.nextWord?.copyWith(),
      suggestWord: suggestWord is _i5.SuggestWordData?
          ? suggestWord
          : this.suggestWord?.copyWith(),
      wordCategoryList: wordCategoryList ??
          this.wordCategoryList.map((e0) => e0.copyWith()).toList(),
      playerList:
          playerList ?? this.playerList.map((e0) => e0.copyWith()).toList(),
      isShowWordHint: isShowWordHint ?? this.isShowWordHint,
      isSubmittedUserWord: isSubmittedUserWord ?? this.isSubmittedUserWord,
      createAt: createAt ?? this.createAt,
      status: status ?? this.status,
    );
  }
}

class GameDataTable extends _i1.Table<_i1.UuidValue> {
  GameDataTable({super.tableRelation}) : super(tableName: 'games') {
    owner = _i1.ColumnSerializable(
      'owner',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    code = _i1.ColumnString(
      'code',
      this,
    );
    spyUserId = _i1.ColumnUuid(
      'spyUserId',
      this,
    );
    currentWordId = _i1.ColumnUuid(
      'currentWordId',
      this,
    );
    nextWordId = _i1.ColumnUuid(
      'nextWordId',
      this,
    );
    suggestWord = _i1.ColumnSerializable(
      'suggestWord',
      this,
    );
    wordCategoryList = _i1.ColumnSerializable(
      'wordCategoryList',
      this,
    );
    playerList = _i1.ColumnSerializable(
      'playerList',
      this,
    );
    isShowWordHint = _i1.ColumnBool(
      'isShowWordHint',
      this,
    );
    isSubmittedUserWord = _i1.ColumnBool(
      'isSubmittedUserWord',
      this,
    );
    createAt = _i1.ColumnDateTime(
      'createAt',
      this,
      hasDefault: true,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byIndex,
      hasDefault: true,
    );
  }

  late final _i1.ColumnSerializable owner;

  late final _i1.ColumnString name;

  late final _i1.ColumnString code;

  late final _i1.ColumnUuid spyUserId;

  late final _i1.ColumnUuid currentWordId;

  _i4.WordDataTable? _currentWord;

  late final _i1.ColumnUuid nextWordId;

  _i4.WordDataTable? _nextWord;

  late final _i1.ColumnSerializable suggestWord;

  late final _i1.ColumnSerializable wordCategoryList;

  late final _i1.ColumnSerializable playerList;

  late final _i1.ColumnBool isShowWordHint;

  late final _i1.ColumnBool isSubmittedUserWord;

  late final _i1.ColumnDateTime createAt;

  late final _i1.ColumnEnum<_i2.GameStatus> status;

  _i4.WordDataTable get currentWord {
    if (_currentWord != null) return _currentWord!;
    _currentWord = _i1.createRelationTable(
      relationFieldName: 'currentWord',
      field: GameData.t.currentWordId,
      foreignField: _i4.WordData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.WordDataTable(tableRelation: foreignTableRelation),
    );
    return _currentWord!;
  }

  _i4.WordDataTable get nextWord {
    if (_nextWord != null) return _nextWord!;
    _nextWord = _i1.createRelationTable(
      relationFieldName: 'nextWord',
      field: GameData.t.nextWordId,
      foreignField: _i4.WordData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.WordDataTable(tableRelation: foreignTableRelation),
    );
    return _nextWord!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        owner,
        name,
        code,
        spyUserId,
        currentWordId,
        nextWordId,
        suggestWord,
        wordCategoryList,
        playerList,
        isShowWordHint,
        isSubmittedUserWord,
        createAt,
        status,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'currentWord') {
      return currentWord;
    }
    if (relationField == 'nextWord') {
      return nextWord;
    }
    return null;
  }
}

class GameDataInclude extends _i1.IncludeObject {
  GameDataInclude._({
    _i4.WordDataInclude? currentWord,
    _i4.WordDataInclude? nextWord,
  }) {
    _currentWord = currentWord;
    _nextWord = nextWord;
  }

  _i4.WordDataInclude? _currentWord;

  _i4.WordDataInclude? _nextWord;

  @override
  Map<String, _i1.Include?> get includes => {
        'currentWord': _currentWord,
        'nextWord': _nextWord,
      };

  @override
  _i1.Table<_i1.UuidValue> get table => GameData.t;
}

class GameDataIncludeList extends _i1.IncludeList {
  GameDataIncludeList._({
    _i1.WhereExpressionBuilder<GameDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GameData.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => GameData.t;
}

class GameDataRepository {
  const GameDataRepository._();

  final attachRow = const GameDataAttachRowRepository._();

  final detachRow = const GameDataDetachRowRepository._();

  /// Returns a list of [GameData]s matching the given query parameters.
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
  Future<List<GameData>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameDataTable>? orderByList,
    _i1.Transaction? transaction,
    GameDataInclude? include,
  }) async {
    return session.db.find<GameData>(
      where: where?.call(GameData.t),
      orderBy: orderBy?.call(GameData.t),
      orderByList: orderByList?.call(GameData.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GameData] matching the given query parameters.
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
  Future<GameData?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDataTable>? where,
    int? offset,
    _i1.OrderByBuilder<GameDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameDataTable>? orderByList,
    _i1.Transaction? transaction,
    GameDataInclude? include,
  }) async {
    return session.db.findFirstRow<GameData>(
      where: where?.call(GameData.t),
      orderBy: orderBy?.call(GameData.t),
      orderByList: orderByList?.call(GameData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GameData] by its [id] or null if no such row exists.
  Future<GameData?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    GameDataInclude? include,
  }) async {
    return session.db.findById<GameData>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GameData]s in the list and returns the inserted rows.
  ///
  /// The returned [GameData]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GameData>> insert(
    _i1.Session session,
    List<GameData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GameData>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GameData] and returns the inserted row.
  ///
  /// The returned [GameData] will have its `id` field set.
  Future<GameData> insertRow(
    _i1.Session session,
    GameData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GameData>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GameData]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GameData>> update(
    _i1.Session session,
    List<GameData> rows, {
    _i1.ColumnSelections<GameDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GameData>(
      rows,
      columns: columns?.call(GameData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GameData]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GameData> updateRow(
    _i1.Session session,
    GameData row, {
    _i1.ColumnSelections<GameDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GameData>(
      row,
      columns: columns?.call(GameData.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GameData]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GameData>> delete(
    _i1.Session session,
    List<GameData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GameData>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GameData].
  Future<GameData> deleteRow(
    _i1.Session session,
    GameData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GameData>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GameData>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GameDataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GameData>(
      where: where(GameData.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDataTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GameData>(
      where: where?.call(GameData.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GameDataAttachRowRepository {
  const GameDataAttachRowRepository._();

  /// Creates a relation between the given [GameData] and [WordData]
  /// by setting the [GameData]'s foreign key `currentWordId` to refer to the [WordData].
  Future<void> currentWord(
    _i1.Session session,
    GameData gameData,
    _i4.WordData currentWord, {
    _i1.Transaction? transaction,
  }) async {
    if (gameData.id == null) {
      throw ArgumentError.notNull('gameData.id');
    }
    if (currentWord.id == null) {
      throw ArgumentError.notNull('currentWord.id');
    }

    var $gameData = gameData.copyWith(currentWordId: currentWord.id);
    await session.db.updateRow<GameData>(
      $gameData,
      columns: [GameData.t.currentWordId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [GameData] and [WordData]
  /// by setting the [GameData]'s foreign key `nextWordId` to refer to the [WordData].
  Future<void> nextWord(
    _i1.Session session,
    GameData gameData,
    _i4.WordData nextWord, {
    _i1.Transaction? transaction,
  }) async {
    if (gameData.id == null) {
      throw ArgumentError.notNull('gameData.id');
    }
    if (nextWord.id == null) {
      throw ArgumentError.notNull('nextWord.id');
    }

    var $gameData = gameData.copyWith(nextWordId: nextWord.id);
    await session.db.updateRow<GameData>(
      $gameData,
      columns: [GameData.t.nextWordId],
      transaction: transaction,
    );
  }
}

class GameDataDetachRowRepository {
  const GameDataDetachRowRepository._();

  /// Detaches the relation between this [GameData] and the [WordData] set in `currentWord`
  /// by setting the [GameData]'s foreign key `currentWordId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> currentWord(
    _i1.Session session,
    GameData gamedata, {
    _i1.Transaction? transaction,
  }) async {
    if (gamedata.id == null) {
      throw ArgumentError.notNull('gamedata.id');
    }

    var $gamedata = gamedata.copyWith(currentWordId: null);
    await session.db.updateRow<GameData>(
      $gamedata,
      columns: [GameData.t.currentWordId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [GameData] and the [WordData] set in `nextWord`
  /// by setting the [GameData]'s foreign key `nextWordId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> nextWord(
    _i1.Session session,
    GameData gamedata, {
    _i1.Transaction? transaction,
  }) async {
    if (gamedata.id == null) {
      throw ArgumentError.notNull('gamedata.id');
    }

    var $gamedata = gamedata.copyWith(nextWordId: null);
    await session.db.updateRow<GameData>(
      $gamedata,
      columns: [GameData.t.nextWordId],
      transaction: transaction,
    );
  }
}
