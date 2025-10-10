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

  /// `Сервер в данный момент не доступен`
  String get serverUnavailable {
    return Intl.message(
      'Сервер в данный момент не доступен',
      name: 'serverUnavailable',
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
  String get name {
    return Intl.message(
      'Никнейм',
      name: 'name',
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

  /// `Отмена`
  String get cancel {
    return Intl.message(
      'Отмена',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Длина никнейма должна быть не меньше 2-х символов`
  String get nameNotValid {
    return Intl.message(
      'Длина никнейма должна быть не меньше 2-х символов',
      name: 'nameNotValid',
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

  /// `Создать игру`
  String get mainCreateGame {
    return Intl.message(
      'Создать игру',
      name: 'mainCreateGame',
      desc: '',
      args: [],
    );
  }

  /// `Подключиться`
  String get mainConnectGame {
    return Intl.message(
      'Подключиться',
      name: 'mainConnectGame',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get mainTitle {
    return Intl.message(
      'Главная',
      name: 'mainTitle',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get settingsTitle {
    return Intl.message(
      'Настройки',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ваш ник успешно изменён!`
  String get settingsNameChanged {
    return Intl.message(
      'Ваш ник успешно изменён!',
      name: 'settingsNameChanged',
      desc: '',
      args: [],
    );
  }

  /// `Сменить имя`
  String get settingsChangeNameTitle {
    return Intl.message(
      'Сменить имя',
      name: 'settingsChangeNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Основные`
  String get settingsMain {
    return Intl.message(
      'Основные',
      name: 'settingsMain',
      desc: '',
      args: [],
    );
  }

  /// `Дополнительные`
  String get settingsAdditional {
    return Intl.message(
      'Дополнительные',
      name: 'settingsAdditional',
      desc: '',
      args: [],
    );
  }

  /// `Тёмная тема`
  String get settingsDarkTheme {
    return Intl.message(
      'Тёмная тема',
      name: 'settingsDarkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Правила игры`
  String get settingsGameRules {
    return Intl.message(
      'Правила игры',
      name: 'settingsGameRules',
      desc: '',
      args: [],
    );
  }

  /// `Политика конфинденциальности`
  String get settingsPolit {
    return Intl.message(
      'Политика конфинденциальности',
      name: 'settingsPolit',
      desc: '',
      args: [],
    );
  }

  /// `Аккаунт`
  String get settingsAccount {
    return Intl.message(
      'Аккаунт',
      name: 'settingsAccount',
      desc: '',
      args: [],
    );
  }

  /// `Удалить аккаунт`
  String get settingsAccountDelete {
    return Intl.message(
      'Удалить аккаунт',
      name: 'settingsAccountDelete',
      desc: '',
      args: [],
    );
  }

  /// `Предложить слово`
  String get settingsSuggestWord {
    return Intl.message(
      'Предложить слово',
      name: 'settingsSuggestWord',
      desc: '',
      args: [],
    );
  }

  /// `Создание игры`
  String get createGameTitle {
    return Intl.message(
      'Создание игры',
      name: 'createGameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Создать`
  String get createGameCreate {
    return Intl.message(
      'Создать',
      name: 'createGameCreate',
      desc: '',
      args: [],
    );
  }

  /// `Игра`
  String get gameTitle {
    return Intl.message(
      'Игра',
      name: 'gameTitle',
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
