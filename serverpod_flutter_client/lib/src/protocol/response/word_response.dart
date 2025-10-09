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
import '../response/word_category_response.dart' as _i2;

abstract class WordResponse implements _i1.SerializableModel {
  WordResponse._({
    required this.id,
    required this.word,
    this.hint,
    this.wordCategory,
  });

  factory WordResponse({
    required _i1.UuidValue id,
    required String word,
    String? hint,
    _i2.WordCategoryResponse? wordCategory,
  }) = _WordResponseImpl;

  factory WordResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return WordResponse(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      word: jsonSerialization['word'] as String,
      hint: jsonSerialization['hint'] as String?,
      wordCategory: jsonSerialization['wordCategory'] == null
          ? null
          : _i2.WordCategoryResponse.fromJson(
              (jsonSerialization['wordCategory'] as Map<String, dynamic>)),
    );
  }

  _i1.UuidValue id;

  String word;

  String? hint;

  _i2.WordCategoryResponse? wordCategory;

  /// Returns a shallow copy of this [WordResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WordResponse copyWith({
    _i1.UuidValue? id,
    String? word,
    String? hint,
    _i2.WordCategoryResponse? wordCategory,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'word': word,
      if (hint != null) 'hint': hint,
      if (wordCategory != null) 'wordCategory': wordCategory?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WordResponseImpl extends WordResponse {
  _WordResponseImpl({
    required _i1.UuidValue id,
    required String word,
    String? hint,
    _i2.WordCategoryResponse? wordCategory,
  }) : super._(
          id: id,
          word: word,
          hint: hint,
          wordCategory: wordCategory,
        );

  /// Returns a shallow copy of this [WordResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WordResponse copyWith({
    _i1.UuidValue? id,
    String? word,
    Object? hint = _Undefined,
    Object? wordCategory = _Undefined,
  }) {
    return WordResponse(
      id: id ?? this.id,
      word: word ?? this.word,
      hint: hint is String? ? hint : this.hint,
      wordCategory: wordCategory is _i2.WordCategoryResponse?
          ? wordCategory
          : this.wordCategory?.copyWith(),
    );
  }
}
