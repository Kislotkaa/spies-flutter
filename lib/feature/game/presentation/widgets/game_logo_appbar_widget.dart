import 'package:flutter/material.dart';
import 'package:spies/core/gen/assets.gen.dart';
import 'package:spies/core/widgets/app_snackbar.dart';
import 'package:spies/core/widgets/icon_widget.dart';
import 'package:spies/feature/game/presentation/bloc/game/game_bloc.dart';
import 'package:spies/feature/game/presentation/bloc/on_client/on_client_cubit.dart';
import 'package:spies/locator.dart';

class GameLogoAppBarWidget extends StatelessWidget {
  const GameLogoAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo_spies',
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: IconButtonWidget(
          icon: Assets.icons.logo,
          iconSize: 36,
          onTap: () {
            if (sl<GameBloc>().state.gameInitialParams?.role != GameRoleEnum.host) return;
            final players = sl<OnClientCubit>().state.players;
            final playerCount = players.length;
            List<String> playerList = [];
            for (final player in players) {
              if (player.name?.isNotEmpty == true) playerList.add(player.name ?? '');
            }
            final playerString = playerList.join('\n');

            AppSnackbar.showSnackBar(
              title: 'Количество игроков: $playerCount',
              description: playerString,
              overlayState: Overlay.of(context),
              status: SnackStatusEnum.normal,
            );
          },
          withFeedback: true,
        ),
      ),
    );
  }
}
