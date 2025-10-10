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

abstract class DisconnectGameRequest implements _i1.SerializableModel {
  DisconnectGameRequest._({
    required this.gameId,
    required this.playerId,
  });

  factory DisconnectGameRequest({
    required _i1.UuidValue gameId,
    required _i1.UuidValue playerId,
  }) = _DisconnectGameRequestImpl;

  factory DisconnectGameRequest.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DisconnectGameRequest(
      gameId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['gameId']),
      playerId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['playerId']),
    );
  }

  _i1.UuidValue gameId;

  _i1.UuidValue playerId;

  /// Returns a shallow copy of this [DisconnectGameRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DisconnectGameRequest copyWith({
    _i1.UuidValue? gameId,
    _i1.UuidValue? playerId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId.toJson(),
      'playerId': playerId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DisconnectGameRequestImpl extends DisconnectGameRequest {
  _DisconnectGameRequestImpl({
    required _i1.UuidValue gameId,
    required _i1.UuidValue playerId,
  }) : super._(
          gameId: gameId,
          playerId: playerId,
        );

  /// Returns a shallow copy of this [DisconnectGameRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DisconnectGameRequest copyWith({
    _i1.UuidValue? gameId,
    _i1.UuidValue? playerId,
  }) {
    return DisconnectGameRequest(
      gameId: gameId ?? this.gameId,
      playerId: playerId ?? this.playerId,
    );
  }
}
