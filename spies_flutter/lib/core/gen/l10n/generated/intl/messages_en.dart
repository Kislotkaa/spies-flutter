// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Spy"),
        "authFailedToSignIn": MessageLookupByLibrary.simpleMessage(
            "Failed to log in, please try again later"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "createGameCreate": MessageLookupByLibrary.simpleMessage("Create"),
        "createGameTitle":
            MessageLookupByLibrary.simpleMessage("Game creation"),
        "enter": MessageLookupByLibrary.simpleMessage("Enter"),
        "gameTitle": MessageLookupByLibrary.simpleMessage("Game"),
        "mainConnectGame": MessageLookupByLibrary.simpleMessage("Connect"),
        "mainCreateGame": MessageLookupByLibrary.simpleMessage("Create game"),
        "mainTitle": MessageLookupByLibrary.simpleMessage("Main"),
        "name": MessageLookupByLibrary.simpleMessage("Nickname"),
        "nameNotValid": MessageLookupByLibrary.simpleMessage(
            "The length of the nickname should be at least 2 characters"),
        "politPart1": MessageLookupByLibrary.simpleMessage(
            "Entering, you agree with the present "),
        "politPart2": MessageLookupByLibrary.simpleMessage("privacy policy."),
        "serverError": MessageLookupByLibrary.simpleMessage(
            "A server error occurred, please try again later"),
        "serverUnavailable": MessageLookupByLibrary.simpleMessage(
            "The server is currently not available"),
        "settingsAccount": MessageLookupByLibrary.simpleMessage("Account"),
        "settingsAccountDelete":
            MessageLookupByLibrary.simpleMessage("Delete account"),
        "settingsAdditional":
            MessageLookupByLibrary.simpleMessage("Additional"),
        "settingsChangeNameTitle":
            MessageLookupByLibrary.simpleMessage("Change name"),
        "settingsDarkTheme": MessageLookupByLibrary.simpleMessage("Dark theme"),
        "settingsGameRules":
            MessageLookupByLibrary.simpleMessage("Rules of the game"),
        "settingsMain": MessageLookupByLibrary.simpleMessage("Basic"),
        "settingsNameChanged": MessageLookupByLibrary.simpleMessage(
            "Your nickname has been successfully changed!"),
        "settingsPolit": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "settingsSuggestWord":
            MessageLookupByLibrary.simpleMessage("Suggest a word"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "youAreYours": MessageLookupByLibrary.simpleMessage("Are you your own?")
      };
}
