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

abstract class AddWordRequest implements _i1.SerializableModel {
  AddWordRequest._({
    required this.word,
    this.hint,
    required this.wordCategoryId,
  });

  factory AddWordRequest({
    required String word,
    String? hint,
    required _i1.UuidValue wordCategoryId,
  }) = _AddWordRequestImpl;

  factory AddWordRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return AddWordRequest(
      word: jsonSerialization['word'] as String,
      hint: jsonSerialization['hint'] as String?,
      wordCategoryId: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['wordCategoryId']),
    );
  }

  String word;

  String? hint;

  _i1.UuidValue wordCategoryId;

  /// Returns a shallow copy of this [AddWordRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AddWordRequest copyWith({
    String? word,
    String? hint,
    _i1.UuidValue? wordCategoryId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'word': word,
      if (hint != null) 'hint': hint,
      'wordCategoryId': wordCategoryId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AddWordRequestImpl extends AddWordRequest {
  _AddWordRequestImpl({
    required String word,
    String? hint,
    required _i1.UuidValue wordCategoryId,
  }) : super._(
          word: word,
          hint: hint,
          wordCategoryId: wordCategoryId,
        );

  /// Returns a shallow copy of this [AddWordRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AddWordRequest copyWith({
    String? word,
    Object? hint = _Undefined,
    _i1.UuidValue? wordCategoryId,
  }) {
    return AddWordRequest(
      word: word ?? this.word,
      hint: hint is String? ? hint : this.hint,
      wordCategoryId: wordCategoryId ?? this.wordCategoryId,
    );
  }
}
