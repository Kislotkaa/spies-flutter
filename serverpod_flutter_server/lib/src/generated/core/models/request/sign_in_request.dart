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

abstract class SignInRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SignInRequest._({
    required this.deviceId,
    required this.name,
  });

  factory SignInRequest({
    required String deviceId,
    required String name,
  }) = _SignInRequestImpl;

  factory SignInRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return SignInRequest(
      deviceId: jsonSerialization['deviceId'] as String,
      name: jsonSerialization['name'] as String,
    );
  }

  String deviceId;

  String name;

  /// Returns a shallow copy of this [SignInRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SignInRequest copyWith({
    String? deviceId,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'deviceId': deviceId,
      'name': name,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SignInRequestImpl extends SignInRequest {
  _SignInRequestImpl({
    required String deviceId,
    required String name,
  }) : super._(
          deviceId: deviceId,
          name: name,
        );

  /// Returns a shallow copy of this [SignInRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SignInRequest copyWith({
    String? deviceId,
    String? name,
  }) {
    return SignInRequest(
      deviceId: deviceId ?? this.deviceId,
      name: name ?? this.name,
    );
  }
}
