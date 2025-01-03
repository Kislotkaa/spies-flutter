part of 'home_bloc.dart';

class HomeState extends Equatable {
  final StateStatus status;
  final SnackbarModel? snackbar;

  const HomeState.initial() : this._();

  const HomeState._({
    this.status = StateStatus.initial,
    this.snackbar,
  });

  HomeState copyWith({
    StateStatus? status,
    SnackbarModel? snackbar,
  }) =>
      HomeState._(
        status: status ?? this.status,
        snackbar: snackbar,
      );

  HomeState setToDefault() => const HomeState.initial();

  @override
  List<Object?> get props => [
        status,
        snackbar,
      ];
}
