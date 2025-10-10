import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/models/app_response.dart';
import 'package:sample/src/repositories/user_repository.dart';
import 'package:sample/src/widgets/snackbar_widget.dart';
import 'package:serverpod_flutter_client/serverpod_flutter_client.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final UserRepository _userRepository;

  SettingsBloc(this._userRepository) : super(SettingsInitialState()) {
    on<SettingsInitialEvent>(_init);
    on<SettingsLogoutEvent>(_logout);
    on<SettingsInputEvent>(_input);
    on<SettingsChangeNameEvent>(_changeName);
  }

  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FutureOr<void> _init(SettingsInitialEvent event, emit) {
    _nameController.text = _userRepository.name ?? '';
    emit(
      SettingsUpdateState(
        formKey: _formKey,
        nameController: _nameController,
      ),
    );
  }

  FutureOr<void> _logout(SettingsLogoutEvent event, emit) {
    _userRepository.signOut();

    emit(SettingsLogoutSuccessState());
  }

  FutureOr<void> _input(SettingsInputEvent event, emit) {
    emit(
      SettingsSuffixShownState(
        isShownSuffix: _userRepository.name != _nameController.text,
      ),
    );
  }

  FutureOr<void> _changeName(SettingsChangeNameEvent event, emit) async {
    if (_formKey.currentState?.validate() == false) {
      return emit(
        SettingsSnackBarShownState(
          title: S.current.nameNotValid,
          status: SnackbarStatus.warning,
        ),
      );
    }

    emit(
      SettingsSuffixShownState(
        isShownSuffix: true,
        isLoading: true,
      ),
    );

    final result = await _userRepository.changeName(
      ChangeNameRequest(
        userId: _userRepository.userId!,
        newName: _nameController.text,
      ),
    );

    if (result.isError) {
      _nameController.text = _userRepository.name ?? '';
      return emit(
        SettingsSnackBarShownState(
          title: result.error == GatewayError.serverUnavailable
              ? S.current.serverUnavailable
              : S.current.somethingWentWrong,
          subTitle: S.current.authFailedToSignIn,
          status: SnackbarStatus.error,
        ),
      );
    }

    emit(
      SettingsSuffixShownState(
        isShownSuffix: false,
        isLoading: false,
      ),
    );

    emit(
      SettingsSnackBarShownState(
        title: S.current.settingsNameChanged,
        status: SnackbarStatus.access,
      ),
    );
  }
}
