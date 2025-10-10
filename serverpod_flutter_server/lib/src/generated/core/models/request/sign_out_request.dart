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

abstract class SignOutRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SignOutRequest._({required this.userId});

  factory SignOutRequest({required _i1.UuidValue userId}) = _SignOutRequestImpl;

  factory SignOutRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return SignOutRequest(
        userId:
            _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']));
  }

  _i1.UuidValue userId;

  /// Returns a shallow copy of this [SignOutRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SignOutRequest copyWith({_i1.UuidValue? userId});
  @override
  Map<String, dynamic> toJson() {
    return {'userId': userId.toJson()};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'userId': userId.toJson()};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SignOutRequestImpl extends SignOutRequest {
  _SignOutRequestImpl({required _i1.UuidValue userId})
      : super._(userId: userId);

  /// Returns a shallow copy of this [SignOutRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SignOutRequest copyWith({_i1.UuidValue? userId}) {
    return SignOutRequest(userId: userId ?? this.userId);
  }
}
