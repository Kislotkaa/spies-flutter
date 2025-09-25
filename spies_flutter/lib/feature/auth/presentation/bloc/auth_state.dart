part of 'auth_bloc.dart';

class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String title;
  final String? subTitle;

  AuthErrorState({
    required this.title,
    this.subTitle,
  });
}

class AuthSuccessState extends AuthState {}

class AuthUpdatedState extends AuthState {
  final String name;

  AuthUpdatedState(this.name);
}
