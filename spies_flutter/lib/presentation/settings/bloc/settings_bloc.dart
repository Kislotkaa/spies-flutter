import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/src/repositories/user_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final UserRepository _userRepository;
  SettingsBloc(this._userRepository) : super(SettingsInitialState()) {
    on<SettingsInitialEvent>(_init);
    on<SettingsLogoutEvent>(_logout);
  }

  FutureOr<void> _init(SettingsInitialEvent event, emit) {}

  FutureOr<void> _logout(SettingsLogoutEvent event, emit) {
    _userRepository.signOut();

    emit(SettingsLogoutSuccessState());
  }
}
