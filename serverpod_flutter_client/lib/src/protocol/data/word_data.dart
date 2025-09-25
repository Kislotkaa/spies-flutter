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
import '../data/word_category_data.dart' as _i2;

abstract class WordData implements _i1.SerializableModel {
  WordData._({
    _i1.UuidValue? id,
    required this.word,
    this.hint,
    this.wordCategoryId,
    this.wordCategory,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory WordData({
    _i1.UuidValue? id,
    required String word,
    String? hint,
    _i1.UuidValue? wordCategoryId,
    _i2.WordCategoryData? wordCategory,
  }) = _WordDataImpl;

  factory WordData.fromJson(Map<String, dynamic> jsonSerialization) {
    return WordData(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      word: jsonSerialization['word'] as String,
      hint: jsonSerialization['hint'] as String?,
      wordCategoryId: jsonSerialization['wordCategoryId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['wordCategoryId']),
      wordCategory: jsonSerialization['wordCategory'] == null
          ? null
          : _i2.WordCategoryData.fromJson(
              (jsonSerialization['wordCategory'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  String word;

  String? hint;

  _i1.UuidValue? wordCategoryId;

  _i2.WordCategoryData? wordCategory;

  /// Returns a shallow copy of this [WordData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WordData copyWith({
    _i1.UuidValue? id,
    String? word,
    String? hint,
    _i1.UuidValue? wordCategoryId,
    _i2.WordCategoryData? wordCategory,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'word': word,
      if (hint != null) 'hint': hint,
      if (wordCategoryId != null) 'wordCategoryId': wordCategoryId?.toJson(),
      if (wordCategory != null) 'wordCategory': wordCategory?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WordDataImpl extends WordData {
  _WordDataImpl({
    _i1.UuidValue? id,
    required String word,
    String? hint,
    _i1.UuidValue? wordCategoryId,
    _i2.WordCategoryData? wordCategory,
  }) : super._(
          id: id,
          word: word,
          hint: hint,
          wordCategoryId: wordCategoryId,
          wordCategory: wordCategory,
        );

  /// Returns a shallow copy of this [WordData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WordData copyWith({
    _i1.UuidValue? id,
    String? word,
    Object? hint = _Undefined,
    Object? wordCategoryId = _Undefined,
    Object? wordCategory = _Undefined,
  }) {
    return WordData(
      id: id ?? this.id,
      word: word ?? this.word,
      hint: hint is String? ? hint : this.hint,
      wordCategoryId: wordCategoryId is _i1.UuidValue?
          ? wordCategoryId
          : this.wordCategoryId,
      wordCategory: wordCategory is _i2.WordCategoryData?
          ? wordCategory
          : this.wordCategory?.copyWith(),
    );
  }
}
