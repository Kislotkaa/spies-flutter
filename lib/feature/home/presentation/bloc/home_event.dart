part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeCreateGameEvent extends HomeEvent {
  const HomeCreateGameEvent();
}

class HomeConnectGameEvent extends HomeEvent {
  final String playerName;
  final String ip;

  const HomeConnectGameEvent({required this.playerName, required this.ip});
}

class HomeWhereIsConnectEvent extends HomeEvent {
  const HomeWhereIsConnectEvent();
}
