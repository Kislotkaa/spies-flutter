part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object?> get props => [];
}

class GameInitEvent extends GameEvent {
  final GameInitialParams params;
  const GameInitEvent(this.params);
}

class GameStopEvent extends GameEvent {
  const GameStopEvent();
}

class GameKickedFromServerEvent extends GameEvent {
  const GameKickedFromServerEvent();
}

class GameNewRoundEvent extends GameEvent {
  final String? word;
  const GameNewRoundEvent({this.word});
}

class GameOnSuggestWordEvent extends GameEvent {
  final int? port;
  final String? word;
  const GameOnSuggestWordEvent({
    required this.port,
    required this.word,
  });
}

class GameSuggestWordEvent extends GameEvent {
  final String? word;
  const GameSuggestWordEvent({
    required this.word,
  });
}

class GameStartEvent extends GameEvent {
  final SuggestModel? sugest;
  const GameStartEvent({this.sugest});
}
