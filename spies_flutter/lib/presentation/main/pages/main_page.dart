import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/cubits/theme_cubit.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/src/widgets/animated_column_widget.dart';
import 'package:sample/src/widgets/appbar_widget.dart';
import 'package:sample/src/widgets/button_widget.dart';
import 'package:sample/src/widgets/checker_widget.dart';
import 'package:sample/src/widgets/icon_button_widget.dart';
import 'package:sample/src/widgets/progess_indicator_widget.dart';
import 'package:sample/src/widgets/snackbar_widget.dart';
import 'package:sample/src/widgets/switcher_widget.dart';
import 'package:sample/src/widgets/text_button_widget.dart';
import 'package:sample/src/widgets/text_field_widget.dart';
import 'package:sample/src/widgets/version_widget.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Main Screen',
        actions: [
          IconWidget(
            icon: Assets.icons.edit,
            padding: const EdgeInsets.all(16),
            onTap: () {
              log('onTap');
            },
          ),
          IconWidget(
            icon: Assets.icons.setting,
            padding: const EdgeInsets.all(16),
            onTap: () {
              log('onTap');
            },
          ),
          TextButtonWidget(
            text: 'Готово',
            onTap: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: AnimatedColumnWidget(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              S.of(context).somethingWentWrong,
              style: context.textTheme.semi16,
            ),
            CheckerWidget(
              callBack: (isActive) {
                log('callBack: $isActive');
              },
              initialActive: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return SwitcherWidget(
                      callBack: (isActive) => context.read<ThemeCubit>().switchTheme(),
                      initialActive: state.isDarkMode,
                    );
                  },
                ),
              ],
            ),
            IconWidget(
              icon: Assets.icons.call,
              onTap: () {
                log('onTap');
              },
            ),
            ButtonWidget(
              onTap: () {
                log('onTap');
              },
              text: 'Click',
              state: ButtonStateEnum.outline,
            ),
            TextFieldWidget(
              errorText: 'Имя не верное',
              titleText: 'Имя пользователя',
              hintText: 'Введите имя...',
              maxLines: 1,
              prefixIcon: IconWidget(
                icon: Assets.icons.userSquare,
                onTap: () {
                  log('onTap');
                },
              ),
              suffixIcon: IconWidget(
                icon: Assets.icons.cancelLine,
                onTap: () {
                  log('onTap');
                },
              ),
            ),
            ButtonWidget(
              onTap: () {
                log('onTap');
              },
              text: 'Click',
              isChips: true,
              state: ButtonStateEnum.fill,
            ),
            TextButtonWidget(
              text: 'Show snackbar',
              onTap: () {
                SnackbarWidget.show(
                  title: 'title',
                  subTitle: 'description',
                  status: SnackbarStatus.info,
                  duration: const Duration(seconds: 60),
                  button: SnackbarButtonModel(
                    onTap: () {
                      log('onTap');
                    },
                    text: 'Ok',
                  ),
                  overlayState: Overlay.of(context),
                );
                log('onTap');
              },
            ),
            IconWidget(
              onTap: () {
                log('onTap');
              },
              icon: Assets.icons.call,
            ),
            const Column(
              children: [
                ProgressIndicatorWidget(),
              ],
            ),
            const ProgressIndicatorWidget(
              state: ProgressIndicatorEnum.linear,
            ),
            ProgressIndicatorWidget(
              state: ProgressIndicatorEnum.shimmer,
              shimmerChild: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const VersionWidget(),
          ],
        ),
      ),
    );
  }
}
