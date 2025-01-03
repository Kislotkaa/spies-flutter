import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spies/core/router/app_router.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/core/widgets/app_snackbar.dart';
import 'package:spies/core/widgets/button_widget.dart';
import 'package:spies/core/widgets/text_field_widget.dart';
import 'package:spies/feature/game/presentation/bloc/game/game_bloc.dart';
import 'package:spies/locator.dart';

@RoutePage()
class SuggestWordPage extends StatefulWidget {
  const SuggestWordPage({super.key});

  @override
  State<SuggestWordPage> createState() => _SuggestWordPageState();
}

class _SuggestWordPageState extends State<SuggestWordPage> {
  final TextEditingController word = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: appTheme.revertBasicColor.withOpacity(0.2),
              blurRadius: 32,
              spreadRadius: 0,
              offset: Offset(0, 8),
            ),
          ],
          color: appTheme.basicColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Загадайте вашего персонажа',
                    style: appTheme.textTheme.bodyExtrabold20,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Имя персонажа не должно быть пустым',
                      style: appTheme.textTheme.bodySemibold16.copyWith(color: appTheme.textGrayColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              TextFieldWidget(
                hintText: 'Персонаж',
                controller: word,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                onTap: () {
                  router.removeLast();
                  if (word.text.isEmpty) {
                    AppSnackbar.showSnackBar(
                      title: 'Я не вижу персонажа',
                      description: 'Имя персонажа должно быть > 1 буквы',
                      overlayState: Overlay.of(context),
                      status: SnackStatusEnum.warning,
                    );
                  }
                  sl<GameBloc>().add(GameSuggestWordEvent(word: word.text));
                },
                text: 'Предложить',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
