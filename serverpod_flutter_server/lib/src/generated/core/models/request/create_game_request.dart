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

abstract class CreateGameRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateGameRequest._({
    required this.name,
    required this.ownerId,
    required this.wordCategoryIds,
    required this.isShowWordHint,
    required this.isSubmittedUserWord,
  });

  factory CreateGameRequest({
    required String name,
    required _i1.UuidValue ownerId,
    required List<_i1.UuidValue> wordCategoryIds,
    required bool isShowWordHint,
    required bool isSubmittedUserWord,
  }) = _CreateGameRequestImpl;

  factory CreateGameRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateGameRequest(
      name: jsonSerialization['name'] as String,
      ownerId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['ownerId']),
      wordCategoryIds: (jsonSerialization['wordCategoryIds'] as List)
          .map((e) => _i1.UuidValueJsonExtension.fromJson(e))
          .toList(),
      isShowWordHint: jsonSerialization['isShowWordHint'] as bool,
      isSubmittedUserWord: jsonSerialization['isSubmittedUserWord'] as bool,
    );
  }

  String name;

  _i1.UuidValue ownerId;

  List<_i1.UuidValue> wordCategoryIds;

  bool isShowWordHint;

  bool isSubmittedUserWord;

  /// Returns a shallow copy of this [CreateGameRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateGameRequest copyWith({
    String? name,
    _i1.UuidValue? ownerId,
    List<_i1.UuidValue>? wordCategoryIds,
    bool? isShowWordHint,
    bool? isSubmittedUserWord,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ownerId': ownerId.toJson(),
      'wordCategoryIds': wordCategoryIds.toJson(valueToJson: (v) => v.toJson()),
      'isShowWordHint': isShowWordHint,
      'isSubmittedUserWord': isSubmittedUserWord,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'name': name,
      'ownerId': ownerId.toJson(),
      'wordCategoryIds': wordCategoryIds.toJson(valueToJson: (v) => v.toJson()),
      'isShowWordHint': isShowWordHint,
      'isSubmittedUserWord': isSubmittedUserWord,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CreateGameRequestImpl extends CreateGameRequest {
  _CreateGameRequestImpl({
    required String name,
    required _i1.UuidValue ownerId,
    required List<_i1.UuidValue> wordCategoryIds,
    required bool isShowWordHint,
    required bool isSubmittedUserWord,
  }) : super._(
          name: name,
          ownerId: ownerId,
          wordCategoryIds: wordCategoryIds,
          isShowWordHint: isShowWordHint,
          isSubmittedUserWord: isSubmittedUserWord,
        );

  /// Returns a shallow copy of this [CreateGameRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateGameRequest copyWith({
    String? name,
    _i1.UuidValue? ownerId,
    List<_i1.UuidValue>? wordCategoryIds,
    bool? isShowWordHint,
    bool? isSubmittedUserWord,
  }) {
    return CreateGameRequest(
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      wordCategoryIds:
          wordCategoryIds ?? this.wordCategoryIds.map((e0) => e0).toList(),
      isShowWordHint: isShowWordHint ?? this.isShowWordHint,
      isSubmittedUserWord: isSubmittedUserWord ?? this.isSubmittedUserWord,
    );
  }
}
