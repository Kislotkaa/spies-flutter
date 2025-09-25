import 'dart:async';
import 'dart:io';

import 'package:sample/core/constants/constants.dart';
import 'package:sample/core/providers/local_data_provider.dart';

class IntlRepository {
  final LocalDataProvider _localDataProvider;

  IntlRepository(
    this._localDataProvider,
  ) {
    _init();
  }

  final _controller = StreamController<String>();

  void _init() {
    try {
      final locale = _localDataProvider.getLocal();

      if (locale == null) {
        final systemLocale = Platform.localeName;

        late final String locale;

        if (systemLocale.substring(0, 2) == IntlLocales.ru) {
          locale = IntlLocales.ru;
        } else {
          locale = IntlLocales.en;
        }

        _controller.add(locale);
        saveLocale(locale);
        return;
      }

      if (locale == IntlLocales.en) {
        _controller.add(IntlLocales.en);
        return;
      }

      _controller.add(IntlLocales.ru);
    } catch (_) {
      saveLocale(IntlLocales.ru);
    }
  }

  Stream<String> getStream() async* {
    yield* _controller.stream;
  }

  Future<void> saveLocale(String locale) async {
    _controller.add(locale);
    _localDataProvider.saveLocale(locale);
  }

  void dispose() => _controller.close();
}
