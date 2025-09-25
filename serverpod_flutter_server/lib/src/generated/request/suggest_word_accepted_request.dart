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

abstract class SuggestWordAcceptedRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SuggestWordAcceptedRequest._({
    required this.wordId,
    required this.gameId,
    required this.userId,
  });

  factory SuggestWordAcceptedRequest({
    required _i1.UuidValue wordId,
    required _i1.UuidValue gameId,
    required _i1.UuidValue userId,
  }) = _SuggestWordAcceptedRequestImpl;

  factory SuggestWordAcceptedRequest.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SuggestWordAcceptedRequest(
      wordId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['wordId']),
      gameId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['gameId']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
    );
  }

  _i1.UuidValue wordId;

  _i1.UuidValue gameId;

  _i1.UuidValue userId;

  /// Returns a shallow copy of this [SuggestWordAcceptedRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SuggestWordAcceptedRequest copyWith({
    _i1.UuidValue? wordId,
    _i1.UuidValue? gameId,
    _i1.UuidValue? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'wordId': wordId.toJson(),
      'gameId': gameId.toJson(),
      'userId': userId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'wordId': wordId.toJson(),
      'gameId': gameId.toJson(),
      'userId': userId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SuggestWordAcceptedRequestImpl extends SuggestWordAcceptedRequest {
  _SuggestWordAcceptedRequestImpl({
    required _i1.UuidValue wordId,
    required _i1.UuidValue gameId,
    required _i1.UuidValue userId,
  }) : super._(
          wordId: wordId,
          gameId: gameId,
          userId: userId,
        );

  /// Returns a shallow copy of this [SuggestWordAcceptedRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SuggestWordAcceptedRequest copyWith({
    _i1.UuidValue? wordId,
    _i1.UuidValue? gameId,
    _i1.UuidValue? userId,
  }) {
    return SuggestWordAcceptedRequest(
      wordId: wordId ?? this.wordId,
      gameId: gameId ?? this.gameId,
      userId: userId ?? this.userId,
    );
  }
}
