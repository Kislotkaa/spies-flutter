part of 'game_bloc.dart';

enum GameStatusEnum { initial, process, end }

enum GameRoleEnum { client, host, none }

class GameState extends Equatable {
  final StateStatus status;
  final GameStatusEnum gameStatus;
  final GameInitialParams? gameInitialParams;
  final String? currentWord;
  final SnackbarModel? snackbar;

  const GameState.initial() : this._();

  const GameState._({
    this.status = StateStatus.initial,
    this.gameStatus = GameStatusEnum.initial,
    this.gameInitialParams,
    this.currentWord,
    this.snackbar,
  });

  GameState copyWith({
    StateStatus? status,
    GameStatusEnum? gameStatus,
    GameInitialParams? gameInitialParams,
    String? currentWord,
    SnackbarModel? snackbar,
  }) =>
      GameState._(
        status: status ?? this.status,
        gameStatus: gameStatus ?? this.gameStatus,
        gameInitialParams: gameInitialParams,
        currentWord: currentWord,
        snackbar: snackbar,
      );

  GameState setToDefault() => const GameState.initial();

  @override
  List<Object?> get props => [
        status,
        gameStatus,
        gameInitialParams,
        currentWord,
        snackbar,
      ];
}
