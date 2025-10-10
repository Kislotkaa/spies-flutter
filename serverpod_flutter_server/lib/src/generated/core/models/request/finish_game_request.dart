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

abstract class FinishGameRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  FinishGameRequest._({
    required this.gameId,
    required this.userId,
  });

  factory FinishGameRequest({
    required _i1.UuidValue gameId,
    required _i1.UuidValue userId,
  }) = _FinishGameRequestImpl;

  factory FinishGameRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return FinishGameRequest(
      gameId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['gameId']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
    );
  }

  _i1.UuidValue gameId;

  _i1.UuidValue userId;

  /// Returns a shallow copy of this [FinishGameRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FinishGameRequest copyWith({
    _i1.UuidValue? gameId,
    _i1.UuidValue? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId.toJson(),
      'userId': userId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'gameId': gameId.toJson(),
      'userId': userId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _FinishGameRequestImpl extends FinishGameRequest {
  _FinishGameRequestImpl({
    required _i1.UuidValue gameId,
    required _i1.UuidValue userId,
  }) : super._(
          gameId: gameId,
          userId: userId,
        );

  /// Returns a shallow copy of this [FinishGameRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FinishGameRequest copyWith({
    _i1.UuidValue? gameId,
    _i1.UuidValue? userId,
  }) {
    return FinishGameRequest(
      gameId: gameId ?? this.gameId,
      userId: userId ?? this.userId,
    );
  }
}
