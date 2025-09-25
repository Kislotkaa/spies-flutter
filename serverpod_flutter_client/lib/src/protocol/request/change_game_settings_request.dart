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

abstract class ChangeGameSettingsRequest implements _i1.SerializableModel {
  ChangeGameSettingsRequest._({
    required this.gameId,
    required this.userId,
    this.wordCategoryIds,
    this.isShowWordHint,
    this.isSubmittedUserWord,
  });

  factory ChangeGameSettingsRequest({
    required _i1.UuidValue gameId,
    required _i1.UuidValue userId,
    List<_i1.UuidValue>? wordCategoryIds,
    bool? isShowWordHint,
    bool? isSubmittedUserWord,
  }) = _ChangeGameSettingsRequestImpl;

  factory ChangeGameSettingsRequest.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ChangeGameSettingsRequest(
      gameId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['gameId']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      wordCategoryIds: (jsonSerialization['wordCategoryIds'] as List?)
          ?.map((e) => _i1.UuidValueJsonExtension.fromJson(e))
          .toList(),
      isShowWordHint: jsonSerialization['isShowWordHint'] as bool?,
      isSubmittedUserWord: jsonSerialization['isSubmittedUserWord'] as bool?,
    );
  }

  _i1.UuidValue gameId;

  _i1.UuidValue userId;

  List<_i1.UuidValue>? wordCategoryIds;

  bool? isShowWordHint;

  bool? isSubmittedUserWord;

  /// Returns a shallow copy of this [ChangeGameSettingsRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChangeGameSettingsRequest copyWith({
    _i1.UuidValue? gameId,
    _i1.UuidValue? userId,
    List<_i1.UuidValue>? wordCategoryIds,
    bool? isShowWordHint,
    bool? isSubmittedUserWord,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId.toJson(),
      'userId': userId.toJson(),
      if (wordCategoryIds != null)
        'wordCategoryIds':
            wordCategoryIds?.toJson(valueToJson: (v) => v.toJson()),
      if (isShowWordHint != null) 'isShowWordHint': isShowWordHint,
      if (isSubmittedUserWord != null)
        'isSubmittedUserWord': isSubmittedUserWord,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChangeGameSettingsRequestImpl extends ChangeGameSettingsRequest {
  _ChangeGameSettingsRequestImpl({
    required _i1.UuidValue gameId,
    required _i1.UuidValue userId,
    List<_i1.UuidValue>? wordCategoryIds,
    bool? isShowWordHint,
    bool? isSubmittedUserWord,
  }) : super._(
          gameId: gameId,
          userId: userId,
          wordCategoryIds: wordCategoryIds,
          isShowWordHint: isShowWordHint,
          isSubmittedUserWord: isSubmittedUserWord,
        );

  /// Returns a shallow copy of this [ChangeGameSettingsRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChangeGameSettingsRequest copyWith({
    _i1.UuidValue? gameId,
    _i1.UuidValue? userId,
    Object? wordCategoryIds = _Undefined,
    Object? isShowWordHint = _Undefined,
    Object? isSubmittedUserWord = _Undefined,
  }) {
    return ChangeGameSettingsRequest(
      gameId: gameId ?? this.gameId,
      userId: userId ?? this.userId,
      wordCategoryIds: wordCategoryIds is List<_i1.UuidValue>?
          ? wordCategoryIds
          : this.wordCategoryIds?.map((e0) => e0).toList(),
      isShowWordHint:
          isShowWordHint is bool? ? isShowWordHint : this.isShowWordHint,
      isSubmittedUserWord: isSubmittedUserWord is bool?
          ? isSubmittedUserWord
          : this.isSubmittedUserWord,
    );
  }
}
