part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final StateStatus status;

  const SettingsState.initial() : this._();

  const SettingsState._({
    this.status = StateStatus.initial,
  });

  SettingsState copyWith({
    StateStatus? status,
  }) =>
      SettingsState._(
        status: status ?? this.status,
      );

  SettingsState setToDefault() => const SettingsState.initial();

  @override
  List<Object?> get props => [status];
}
