import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spies/core/constants/enums.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState.initial()) {
    on<SettingsInitEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            status: StateStatus.success,
          ),
        );
      },
    );
  }
}
