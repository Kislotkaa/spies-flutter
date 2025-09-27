// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Шпион`
  String get appName {
    return Intl.message(
      'Шпион',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Что-то пошло не так`
  String get somethingWentWrong {
    return Intl.message(
      'Что-то пошло не так',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Произошла серверная ошибка, повторите попытку позже`
  String get serverError {
    return Intl.message(
      'Произошла серверная ошибка, повторите попытку позже',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось авторизироваться, повторите попытку позже`
  String get authFailedToSignIn {
    return Intl.message(
      'Не удалось авторизироваться, повторите попытку позже',
      name: 'authFailedToSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Никнейм`
  String get nick {
    return Intl.message(
      'Никнейм',
      name: 'nick',
      desc: '',
      args: [],
    );
  }

  /// `Ты свой?`
  String get youAreYours {
    return Intl.message(
      'Ты свой?',
      name: 'youAreYours',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get enter {
    return Intl.message(
      'Войти',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Длина должна быть не меньше 2-х символов`
  String get nickFailed {
    return Intl.message(
      'Длина должна быть не меньше 2-х символов',
      name: 'nickFailed',
      desc: '',
      args: [],
    );
  }

  /// `Войдя, вы соглашаетесь с настоящей `
  String get politPart1 {
    return Intl.message(
      'Войдя, вы соглашаетесь с настоящей ',
      name: 'politPart1',
      desc: '',
      args: [],
    );
  }

  /// `политикой конфиденциальности.`
  String get politPart2 {
    return Intl.message(
      'политикой конфиденциальности.',
      name: 'politPart2',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
