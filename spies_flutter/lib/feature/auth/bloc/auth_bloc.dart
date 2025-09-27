import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/models/app_response.dart';
import 'package:sample/core/repositories/user_repository.dart';
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
    on<AuthInputEvent>(_input);
    on<AuthSignInEvent>(_signIn);
    on<AuthClearNameEvent>(_cleanName);
  }

  final _nameController = TextEditingController();

  FutureOr<void> _init(AuthInitialEvent event, emit) {
    emit(AuthUpdatedState(_nameController));
  }

  Future<void> _signIn(AuthSignInEvent event, emit) async {
    emit(AuthLoadingState());

    if (_nameController.text.isEmpty || _nameController.text.length < 2) {
      emit(AuthNameValidFailedState(title: S.current.nameNotValid));
      return;
    }

    final result = await _userRepository.signIn(
      SignInRequest(
        deviceId: DeviceExtension.deviceUuid,
        name: _nameController.text,
      ),
    );

    if (result.isError) {
      return emit(
        AuthNameValidFailedState(
          title: result.error == GatewayError.serverUnavailable
              ? S.current.serverUnavailable
              : S.current.somethingWentWrong,
          subTitle: S.current.authFailedToSignIn,
        ),
      );
    }

    emit(AuthSuccessState());
  }

  FutureOr<void> _cleanName(AuthClearNameEvent event, emit) {
    _nameController.clear();
    emit(AuthSuffixShownState(isShownSuffix: _nameController.text.isNotEmpty));
  }

  FutureOr<void> _input(AuthInputEvent event, emit) {
    emit(AuthSuffixShownState(isShownSuffix: _nameController.text.isNotEmpty));
  }
}
