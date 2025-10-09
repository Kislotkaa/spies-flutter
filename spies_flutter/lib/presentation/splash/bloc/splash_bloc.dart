import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/src/repositories/user_repository.dart';
import 'package:serverpod_flutter_client/serverpod_flutter_client.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserRepository _userRepository;

  SplashBloc(
    this._userRepository,
  ) : super(SplashInitialState()) {
    on<SplashInitialEvent>(_init);
  }

  FutureOr<void> _init(SplashInitialEvent event, emit) async {
    if (_userRepository.isAuth && _userRepository.user != null) {
      _userRepository.signIn(
        SignInRequest(
          deviceId: _userRepository.user!.deviceId,
          name: _userRepository.user!.name,
        ),
      );
      emit(SplashToMainState());
      return;
    }

    emit(SplashToAuthState());
  }
}
