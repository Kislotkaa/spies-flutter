// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authFailedToSignIn": MessageLookupByLibrary.simpleMessage(
            "Не удалось авторизироваться, повторите попытку позже"),
        "enter": MessageLookupByLibrary.simpleMessage("Войти"),
        "nick": MessageLookupByLibrary.simpleMessage("Никнейм"),
        "nickFailed": MessageLookupByLibrary.simpleMessage(
            "Длина должна быть не меньше 2-х символов"),
        "politPart1": MessageLookupByLibrary.simpleMessage(
            "Войдя, вы соглашаетесь с настоящей "),
        "politPart2": MessageLookupByLibrary.simpleMessage(
            "политикой конфиденциальности."),
        "serverError": MessageLookupByLibrary.simpleMessage(
            "Произошла серверная ошибка, повторите попытку позже"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
        "youAreYours": MessageLookupByLibrary.simpleMessage("Ты свой?")
      };
}
