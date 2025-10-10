import 'dart:async';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/utils/constants.dart';
import 'package:sample/src/repositories/intl_repository.dart';

class IntlCubit extends Cubit<IntlState> {
  final IntlRepository _intlRepository;

  IntlCubit(
    this._intlRepository,
  ) : super(const IntlState(IntlLocales.ru)) {
    getCurrentLocale();
  }

  StreamSubscription<String>? _localeSubscription;

  void getCurrentLocale() =>
      _localeSubscription = _intlRepository.getLocaleStream.listen(
        (locale) => emit(IntlState(locale)),
      );

  void changeLocale(String languageCode) {
    if (languageCode == state.languageKey) return;

    _intlRepository.saveLocale(languageCode);
  }

  @override
  Future<void> close() {
    _localeSubscription?.cancel();
    _intlRepository.dispose();
    return super.close();
  }
}

class IntlState {
  final String languageKey;
  const IntlState(this.languageKey);

  Locale get getLocale => Locale(languageKey);
}
