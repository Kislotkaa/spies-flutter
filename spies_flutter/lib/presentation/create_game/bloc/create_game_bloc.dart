import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_game_event.dart';
part 'create_game_state.dart';

class CreateGameBloc extends Bloc<CreateGameEvent, CreateGameState> {
  CreateGameBloc() : super(CreateGameInitialState()) {
    on<CreateGameInitialEvent>(_init);
  }

  FutureOr<void> _init(CreateGameInitialEvent event, emit) {}
}
