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

abstract class WordCategoryResponse implements _i1.SerializableModel {
  WordCategoryResponse._({
    _i1.UuidValue? id,
    required this.name,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory WordCategoryResponse({
    _i1.UuidValue? id,
    required String name,
  }) = _WordCategoryResponseImpl;

  factory WordCategoryResponse.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return WordCategoryResponse(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
    );
  }

  _i1.UuidValue id;

  String name;

  /// Returns a shallow copy of this [WordCategoryResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WordCategoryResponse copyWith({
    _i1.UuidValue? id,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _WordCategoryResponseImpl extends WordCategoryResponse {
  _WordCategoryResponseImpl({
    _i1.UuidValue? id,
    required String name,
  }) : super._(
          id: id,
          name: name,
        );

  /// Returns a shallow copy of this [WordCategoryResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WordCategoryResponse copyWith({
    _i1.UuidValue? id,
    String? name,
  }) {
    return WordCategoryResponse(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
