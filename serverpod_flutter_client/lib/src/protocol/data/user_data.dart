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

abstract class UserData implements _i1.SerializableModel {
  UserData._({
    _i1.UuidValue? id,
    required this.deviceId,
    required this.name,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory UserData({
    _i1.UuidValue? id,
    required String deviceId,
    required String name,
  }) = _UserDataImpl;

  factory UserData.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserData(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      deviceId: jsonSerialization['deviceId'] as String,
      name: jsonSerialization['name'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  String deviceId;

  String name;

  /// Returns a shallow copy of this [UserData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserData copyWith({
    _i1.UuidValue? id,
    String? deviceId,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'deviceId': deviceId,
      'name': name,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UserDataImpl extends UserData {
  _UserDataImpl({
    _i1.UuidValue? id,
    required String deviceId,
    required String name,
  }) : super._(
          id: id,
          deviceId: deviceId,
          name: name,
        );

  /// Returns a shallow copy of this [UserData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserData copyWith({
    _i1.UuidValue? id,
    String? deviceId,
    String? name,
  }) {
    return UserData(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      name: name ?? this.name,
    );
  }
}
