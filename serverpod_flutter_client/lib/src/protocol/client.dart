/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:serverpod_flutter_client/src/protocol/response/game_response.dart'
    as _i3;
import 'package:uuid/uuid_value.dart' as _i4;
import 'package:serverpod_flutter_client/src/protocol/request/create_game_request.dart'
    as _i5;
import 'package:serverpod_flutter_client/src/protocol/request/start_game_request.dart'
    as _i6;
import 'package:serverpod_flutter_client/src/protocol/request/finish_game_request.dart'
    as _i7;
import 'package:serverpod_flutter_client/src/protocol/request/disconnect_game_request.dart'
    as _i8;
import 'package:serverpod_flutter_client/src/protocol/request/connect_game_request.dart'
    as _i9;
import 'package:serverpod_flutter_client/src/protocol/request/change_game_settings_request.dart'
    as _i10;
import 'package:serverpod_flutter_client/src/protocol/request/suggest_word_request.dart'
    as _i11;
import 'package:serverpod_flutter_client/src/protocol/request/suggest_word_accepted_request.dart'
    as _i12;
import 'package:serverpod_flutter_client/src/protocol/request/next_word_request.dart'
    as _i13;
import 'package:serverpod_flutter_client/src/protocol/response/user_response.dart'
    as _i14;
import 'package:serverpod_flutter_client/src/protocol/request/get_user_request.dart'
    as _i15;
import 'package:serverpod_flutter_client/src/protocol/request/sign_in_request.dart'
    as _i16;
import 'package:serverpod_flutter_client/src/protocol/request/change_name_request.dart'
    as _i17;
import 'package:serverpod_flutter_client/src/protocol/response/word_response.dart'
    as _i18;
import 'package:serverpod_flutter_client/src/protocol/request/add_word_request.dart'
    as _i19;
import 'package:serverpod_flutter_client/src/protocol/response/word_category_response.dart'
    as _i20;
import 'package:serverpod_flutter_client/src/protocol/request/add_category_request.dart'
    as _i21;
import 'protocol.dart' as _i22;

/// {@category Endpoint}
class EndpointGame extends _i1.EndpointRef {
  EndpointGame(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'game';

  _i2.Stream<_i3.GameResponse> subscribe(_i4.UuidValue gameId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i3.GameResponse>,
          _i3.GameResponse>(
        'game',
        'subscribe',
        {'gameId': gameId},
        {},
      );

  _i2.Future<_i3.GameResponse> create(_i5.CreateGameRequest model) =>
      caller.callServerEndpoint<_i3.GameResponse>(
        'game',
        'create',
        {'model': model},
      );

  _i2.Future<void> start(_i6.StartGameRequest model) =>
      caller.callServerEndpoint<void>(
        'game',
        'start',
        {'model': model},
      );

  _i2.Future<void> finish(_i7.FinishGameRequest model) =>
      caller.callServerEndpoint<void>(
        'game',
        'finish',
        {'model': model},
      );

  _i2.Future<void> disconnect(_i8.DisconnectGameRequest model) =>
      caller.callServerEndpoint<void>(
        'game',
        'disconnect',
        {'model': model},
      );

  _i2.Future<_i3.GameResponse> connect(_i9.ConnectGameRequest model) =>
      caller.callServerEndpoint<_i3.GameResponse>(
        'game',
        'connect',
        {'model': model},
      );

  _i2.Future<_i3.GameResponse> changeSettings(
          _i10.ChangeGameSettingsRequest model) =>
      caller.callServerEndpoint<_i3.GameResponse>(
        'game',
        'changeSettings',
        {'model': model},
      );

  _i2.Future<void> suggestWord(_i11.SuggestWordRequest model) =>
      caller.callServerEndpoint<void>(
        'game',
        'suggestWord',
        {'model': model},
      );

  _i2.Future<void> suggestAccepted(_i12.SuggestWordAcceptedRequest model) =>
      caller.callServerEndpoint<void>(
        'game',
        'suggestAccepted',
        {'model': model},
      );

  _i2.Future<void> nextWord(_i13.NextWordRequest model) =>
      caller.callServerEndpoint<void>(
        'game',
        'nextWord',
        {'model': model},
      );

  _i2.Future<_i3.GameResponse?> getInfo(_i4.UuidValue gameId) =>
      caller.callServerEndpoint<_i3.GameResponse?>(
        'game',
        'getInfo',
        {'gameId': gameId},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i14.UserResponse?> getUser(_i15.GetUserRequest model) =>
      caller.callServerEndpoint<_i14.UserResponse?>(
        'user',
        'getUser',
        {'model': model},
      );

  _i2.Future<_i14.UserResponse> signIn(_i16.SignInRequest model) =>
      caller.callServerEndpoint<_i14.UserResponse>(
        'user',
        'signIn',
        {'model': model},
      );

  _i2.Future<void> signOut(_i4.UuidValue? userId) =>
      caller.callServerEndpoint<void>(
        'user',
        'signOut',
        {'userId': userId},
      );

  _i2.Future<void> changeName(_i17.ChangeNameRequest model) =>
      caller.callServerEndpoint<void>(
        'user',
        'changeName',
        {'model': model},
      );
}

/// {@category Endpoint}
class EndpointWord extends _i1.EndpointRef {
  EndpointWord(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'word';

  _i2.Future<List<_i18.WordResponse>> getWords() =>
      caller.callServerEndpoint<List<_i18.WordResponse>>(
        'word',
        'getWords',
        {},
      );

  _i2.Future<_i18.WordResponse> addWord(_i19.AddWordRequest model) =>
      caller.callServerEndpoint<_i18.WordResponse>(
        'word',
        'addWord',
        {'model': model},
      );

  _i2.Future<List<_i20.WordCategoryResponse>> getCategories() =>
      caller.callServerEndpoint<List<_i20.WordCategoryResponse>>(
        'word',
        'getCategories',
        {},
      );

  _i2.Future<_i20.WordCategoryResponse> addCategory(
          _i21.AddCategoryRequest model) =>
      caller.callServerEndpoint<_i20.WordCategoryResponse>(
        'word',
        'addCategory',
        {'model': model},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i22.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    game = EndpointGame(this);
    user = EndpointUser(this);
    word = EndpointWord(this);
  }

  late final EndpointGame game;

  late final EndpointUser user;

  late final EndpointWord word;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'game': game,
        'user': user,
        'word': word,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
