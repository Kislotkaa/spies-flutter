import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spies/core/constants/duration.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/feature/game/presentation/bloc/game/game_bloc.dart';
import 'package:spies/feature/game/presentation/widgets/game_animation_finger_widget.dart';

class GameWordWidget extends StatefulWidget {
  const GameWordWidget({
    super.key,
  });

  @override
  State<GameWordWidget> createState() => _GameWordWidgetState();
}

class _GameWordWidgetState extends State<GameWordWidget> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  final Duration _duration = AppDuration.medium;

  void setOpen(bool isOpen) {
    setState(() {
      this.isOpen = isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state.gameStatus == GameStatusEnum.initial && state.gameInitialParams?.role == GameRoleEnum.client) {
          return Center(
            child: Text(
              'Ожидание ведущего',
              textAlign: TextAlign.center,
              style: appTheme.textTheme.bodySemibold20,
            ),
          );
        }

        if (state.gameStatus == GameStatusEnum.initial && state.gameInitialParams?.role == GameRoleEnum.host) {
          return Center(
            child: Text(
              'Начните игру',
              textAlign: TextAlign.center,
              style: appTheme.textTheme.bodySemibold20,
            ),
          );
        }

        if (state.gameStatus == GameStatusEnum.end) {
          return Center(
            child: Text(
              'Игра окончена, расходимя',
              textAlign: TextAlign.center,
              style: appTheme.textTheme.bodySemibold20,
            ),
          );
        }
        return GestureDetector(
          onTapDown: (_) => setOpen(true),
          onTapUp: (_) => setOpen(false),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent,
            child: IgnorePointer(
              child: Stack(
                children: [
                  GameAnimationFingerWidget(),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: MediaQuery.of(context).size.height * 0.2,
                    top: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Жмак',
                          style: appTheme.textTheme.bodySemibold20.copyWith(),
                        ),
                        AnimatedContainer(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 16),
                          // padding: EdgeInsets.symmetric(vertical: 16),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            color: isOpen ? Colors.transparent : appTheme.textColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          duration: _duration,
                          child: Text(
                            state.currentWord ?? 'Word',
                            textAlign: TextAlign.center,
                            style: appTheme.textTheme.bodySemibold20.copyWith(
                              color: appTheme.textColor.withOpacity(0.3),
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
