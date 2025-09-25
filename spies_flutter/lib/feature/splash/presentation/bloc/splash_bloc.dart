import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/repositories/auth_repository.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/router/app_router.gr.dart';

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
    _userRepository.checkAuth();

    await Future.delayed(const Duration(seconds: 1));

    if (_userRepository.isAuth) {
      router.replace(const MainRoute());
      return;
    }

    router.replace(const AuthRoute());
  }
}
