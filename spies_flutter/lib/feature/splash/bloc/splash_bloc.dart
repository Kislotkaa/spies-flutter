import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/repositories/user_repository.dart';

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
    await Future.delayed(const Duration(seconds: 1));

    if (_userRepository.isAuth) {
      emit(SplashToMainState());
      return;
    }

    emit(SplashToAuthState());
  }
}
