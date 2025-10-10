part of 'settings_bloc.dart';

class SettingsState {}

class SettingsInitialState extends SettingsState {}

class SettingsSnackBarShownState extends SettingsState {
  final String title;
  final String? subTitle;
  final SnackbarStatus status;

  SettingsSnackBarShownState({
    required this.title,
    this.subTitle,
    this.status = SnackbarStatus.warning,
  });
}

class SettingsNameLoadingState extends SettingsState {}

class SettingsSuffixShownState extends SettingsState {
  final bool isShownSuffix;

  SettingsSuffixShownState(this.isShownSuffix);
}

class SettingsLogoutSuccessState extends SettingsState {}

class SettingsUpdateState extends SettingsState {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;

  SettingsUpdateState({
    required this.formKey,
    required this.nameController,
  });
}
