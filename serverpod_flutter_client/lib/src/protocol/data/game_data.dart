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
import '../enums/game_status.dart' as _i2;
import '../data/user_data.dart' as _i3;
import '../data/word_data.dart' as _i4;
import '../data/word_category_data.dart' as _i5;

abstract class GameData implements _i1.SerializableModel {
  GameData._({
    _i1.UuidValue? id,
    required this.owner,
    required this.name,
    required this.code,
    this.currentWordId,
    this.currentWord,
    this.nextWordId,
    this.nextWord,
    this.suggestWordId,
    this.suggestWord,
    required this.wordCategoryList,
    required this.playerList,
    required this.isShowWordHint,
    required this.isSubmittedUserWord,
    _i2.GameStatus? status,
  })  : id = id ?? _i1.Uuid().v4obj(),
        status = status ?? _i2.GameStatus.created;

  factory GameData({
    _i1.UuidValue? id,
    required _i3.UserData owner,
    required String name,
    required String code,
    _i1.UuidValue? currentWordId,
    _i4.WordData? currentWord,
    _i1.UuidValue? nextWordId,
    _i4.WordData? nextWord,
    _i1.UuidValue? suggestWordId,
    _i4.WordData? suggestWord,
    required List<_i5.WordCategoryData> wordCategoryList,
    required List<_i3.UserData> playerList,
    required bool isShowWordHint,
    required bool isSubmittedUserWord,
    _i2.GameStatus? status,
  }) = _GameDataImpl;

  factory GameData.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameData(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      owner: _i3.UserData.fromJson(
          (jsonSerialization['owner'] as Map<String, dynamic>)),
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      currentWordId: jsonSerialization['currentWordId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['currentWordId']),
      currentWord: jsonSerialization['currentWord'] == null
          ? null
          : _i4.WordData.fromJson(
              (jsonSerialization['currentWord'] as Map<String, dynamic>)),
      nextWordId: jsonSerialization['nextWordId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['nextWordId']),
      nextWord: jsonSerialization['nextWord'] == null
          ? null
          : _i4.WordData.fromJson(
              (jsonSerialization['nextWord'] as Map<String, dynamic>)),
      suggestWordId: jsonSerialization['suggestWordId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['suggestWordId']),
      suggestWord: jsonSerialization['suggestWord'] == null
          ? null
          : _i4.WordData.fromJson(
              (jsonSerialization['suggestWord'] as Map<String, dynamic>)),
      wordCategoryList: (jsonSerialization['wordCategoryList'] as List)
          .map(
              (e) => _i5.WordCategoryData.fromJson((e as Map<String, dynamic>)))
          .toList(),
      playerList: (jsonSerialization['playerList'] as List)
          .map((e) => _i3.UserData.fromJson((e as Map<String, dynamic>)))
          .toList(),
      isShowWordHint: jsonSerialization['isShowWordHint'] as bool,
      isSubmittedUserWord: jsonSerialization['isSubmittedUserWord'] as bool,
      status: _i2.GameStatus.fromJson((jsonSerialization['status'] as int)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i3.UserData owner;

  String name;

  String code;

  _i1.UuidValue? currentWordId;

  _i4.WordData? currentWord;

  _i1.UuidValue? nextWordId;

  _i4.WordData? nextWord;

  _i1.UuidValue? suggestWordId;

  _i4.WordData? suggestWord;

  List<_i5.WordCategoryData> wordCategoryList;

  List<_i3.UserData> playerList;

  bool isShowWordHint;

  bool isSubmittedUserWord;

  _i2.GameStatus status;

  /// Returns a shallow copy of this [GameData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GameData copyWith({
    _i1.UuidValue? id,
    _i3.UserData? owner,
    String? name,
    String? code,
    _i1.UuidValue? currentWordId,
    _i4.WordData? currentWord,
    _i1.UuidValue? nextWordId,
    _i4.WordData? nextWord,
    _i1.UuidValue? suggestWordId,
    _i4.WordData? suggestWord,
    List<_i5.WordCategoryData>? wordCategoryList,
    List<_i3.UserData>? playerList,
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
      if (currentWordId != null) 'currentWordId': currentWordId?.toJson(),
      if (currentWord != null) 'currentWord': currentWord?.toJson(),
      if (nextWordId != null) 'nextWordId': nextWordId?.toJson(),
      if (nextWord != null) 'nextWord': nextWord?.toJson(),
      if (suggestWordId != null) 'suggestWordId': suggestWordId?.toJson(),
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
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GameDataImpl extends GameData {
  _GameDataImpl({
    _i1.UuidValue? id,
    required _i3.UserData owner,
    required String name,
    required String code,
    _i1.UuidValue? currentWordId,
    _i4.WordData? currentWord,
    _i1.UuidValue? nextWordId,
    _i4.WordData? nextWord,
    _i1.UuidValue? suggestWordId,
    _i4.WordData? suggestWord,
    required List<_i5.WordCategoryData> wordCategoryList,
    required List<_i3.UserData> playerList,
    required bool isShowWordHint,
    required bool isSubmittedUserWord,
    _i2.GameStatus? status,
  }) : super._(
          id: id,
          owner: owner,
          name: name,
          code: code,
          currentWordId: currentWordId,
          currentWord: currentWord,
          nextWordId: nextWordId,
          nextWord: nextWord,
          suggestWordId: suggestWordId,
          suggestWord: suggestWord,
          wordCategoryList: wordCategoryList,
          playerList: playerList,
          isShowWordHint: isShowWordHint,
          isSubmittedUserWord: isSubmittedUserWord,
          status: status,
        );

  /// Returns a shallow copy of this [GameData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GameData copyWith({
    _i1.UuidValue? id,
    _i3.UserData? owner,
    String? name,
    String? code,
    Object? currentWordId = _Undefined,
    Object? currentWord = _Undefined,
    Object? nextWordId = _Undefined,
    Object? nextWord = _Undefined,
    Object? suggestWordId = _Undefined,
    Object? suggestWord = _Undefined,
    List<_i5.WordCategoryData>? wordCategoryList,
    List<_i3.UserData>? playerList,
    bool? isShowWordHint,
    bool? isSubmittedUserWord,
    _i2.GameStatus? status,
  }) {
    return GameData(
      id: id ?? this.id,
      owner: owner ?? this.owner.copyWith(),
      name: name ?? this.name,
      code: code ?? this.code,
      currentWordId:
          currentWordId is _i1.UuidValue? ? currentWordId : this.currentWordId,
      currentWord: currentWord is _i4.WordData?
          ? currentWord
          : this.currentWord?.copyWith(),
      nextWordId: nextWordId is _i1.UuidValue? ? nextWordId : this.nextWordId,
      nextWord:
          nextWord is _i4.WordData? ? nextWord : this.nextWord?.copyWith(),
      suggestWordId:
          suggestWordId is _i1.UuidValue? ? suggestWordId : this.suggestWordId,
      suggestWord: suggestWord is _i4.WordData?
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
