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

abstract class GetUserRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GetUserRequest._({required this.deviceId});

  factory GetUserRequest({required String deviceId}) = _GetUserRequestImpl;

  factory GetUserRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return GetUserRequest(deviceId: jsonSerialization['deviceId'] as String);
  }

  String deviceId;

  /// Returns a shallow copy of this [GetUserRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GetUserRequest copyWith({String? deviceId});
  @override
  Map<String, dynamic> toJson() {
    return {'deviceId': deviceId};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'deviceId': deviceId};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GetUserRequestImpl extends GetUserRequest {
  _GetUserRequestImpl({required String deviceId}) : super._(deviceId: deviceId);

  /// Returns a shallow copy of this [GetUserRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GetUserRequest copyWith({String? deviceId}) {
    return GetUserRequest(deviceId: deviceId ?? this.deviceId);
  }
}
