import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spies/core/gen/assets.gen.dart';
import 'package:spies/core/router/app_router.dart';
import 'package:spies/core/router/app_router.gr.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/core/widgets/app_snackbar.dart';
import 'package:spies/core/widgets/appbar_widget.dart';
import 'package:spies/core/widgets/icon_widget.dart';
import 'package:spies/feature/game/presentation/bloc/game/game_bloc.dart';
import 'package:spies/feature/game/presentation/widgets/game_button_host_widget.dart';
import 'package:spies/feature/game/presentation/widgets/game_logo_appbar_widget.dart';
import 'package:spies/feature/game/presentation/widgets/game_word_widget.dart';
import 'package:spies/locator.dart';

@RoutePage()
class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listener: (context, state) {
        if (state.snackbar != null) {
          HapticFeedback.heavyImpact();
          AppSnackbar.showSnackBar(
            title: state.snackbar!.title,
            description: state.snackbar!.description,
            duration: state.snackbar!.duration,
            status: state.snackbar!.status,
            onTap: state.snackbar!.onTap,
            overlayState: Overlay.of(context),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWidget(
            title: 'Игра',
            leadingWidget: GameLogoAppBarWidget(),
            actions: [
              IconButtonWidget(
                icon: Assets.icons.cancel,
                iconColor: appTheme.redColor,
                withFeedback: true,
                padding: EdgeInsets.all(16),
                onTap: () => sl<GameBloc>().add(GameStopEvent()),
              ),
              if (state.gameInitialParams?.role == GameRoleEnum.client)
                IconButtonWidget(
                  icon: Assets.icons.edit,
                  padding: EdgeInsets.all(16),
                  onTap: () => router.push(SuggestWordRoute()),
                ),
            ],
          ),
          body: SafeArea(
            minimum: EdgeInsets.all(20),
            child: Stack(
              children: [
                const GameWordWidget(),
                const GameButtonHostWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
