part of 'auth_bloc.dart';

class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthNameInvalidState extends AuthState {
  final String title;
  final String? subTitle;

  AuthNameInvalidState({
    required this.title,
    this.subTitle,
  });
}

class AuthSuccessState extends AuthState {}

class AuthSuffixShownState extends AuthState {
  final bool isShownSuffix;

  AuthSuffixShownState(this.isShownSuffix);
}

class AuthUpdatedState extends AuthState {
  final TextEditingController nameController;
  final GlobalKey formKey;

  AuthUpdatedState({
    required this.nameController,
    required this.formKey,
  });
}
