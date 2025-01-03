import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/core/widgets/button_widget.dart';
import 'package:spies/feature/game/presentation/bloc/game/game_bloc.dart';
import 'package:spies/locator.dart';

class GameButtonHostWidget extends StatelessWidget {
  const GameButtonHostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state.gameInitialParams?.ip != null && state.gameInitialParams?.role == GameRoleEnum.host) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ваш IP: ${state.gameInitialParams?.ip}',
                  style: appTheme.textTheme.bodySemibold20.copyWith(color: appTheme.textGrayColor),
                ),
                ButtonWidget(
                  onTap: () => sl<GameBloc>().add(GameStartEvent()),
                  text: state.currentWord == null ? 'Начать игру' : 'Следующий раунд',
                  height: 80,
                  padding: EdgeInsets.only(bottom: 16, top: 16),
                ),
              ],
            ),
          );
        }
        return const SizedBox.square();
      },
    );
  }
}
