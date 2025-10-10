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

abstract class GameUuidEntity implements _i1.SerializableModel {
  GameUuidEntity._({required this.uuid});

  factory GameUuidEntity({required _i1.UuidValue uuid}) = _GameUuidEntityImpl;

  factory GameUuidEntity.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameUuidEntity(
        uuid: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['uuid']));
  }

  _i1.UuidValue uuid;

  /// Returns a shallow copy of this [GameUuidEntity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GameUuidEntity copyWith({_i1.UuidValue? uuid});
  @override
  Map<String, dynamic> toJson() {
    return {'uuid': uuid.toJson()};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GameUuidEntityImpl extends GameUuidEntity {
  _GameUuidEntityImpl({required _i1.UuidValue uuid}) : super._(uuid: uuid);

  /// Returns a shallow copy of this [GameUuidEntity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GameUuidEntity copyWith({_i1.UuidValue? uuid}) {
    return GameUuidEntity(uuid: uuid ?? this.uuid);
  }
}
