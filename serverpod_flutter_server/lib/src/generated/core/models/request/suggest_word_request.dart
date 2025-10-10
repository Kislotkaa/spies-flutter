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

abstract class SuggestWordRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SuggestWordRequest._({
    required this.userId,
    required this.gameId,
    required this.word,
  });

  factory SuggestWordRequest({
    required _i1.UuidValue userId,
    required _i1.UuidValue gameId,
    required String word,
  }) = _SuggestWordRequestImpl;

  factory SuggestWordRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return SuggestWordRequest(
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      gameId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['gameId']),
      word: jsonSerialization['word'] as String,
    );
  }

  _i1.UuidValue userId;

  _i1.UuidValue gameId;

  String word;

  /// Returns a shallow copy of this [SuggestWordRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SuggestWordRequest copyWith({
    _i1.UuidValue? userId,
    _i1.UuidValue? gameId,
    String? word,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId.toJson(),
      'gameId': gameId.toJson(),
      'word': word,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'userId': userId.toJson(),
      'gameId': gameId.toJson(),
      'word': word,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SuggestWordRequestImpl extends SuggestWordRequest {
  _SuggestWordRequestImpl({
    required _i1.UuidValue userId,
    required _i1.UuidValue gameId,
    required String word,
  }) : super._(
          userId: userId,
          gameId: gameId,
          word: word,
        );

  /// Returns a shallow copy of this [SuggestWordRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SuggestWordRequest copyWith({
    _i1.UuidValue? userId,
    _i1.UuidValue? gameId,
    String? word,
  }) {
    return SuggestWordRequest(
      userId: userId ?? this.userId,
      gameId: gameId ?? this.gameId,
      word: word ?? this.word,
    );
  }
}
