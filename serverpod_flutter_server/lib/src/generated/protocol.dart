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
import 'package:serverpod/protocol.dart' as _i2;
import 'data/game_data.dart' as _i3;
import 'data/user_data.dart' as _i4;
import 'data/word_category_data.dart' as _i5;
import 'data/word_data.dart' as _i6;
import 'entity/game_uuid_entity.dart' as _i7;
import 'enums/game_status.dart' as _i8;
import 'exception_response.dart' as _i9;
import 'request/add_category_request.dart' as _i10;
import 'request/add_word_request.dart' as _i11;
import 'request/change_game_settings_request.dart' as _i12;
import 'request/change_name_request.dart' as _i13;
import 'request/connect_game_request.dart' as _i14;
import 'request/create_game_request.dart' as _i15;
import 'request/disconnect_game_request.dart' as _i16;
import 'request/finish_game_request.dart' as _i17;
import 'request/get_user_request.dart' as _i18;
import 'request/next_word_request.dart' as _i19;
import 'request/sign_in_request.dart' as _i20;
import 'request/sign_out_request.dart' as _i21;
import 'request/start_game_request.dart' as _i22;
import 'request/suggest_word_accepted_request.dart' as _i23;
import 'request/suggest_word_request.dart' as _i24;
import 'response/game_response.dart' as _i25;
import 'response/user_response.dart' as _i26;
import 'response/word_category_response.dart' as _i27;
import 'response/word_response.dart' as _i28;
import 'package:serverpod_flutter_server/src/generated/response/word_response.dart'
    as _i29;
import 'package:serverpod_flutter_server/src/generated/response/word_category_response.dart'
    as _i30;
export 'data/game_data.dart';
export 'data/user_data.dart';
export 'data/word_category_data.dart';
export 'data/word_data.dart';
export 'entity/game_uuid_entity.dart';
export 'enums/game_status.dart';
export 'exception_response.dart';
export 'request/add_category_request.dart';
export 'request/add_word_request.dart';
export 'request/change_game_settings_request.dart';
export 'request/change_name_request.dart';
export 'request/connect_game_request.dart';
export 'request/create_game_request.dart';
export 'request/disconnect_game_request.dart';
export 'request/finish_game_request.dart';
export 'request/get_user_request.dart';
export 'request/next_word_request.dart';
export 'request/sign_in_request.dart';
export 'request/sign_out_request.dart';
export 'request/start_game_request.dart';
export 'request/suggest_word_accepted_request.dart';
export 'request/suggest_word_request.dart';
export 'response/game_response.dart';
export 'response/user_response.dart';
export 'response/word_category_response.dart';
export 'response/word_response.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'games',
      dartName: 'GameData',
      schema: 'public',
      module: 'serverpod_flutter',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'owner',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:UserData',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'code',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'currentWordId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'nextWordId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'suggestWordId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'wordCategoryList',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:WordCategoryData>',
        ),
        _i2.ColumnDefinition(
          name: 'playerList',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:UserData>',
        ),
        _i2.ColumnDefinition(
          name: 'isShowWordHint',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'isSubmittedUserWord',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:GameStatus',
          columnDefault: '0',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'games_fk_0',
          columns: ['currentWordId'],
          referenceTable: 'words',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'games_fk_1',
          columns: ['nextWordId'],
          referenceTable: 'words',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'games_fk_2',
          columns: ['suggestWordId'],
          referenceTable: 'words',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'games_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'users',
      dartName: 'UserData',
      schema: 'public',
      module: 'serverpod_flutter',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'deviceId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'updateAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'users_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'word_categories',
      dartName: 'WordCategoryData',
      schema: 'public',
      module: 'serverpod_flutter',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'word_categories_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'words',
      dartName: 'WordData',
      schema: 'public',
      module: 'serverpod_flutter',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'word',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'hint',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'wordCategoryId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'words_fk_0',
          columns: ['wordCategoryId'],
          referenceTable: 'word_categories',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'words_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.GameData) {
      return _i3.GameData.fromJson(data) as T;
    }
    if (t == _i4.UserData) {
      return _i4.UserData.fromJson(data) as T;
    }
    if (t == _i5.WordCategoryData) {
      return _i5.WordCategoryData.fromJson(data) as T;
    }
    if (t == _i6.WordData) {
      return _i6.WordData.fromJson(data) as T;
    }
    if (t == _i7.GameUuidEntity) {
      return _i7.GameUuidEntity.fromJson(data) as T;
    }
    if (t == _i8.GameStatus) {
      return _i8.GameStatus.fromJson(data) as T;
    }
    if (t == _i9.ExceptionResponse) {
      return _i9.ExceptionResponse.fromJson(data) as T;
    }
    if (t == _i10.AddCategoryRequest) {
      return _i10.AddCategoryRequest.fromJson(data) as T;
    }
    if (t == _i11.AddWordRequest) {
      return _i11.AddWordRequest.fromJson(data) as T;
    }
    if (t == _i12.ChangeGameSettingsRequest) {
      return _i12.ChangeGameSettingsRequest.fromJson(data) as T;
    }
    if (t == _i13.ChangeNameRequest) {
      return _i13.ChangeNameRequest.fromJson(data) as T;
    }
    if (t == _i14.ConnectGameRequest) {
      return _i14.ConnectGameRequest.fromJson(data) as T;
    }
    if (t == _i15.CreateGameRequest) {
      return _i15.CreateGameRequest.fromJson(data) as T;
    }
    if (t == _i16.DisconnectGameRequest) {
      return _i16.DisconnectGameRequest.fromJson(data) as T;
    }
    if (t == _i17.FinishGameRequest) {
      return _i17.FinishGameRequest.fromJson(data) as T;
    }
    if (t == _i18.GetUserRequest) {
      return _i18.GetUserRequest.fromJson(data) as T;
    }
    if (t == _i19.NextWordRequest) {
      return _i19.NextWordRequest.fromJson(data) as T;
    }
    if (t == _i20.SignInRequest) {
      return _i20.SignInRequest.fromJson(data) as T;
    }
    if (t == _i21.SignOutRequest) {
      return _i21.SignOutRequest.fromJson(data) as T;
    }
    if (t == _i22.StartGameRequest) {
      return _i22.StartGameRequest.fromJson(data) as T;
    }
    if (t == _i23.SuggestWordAcceptedRequest) {
      return _i23.SuggestWordAcceptedRequest.fromJson(data) as T;
    }
    if (t == _i24.SuggestWordRequest) {
      return _i24.SuggestWordRequest.fromJson(data) as T;
    }
    if (t == _i25.GameResponse) {
      return _i25.GameResponse.fromJson(data) as T;
    }
    if (t == _i26.UserResponse) {
      return _i26.UserResponse.fromJson(data) as T;
    }
    if (t == _i27.WordCategoryResponse) {
      return _i27.WordCategoryResponse.fromJson(data) as T;
    }
    if (t == _i28.WordResponse) {
      return _i28.WordResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.GameData?>()) {
      return (data != null ? _i3.GameData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.UserData?>()) {
      return (data != null ? _i4.UserData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.WordCategoryData?>()) {
      return (data != null ? _i5.WordCategoryData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.WordData?>()) {
      return (data != null ? _i6.WordData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.GameUuidEntity?>()) {
      return (data != null ? _i7.GameUuidEntity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.GameStatus?>()) {
      return (data != null ? _i8.GameStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ExceptionResponse?>()) {
      return (data != null ? _i9.ExceptionResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.AddCategoryRequest?>()) {
      return (data != null ? _i10.AddCategoryRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.AddWordRequest?>()) {
      return (data != null ? _i11.AddWordRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ChangeGameSettingsRequest?>()) {
      return (data != null
          ? _i12.ChangeGameSettingsRequest.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i13.ChangeNameRequest?>()) {
      return (data != null ? _i13.ChangeNameRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ConnectGameRequest?>()) {
      return (data != null ? _i14.ConnectGameRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.CreateGameRequest?>()) {
      return (data != null ? _i15.CreateGameRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.DisconnectGameRequest?>()) {
      return (data != null ? _i16.DisconnectGameRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.FinishGameRequest?>()) {
      return (data != null ? _i17.FinishGameRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.GetUserRequest?>()) {
      return (data != null ? _i18.GetUserRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.NextWordRequest?>()) {
      return (data != null ? _i19.NextWordRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.SignInRequest?>()) {
      return (data != null ? _i20.SignInRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.SignOutRequest?>()) {
      return (data != null ? _i21.SignOutRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.StartGameRequest?>()) {
      return (data != null ? _i22.StartGameRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.SuggestWordAcceptedRequest?>()) {
      return (data != null
          ? _i23.SuggestWordAcceptedRequest.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i24.SuggestWordRequest?>()) {
      return (data != null ? _i24.SuggestWordRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.GameResponse?>()) {
      return (data != null ? _i25.GameResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.UserResponse?>()) {
      return (data != null ? _i26.UserResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.WordCategoryResponse?>()) {
      return (data != null ? _i27.WordCategoryResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i28.WordResponse?>()) {
      return (data != null ? _i28.WordResponse.fromJson(data) : null) as T;
    }
    if (t == List<_i5.WordCategoryData>) {
      return (data as List)
          .map((e) => deserialize<_i5.WordCategoryData>(e))
          .toList() as T;
    }
    if (t == List<_i4.UserData>) {
      return (data as List).map((e) => deserialize<_i4.UserData>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i1.UuidValue>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i1.UuidValue>(e)).toList()
          : null) as T;
    }
    if (t == List<_i1.UuidValue>) {
      return (data as List).map((e) => deserialize<_i1.UuidValue>(e)).toList()
          as T;
    }
    if (t == List<_i27.WordCategoryResponse>) {
      return (data as List)
          .map((e) => deserialize<_i27.WordCategoryResponse>(e))
          .toList() as T;
    }
    if (t == List<_i26.UserResponse>) {
      return (data as List)
          .map((e) => deserialize<_i26.UserResponse>(e))
          .toList() as T;
    }
    if (t == List<_i29.WordResponse>) {
      return (data as List)
          .map((e) => deserialize<_i29.WordResponse>(e))
          .toList() as T;
    }
    if (t == List<_i30.WordCategoryResponse>) {
      return (data as List)
          .map((e) => deserialize<_i30.WordCategoryResponse>(e))
          .toList() as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i3.GameData) {
      return 'GameData';
    }
    if (data is _i4.UserData) {
      return 'UserData';
    }
    if (data is _i5.WordCategoryData) {
      return 'WordCategoryData';
    }
    if (data is _i6.WordData) {
      return 'WordData';
    }
    if (data is _i7.GameUuidEntity) {
      return 'GameUuidEntity';
    }
    if (data is _i8.GameStatus) {
      return 'GameStatus';
    }
    if (data is _i9.ExceptionResponse) {
      return 'ExceptionResponse';
    }
    if (data is _i10.AddCategoryRequest) {
      return 'AddCategoryRequest';
    }
    if (data is _i11.AddWordRequest) {
      return 'AddWordRequest';
    }
    if (data is _i12.ChangeGameSettingsRequest) {
      return 'ChangeGameSettingsRequest';
    }
    if (data is _i13.ChangeNameRequest) {
      return 'ChangeNameRequest';
    }
    if (data is _i14.ConnectGameRequest) {
      return 'ConnectGameRequest';
    }
    if (data is _i15.CreateGameRequest) {
      return 'CreateGameRequest';
    }
    if (data is _i16.DisconnectGameRequest) {
      return 'DisconnectGameRequest';
    }
    if (data is _i17.FinishGameRequest) {
      return 'FinishGameRequest';
    }
    if (data is _i18.GetUserRequest) {
      return 'GetUserRequest';
    }
    if (data is _i19.NextWordRequest) {
      return 'NextWordRequest';
    }
    if (data is _i20.SignInRequest) {
      return 'SignInRequest';
    }
    if (data is _i21.SignOutRequest) {
      return 'SignOutRequest';
    }
    if (data is _i22.StartGameRequest) {
      return 'StartGameRequest';
    }
    if (data is _i23.SuggestWordAcceptedRequest) {
      return 'SuggestWordAcceptedRequest';
    }
    if (data is _i24.SuggestWordRequest) {
      return 'SuggestWordRequest';
    }
    if (data is _i25.GameResponse) {
      return 'GameResponse';
    }
    if (data is _i26.UserResponse) {
      return 'UserResponse';
    }
    if (data is _i27.WordCategoryResponse) {
      return 'WordCategoryResponse';
    }
    if (data is _i28.WordResponse) {
      return 'WordResponse';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'GameData') {
      return deserialize<_i3.GameData>(data['data']);
    }
    if (dataClassName == 'UserData') {
      return deserialize<_i4.UserData>(data['data']);
    }
    if (dataClassName == 'WordCategoryData') {
      return deserialize<_i5.WordCategoryData>(data['data']);
    }
    if (dataClassName == 'WordData') {
      return deserialize<_i6.WordData>(data['data']);
    }
    if (dataClassName == 'GameUuidEntity') {
      return deserialize<_i7.GameUuidEntity>(data['data']);
    }
    if (dataClassName == 'GameStatus') {
      return deserialize<_i8.GameStatus>(data['data']);
    }
    if (dataClassName == 'ExceptionResponse') {
      return deserialize<_i9.ExceptionResponse>(data['data']);
    }
    if (dataClassName == 'AddCategoryRequest') {
      return deserialize<_i10.AddCategoryRequest>(data['data']);
    }
    if (dataClassName == 'AddWordRequest') {
      return deserialize<_i11.AddWordRequest>(data['data']);
    }
    if (dataClassName == 'ChangeGameSettingsRequest') {
      return deserialize<_i12.ChangeGameSettingsRequest>(data['data']);
    }
    if (dataClassName == 'ChangeNameRequest') {
      return deserialize<_i13.ChangeNameRequest>(data['data']);
    }
    if (dataClassName == 'ConnectGameRequest') {
      return deserialize<_i14.ConnectGameRequest>(data['data']);
    }
    if (dataClassName == 'CreateGameRequest') {
      return deserialize<_i15.CreateGameRequest>(data['data']);
    }
    if (dataClassName == 'DisconnectGameRequest') {
      return deserialize<_i16.DisconnectGameRequest>(data['data']);
    }
    if (dataClassName == 'FinishGameRequest') {
      return deserialize<_i17.FinishGameRequest>(data['data']);
    }
    if (dataClassName == 'GetUserRequest') {
      return deserialize<_i18.GetUserRequest>(data['data']);
    }
    if (dataClassName == 'NextWordRequest') {
      return deserialize<_i19.NextWordRequest>(data['data']);
    }
    if (dataClassName == 'SignInRequest') {
      return deserialize<_i20.SignInRequest>(data['data']);
    }
    if (dataClassName == 'SignOutRequest') {
      return deserialize<_i21.SignOutRequest>(data['data']);
    }
    if (dataClassName == 'StartGameRequest') {
      return deserialize<_i22.StartGameRequest>(data['data']);
    }
    if (dataClassName == 'SuggestWordAcceptedRequest') {
      return deserialize<_i23.SuggestWordAcceptedRequest>(data['data']);
    }
    if (dataClassName == 'SuggestWordRequest') {
      return deserialize<_i24.SuggestWordRequest>(data['data']);
    }
    if (dataClassName == 'GameResponse') {
      return deserialize<_i25.GameResponse>(data['data']);
    }
    if (dataClassName == 'UserResponse') {
      return deserialize<_i26.UserResponse>(data['data']);
    }
    if (dataClassName == 'WordCategoryResponse') {
      return deserialize<_i27.WordCategoryResponse>(data['data']);
    }
    if (dataClassName == 'WordResponse') {
      return deserialize<_i28.WordResponse>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.GameData:
        return _i3.GameData.t;
      case _i4.UserData:
        return _i4.UserData.t;
      case _i5.WordCategoryData:
        return _i5.WordCategoryData.t;
      case _i6.WordData:
        return _i6.WordData.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'serverpod_flutter';
}
