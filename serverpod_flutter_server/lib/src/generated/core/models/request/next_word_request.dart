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

abstract class NextWordRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  NextWordRequest._({
    required this.userId,
    required this.gameId,
  });

  factory NextWordRequest({
    required _i1.UuidValue userId,
    required _i1.UuidValue gameId,
  }) = _NextWordRequestImpl;

  factory NextWordRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return NextWordRequest(
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      gameId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['gameId']),
    );
  }

  _i1.UuidValue userId;

  _i1.UuidValue gameId;

  /// Returns a shallow copy of this [NextWordRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NextWordRequest copyWith({
    _i1.UuidValue? userId,
    _i1.UuidValue? gameId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId.toJson(),
      'gameId': gameId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'userId': userId.toJson(),
      'gameId': gameId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _NextWordRequestImpl extends NextWordRequest {
  _NextWordRequestImpl({
    required _i1.UuidValue userId,
    required _i1.UuidValue gameId,
  }) : super._(
          userId: userId,
          gameId: gameId,
        );

  /// Returns a shallow copy of this [NextWordRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NextWordRequest copyWith({
    _i1.UuidValue? userId,
    _i1.UuidValue? gameId,
  }) {
    return NextWordRequest(
      userId: userId ?? this.userId,
      gameId: gameId ?? this.gameId,
    );
  }
}
