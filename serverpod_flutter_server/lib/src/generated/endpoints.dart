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
import '../../core/features/endpoints/game_endpoint.dart' as _i2;
import '../../core/features/endpoints/user_endpoint.dart' as _i3;
import '../../core/features/endpoints/word_endpoint.dart' as _i4;
import 'package:serverpod_flutter_server/src/generated/core/models/request/create_game_request.dart'
    as _i5;
import 'package:serverpod_flutter_server/src/generated/core/models/request/start_game_request.dart'
    as _i6;
import 'package:serverpod_flutter_server/src/generated/core/models/request/finish_game_request.dart'
    as _i7;
import 'package:serverpod_flutter_server/src/generated/core/models/request/disconnect_game_request.dart'
    as _i8;
import 'package:serverpod_flutter_server/src/generated/core/models/request/connect_game_request.dart'
    as _i9;
import 'package:serverpod_flutter_server/src/generated/core/models/request/change_game_settings_request.dart'
    as _i10;
import 'package:serverpod_flutter_server/src/generated/core/models/request/suggest_word_request.dart'
    as _i11;
import 'package:serverpod_flutter_server/src/generated/core/models/request/suggest_word_accepted_request.dart'
    as _i12;
import 'package:serverpod_flutter_server/src/generated/core/models/request/next_word_request.dart'
    as _i13;
import 'package:uuid/uuid_value.dart' as _i14;
import 'package:serverpod_flutter_server/src/generated/core/models/request/get_user_request.dart'
    as _i15;
import 'package:serverpod_flutter_server/src/generated/core/models/request/sign_in_request.dart'
    as _i16;
import 'package:serverpod_flutter_server/src/generated/core/models/request/change_name_request.dart'
    as _i17;
import 'package:serverpod_flutter_server/src/generated/core/models/request/add_word_request.dart'
    as _i18;
import 'package:serverpod_flutter_server/src/generated/core/models/request/add_category_request.dart'
    as _i19;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'game': _i2.GameEndpoint()
        ..initialize(
          server,
          'game',
          null,
        ),
      'user': _i3.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
      'word': _i4.WordEndpoint()
        ..initialize(
          server,
          'word',
          null,
        ),
    };
    connectors['game'] = _i1.EndpointConnector(
      name: 'game',
      endpoint: endpoints['game']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i5.CreateGameRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i2.GameEndpoint).create(
            session,
            params['model'],
          ),
        ),
        'start': _i1.MethodConnector(
          name: 'start',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i6.StartGameRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i2.GameEndpoint).start(
            session,
            params['model'],
          ),
        ),
        'finish': _i1.MethodConnector(
          name: 'finish',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i7.FinishGameRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i2.GameEndpoint).finish(
            session,
            params['model'],
          ),
        ),
        'disconnect': _i1.MethodConnector(
          name: 'disconnect',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i8.DisconnectGameRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i2.GameEndpoint).disconnect(
            session,
            params['model'],
          ),
        ),
        'connect': _i1.MethodConnector(
          name: 'connect',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i9.ConnectGameRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i2.GameEndpoint).connect(
            session,
            params['model'],
          ),
        ),
        'changeSettings': _i1.MethodConnector(
          name: 'changeSettings',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i10.ChangeGameSettingsRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i2.GameEndpoint).changeSettings(
            session,
            params['model'],
          ),
        ),
        'suggestWord': _i1.MethodConnector(
          name: 'suggestWord',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i11.SuggestWordRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i2.GameEndpoint).suggestWord(
            session,
            params['model'],
          ),
        ),
        'suggestAccepted': _i1.MethodConnector(
          name: 'suggestAccepted',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i12.SuggestWordAcceptedRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i2.GameEndpoint).suggestAccepted(
            session,
            params['model'],
          ),
        ),
        'nextWord': _i1.MethodConnector(
          name: 'nextWord',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i13.NextWordRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i2.GameEndpoint).nextWord(
            session,
            params['model'],
          ),
        ),
        'getInfo': _i1.MethodConnector(
          name: 'getInfo',
          params: {
            'gameId': _i1.ParameterDescription(
              name: 'gameId',
              type: _i1.getType<_i14.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i2.GameEndpoint).getInfo(
            session,
            params['gameId'],
          ),
        ),
        'subscribe': _i1.MethodStreamConnector(
          name: 'subscribe',
          params: {
            'gameId': _i1.ParameterDescription(
              name: 'gameId',
              type: _i1.getType<_i14.UuidValue>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['game'] as _i2.GameEndpoint).subscribe(
            session,
            params['gameId'],
          ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'getUser': _i1.MethodConnector(
          name: 'getUser',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i15.GetUserRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i3.UserEndpoint).getUser(
            session,
            params['model'],
          ),
        ),
        'signIn': _i1.MethodConnector(
          name: 'signIn',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i16.SignInRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i3.UserEndpoint).signIn(
            session,
            params['model'],
          ),
        ),
        'signOut': _i1.MethodConnector(
          name: 'signOut',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i14.UuidValue?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i3.UserEndpoint).signOut(
            session,
            params['userId'],
          ),
        ),
        'changeName': _i1.MethodConnector(
          name: 'changeName',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i17.ChangeNameRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i3.UserEndpoint).changeName(
            session,
            params['model'],
          ),
        ),
      },
    );
    connectors['word'] = _i1.EndpointConnector(
      name: 'word',
      endpoint: endpoints['word']!,
      methodConnectors: {
        'getWords': _i1.MethodConnector(
          name: 'getWords',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['word'] as _i4.WordEndpoint).getWords(session),
        ),
        'addWord': _i1.MethodConnector(
          name: 'addWord',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i18.AddWordRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['word'] as _i4.WordEndpoint).addWord(
            session,
            params['model'],
          ),
        ),
        'getCategories': _i1.MethodConnector(
          name: 'getCategories',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['word'] as _i4.WordEndpoint).getCategories(session),
        ),
        'addCategory': _i1.MethodConnector(
          name: 'addCategory',
          params: {
            'model': _i1.ParameterDescription(
              name: 'model',
              type: _i1.getType<_i19.AddCategoryRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['word'] as _i4.WordEndpoint).addCategory(
            session,
            params['model'],
          ),
        ),
      },
    );
  }
}
