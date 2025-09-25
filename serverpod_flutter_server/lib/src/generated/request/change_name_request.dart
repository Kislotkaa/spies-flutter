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

abstract class ChangeNameRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ChangeNameRequest._({
    required this.userId,
    required this.deviceId,
    required this.newName,
  });

  factory ChangeNameRequest({
    required _i1.UuidValue userId,
    required String deviceId,
    required String newName,
  }) = _ChangeNameRequestImpl;

  factory ChangeNameRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChangeNameRequest(
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      deviceId: jsonSerialization['deviceId'] as String,
      newName: jsonSerialization['newName'] as String,
    );
  }

  _i1.UuidValue userId;

  String deviceId;

  String newName;

  /// Returns a shallow copy of this [ChangeNameRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChangeNameRequest copyWith({
    _i1.UuidValue? userId,
    String? deviceId,
    String? newName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId.toJson(),
      'deviceId': deviceId,
      'newName': newName,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'userId': userId.toJson(),
      'deviceId': deviceId,
      'newName': newName,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ChangeNameRequestImpl extends ChangeNameRequest {
  _ChangeNameRequestImpl({
    required _i1.UuidValue userId,
    required String deviceId,
    required String newName,
  }) : super._(
          userId: userId,
          deviceId: deviceId,
          newName: newName,
        );

  /// Returns a shallow copy of this [ChangeNameRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChangeNameRequest copyWith({
    _i1.UuidValue? userId,
    String? deviceId,
    String? newName,
  }) {
    return ChangeNameRequest(
      userId: userId ?? this.userId,
      deviceId: deviceId ?? this.deviceId,
      newName: newName ?? this.newName,
    );
  }
}
