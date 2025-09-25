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

abstract class ExceptionResponse
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  ExceptionResponse._({
    String? title,
    this.subTitle,
  }) : title = title ?? 'Что-то пошло не так';

  factory ExceptionResponse({
    String? title,
    String? subTitle,
  }) = _ExceptionResponseImpl;

  factory ExceptionResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return ExceptionResponse(
      title: jsonSerialization['title'] as String,
      subTitle: jsonSerialization['subTitle'] as String?,
    );
  }

  String title;

  String? subTitle;

  /// Returns a shallow copy of this [ExceptionResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ExceptionResponse copyWith({
    String? title,
    String? subTitle,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (subTitle != null) 'subTitle': subTitle,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'title': title,
      if (subTitle != null) 'subTitle': subTitle,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ExceptionResponseImpl extends ExceptionResponse {
  _ExceptionResponseImpl({
    String? title,
    String? subTitle,
  }) : super._(
          title: title,
          subTitle: subTitle,
        );

  /// Returns a shallow copy of this [ExceptionResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ExceptionResponse copyWith({
    String? title,
    Object? subTitle = _Undefined,
  }) {
    return ExceptionResponse(
      title: title ?? this.title,
      subTitle: subTitle is String? ? subTitle : this.subTitle,
    );
  }
}
