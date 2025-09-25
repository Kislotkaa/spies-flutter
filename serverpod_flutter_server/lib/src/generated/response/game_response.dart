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
import '../enums/game_status.dart' as _i2;
import '../response/user_response.dart' as _i3;
import '../response/word_response.dart' as _i4;
import '../response/word_category_response.dart' as _i5;

abstract class GameResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GameResponse._({
    _i1.UuidValue? id,
    required this.owner,
    required this.name,
    required this.code,
    this.currentWord,
    this.nextWord,
    this.suggestWord,
    required this.wordCategoryList,
    required this.playerList,
    required this.isShowWordHint,
    required this.isSubmittedUserWord,
    _i2.GameStatus? status,
  })  : id = id ?? _i1.Uuid().v4obj(),
        status = status ?? _i2.GameStatus.created;

  factory GameResponse({
    _i1.UuidValue? id,
    required _i3.UserResponse owner,
    required String name,
    required String code,
    _i4.WordResponse? currentWord,
    _i4.WordResponse? nextWord,
    _i4.WordResponse? suggestWord,
    required List<_i5.WordCategoryResponse> wordCategoryList,
    required List<_i3.UserResponse> playerList,
    required bool isShowWordHint,
    required bool isSubmittedUserWord,
    _i2.GameStatus? status,
  }) = _GameResponseImpl;

  factory GameResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameResponse(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      owner: _i3.UserResponse.fromJson(
          (jsonSerialization['owner'] as Map<String, dynamic>)),
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      currentWord: jsonSerialization['currentWord'] == null
          ? null
          : _i4.WordResponse.fromJson(
              (jsonSerialization['currentWord'] as Map<String, dynamic>)),
      nextWord: jsonSerialization['nextWord'] == null
          ? null
          : _i4.WordResponse.fromJson(
              (jsonSerialization['nextWord'] as Map<String, dynamic>)),
      suggestWord: jsonSerialization['suggestWord'] == null
          ? null
          : _i4.WordResponse.fromJson(
              (jsonSerialization['suggestWord'] as Map<String, dynamic>)),
      wordCategoryList: (jsonSerialization['wordCategoryList'] as List)
          .map((e) =>
              _i5.WordCategoryResponse.fromJson((e as Map<String, dynamic>)))
          .toList(),
      playerList: (jsonSerialization['playerList'] as List)
          .map((e) => _i3.UserResponse.fromJson((e as Map<String, dynamic>)))
          .toList(),
      isShowWordHint: jsonSerialization['isShowWordHint'] as bool,
      isSubmittedUserWord: jsonSerialization['isSubmittedUserWord'] as bool,
      status: _i2.GameStatus.fromJson((jsonSerialization['status'] as int)),
    );
  }

  _i1.UuidValue id;

  _i3.UserResponse owner;

  String name;

  String code;

  _i4.WordResponse? currentWord;

  _i4.WordResponse? nextWord;

  _i4.WordResponse? suggestWord;

  List<_i5.WordCategoryResponse> wordCategoryList;

  List<_i3.UserResponse> playerList;

  bool isShowWordHint;

  bool isSubmittedUserWord;

  _i2.GameStatus status;

  /// Returns a shallow copy of this [GameResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GameResponse copyWith({
    _i1.UuidValue? id,
    _i3.UserResponse? owner,
    String? name,
    String? code,
    _i4.WordResponse? currentWord,
    _i4.WordResponse? nextWord,
    _i4.WordResponse? suggestWord,
    List<_i5.WordCategoryResponse>? wordCategoryList,
    List<_i3.UserResponse>? playerList,
    bool? isShowWordHint,
    bool? isSubmittedUserWord,
    _i2.GameStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'owner': owner.toJson(),
      'name': name,
      'code': code,
      if (currentWord != null) 'currentWord': currentWord?.toJson(),
      if (nextWord != null) 'nextWord': nextWord?.toJson(),
      if (suggestWord != null) 'suggestWord': suggestWord?.toJson(),
      'wordCategoryList':
          wordCategoryList.toJson(valueToJson: (v) => v.toJson()),
      'playerList': playerList.toJson(valueToJson: (v) => v.toJson()),
      'isShowWordHint': isShowWordHint,
      'isSubmittedUserWord': isSubmittedUserWord,
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'owner': owner.toJsonForProtocol(),
      'name': name,
      'code': code,
      if (currentWord != null) 'currentWord': currentWord?.toJsonForProtocol(),
      if (nextWord != null) 'nextWord': nextWord?.toJsonForProtocol(),
      if (suggestWord != null) 'suggestWord': suggestWord?.toJsonForProtocol(),
      'wordCategoryList':
          wordCategoryList.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'playerList':
          playerList.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'isShowWordHint': isShowWordHint,
      'isSubmittedUserWord': isSubmittedUserWord,
      'status': status.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GameResponseImpl extends GameResponse {
  _GameResponseImpl({
    _i1.UuidValue? id,
    required _i3.UserResponse owner,
    required String name,
    required String code,
    _i4.WordResponse? currentWord,
    _i4.WordResponse? nextWord,
    _i4.WordResponse? suggestWord,
    required List<_i5.WordCategoryResponse> wordCategoryList,
    required List<_i3.UserResponse> playerList,
    required bool isShowWordHint,
    required bool isSubmittedUserWord,
    _i2.GameStatus? status,
  }) : super._(
          id: id,
          owner: owner,
          name: name,
          code: code,
          currentWord: currentWord,
          nextWord: nextWord,
          suggestWord: suggestWord,
          wordCategoryList: wordCategoryList,
          playerList: playerList,
          isShowWordHint: isShowWordHint,
          isSubmittedUserWord: isSubmittedUserWord,
          status: status,
        );

  /// Returns a shallow copy of this [GameResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GameResponse copyWith({
    _i1.UuidValue? id,
    _i3.UserResponse? owner,
    String? name,
    String? code,
    Object? currentWord = _Undefined,
    Object? nextWord = _Undefined,
    Object? suggestWord = _Undefined,
    List<_i5.WordCategoryResponse>? wordCategoryList,
    List<_i3.UserResponse>? playerList,
    bool? isShowWordHint,
    bool? isSubmittedUserWord,
    _i2.GameStatus? status,
  }) {
    return GameResponse(
      id: id ?? this.id,
      owner: owner ?? this.owner.copyWith(),
      name: name ?? this.name,
      code: code ?? this.code,
      currentWord: currentWord is _i4.WordResponse?
          ? currentWord
          : this.currentWord?.copyWith(),
      nextWord:
          nextWord is _i4.WordResponse? ? nextWord : this.nextWord?.copyWith(),
      suggestWord: suggestWord is _i4.WordResponse?
          ? suggestWord
          : this.suggestWord?.copyWith(),
      wordCategoryList: wordCategoryList ??
          this.wordCategoryList.map((e0) => e0.copyWith()).toList(),
      playerList:
          playerList ?? this.playerList.map((e0) => e0.copyWith()).toList(),
      isShowWordHint: isShowWordHint ?? this.isShowWordHint,
      isSubmittedUserWord: isSubmittedUserWord ?? this.isSubmittedUserWord,
      status: status ?? this.status,
    );
  }
}
