import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/repositories/auth_repository.dart';
import 'package:sample/core/utils/device_extension.dart';
import 'package:serverpod_flutter_client/serverpod_flutter_client.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;

  AuthBloc(
    this._userRepository,
  ) : super(AuthInitialState()) {
    on<AuthInitialEvent>(_init);
    on<AuthSignInEvent>(_signIn);
    on<AuthInputEvent>(_input);
  }

  String _name = '';

  FutureOr<void> _init(AuthInitialEvent event, emit) {
    emit(AuthUpdatedState(_name));
  }

  Future<void> _signIn(AuthSignInEvent event, emit) async {
    emit(AuthLoadingState());

    final result = await _userRepository.signIn(
      SignInRequest(
        deviceId: DeviceExtension.deviceUuid,
        name: _name,
      ),
    );

    if (result.isError) {
      return emit(
        AuthErrorState(
          title: S.current.somethingWentWrong,
          subTitle: S.current.authFailedToSignIn,
        ),
      );
    }

    emit(AuthSuccessState());
  }

  FutureOr<void> _input(AuthInputEvent event, emit) {
    _name = event.text;
  }
}
