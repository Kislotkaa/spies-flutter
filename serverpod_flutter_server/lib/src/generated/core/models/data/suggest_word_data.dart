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
import '../../../core/models/data/word_data.dart' as _i2;

abstract class SuggestWordData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SuggestWordData._({
    required this.userId,
    required this.word,
  });

  factory SuggestWordData({
    required _i1.UuidValue userId,
    required _i2.WordData word,
  }) = _SuggestWordDataImpl;

  factory SuggestWordData.fromJson(Map<String, dynamic> jsonSerialization) {
    return SuggestWordData(
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      word: _i2.WordData.fromJson(
          (jsonSerialization['word'] as Map<String, dynamic>)),
    );
  }

  _i1.UuidValue userId;

  _i2.WordData word;

  /// Returns a shallow copy of this [SuggestWordData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SuggestWordData copyWith({
    _i1.UuidValue? userId,
    _i2.WordData? word,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId.toJson(),
      'word': word.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'userId': userId.toJson(),
      'word': word.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SuggestWordDataImpl extends SuggestWordData {
  _SuggestWordDataImpl({
    required _i1.UuidValue userId,
    required _i2.WordData word,
  }) : super._(
          userId: userId,
          word: word,
        );

  /// Returns a shallow copy of this [SuggestWordData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SuggestWordData copyWith({
    _i1.UuidValue? userId,
    _i2.WordData? word,
  }) {
    return SuggestWordData(
      userId: userId ?? this.userId,
      word: word ?? this.word.copyWith(),
    );
  }
}
