import 'dart:async';
import 'dart:io';

import 'package:sample/core/utils/constants.dart';
import 'package:sample/src/providers/local_data_provider.dart';

class IntlRepository {
  final LocalDataProvider _localDataProvider;

  IntlRepository(
    this._localDataProvider,
  ) {
    final result = _localDataProvider.getLocal();

    _currentLocale = switch (result) {
      null => _getLocale(Platform.localeName.substring(0, 2)),
      _ => _getLocale(result),
    };

    saveLocale(_currentLocale);
  }

  final _controller = StreamController<String>();

  String? _currentLocale;

  Stream<String> get getLocaleStream => _controller.stream;
  String get getCurrnetLocale => _currentLocale ?? IntlLocales.ru;

  Future<void> saveLocale([String? locale]) async {
    final newLocale = locale ?? getCurrnetLocale;

    _currentLocale = newLocale;
    _controller.add(newLocale);
    _localDataProvider.saveLocale(newLocale);
  }

  void dispose() => _controller.close();

  String _getLocale(String localeName) => switch (localeName) {
        'en' => IntlLocales.en,
        _ => IntlLocales.ru,
      };
}
