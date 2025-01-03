import 'package:spies/feature/game/presentation/bloc/game/game_bloc.dart';

class GameInitialParams {
  final String ip;
  final GameRoleEnum role;
  final String myName;

  GameInitialParams({required this.ip, required this.role, required this.myName});
}
