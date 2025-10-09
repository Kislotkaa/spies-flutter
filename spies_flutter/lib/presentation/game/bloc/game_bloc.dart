import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitialState()) {
    on<GameInitialEvent>(_init);
  }

  FutureOr<void> _init(GameInitialEvent event, emit) {}
}
