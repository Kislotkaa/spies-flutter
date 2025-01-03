part of 'on_client_cubit.dart';

class OnClientState extends Equatable {
  final List<PlayerModel> players;

  const OnClientState({
    this.players = const [],
  });

  OnClientState copyWith({
    List<PlayerModel>? players,
  }) =>
      OnClientState(
        players: players ?? this.players,
      );

  @override
  List<Object?> get props => [players];
}
