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

abstract class ConnectGameRequest implements _i1.SerializableModel {
  ConnectGameRequest._({
    required this.code,
    required this.playerId,
  });

  factory ConnectGameRequest({
    required String code,
    required _i1.UuidValue playerId,
  }) = _ConnectGameRequestImpl;

  factory ConnectGameRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return ConnectGameRequest(
      code: jsonSerialization['code'] as String,
      playerId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['playerId']),
    );
  }

  String code;

  _i1.UuidValue playerId;

  /// Returns a shallow copy of this [ConnectGameRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ConnectGameRequest copyWith({
    String? code,
    _i1.UuidValue? playerId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'playerId': playerId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ConnectGameRequestImpl extends ConnectGameRequest {
  _ConnectGameRequestImpl({
    required String code,
    required _i1.UuidValue playerId,
  }) : super._(
          code: code,
          playerId: playerId,
        );

  /// Returns a shallow copy of this [ConnectGameRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ConnectGameRequest copyWith({
    String? code,
    _i1.UuidValue? playerId,
  }) {
    return ConnectGameRequest(
      code: code ?? this.code,
      playerId: playerId ?? this.playerId,
    );
  }
}
