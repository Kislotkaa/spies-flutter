part of 'auth_bloc.dart';

class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthNameValidFailedState extends AuthState {
  final String title;
  final String? subTitle;

  AuthNameValidFailedState({
    required this.title,
    this.subTitle,
  });
}

class AuthSuccessState extends AuthState {}

class AuthSuffixShownState extends AuthState {
  final bool isShownSuffix;

  AuthSuffixShownState({required this.isShownSuffix});
}

class AuthUpdatedState extends AuthState {
  final TextEditingController nameController;

  AuthUpdatedState(this.nameController);
}
