import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/models/dialog_model.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/router/app_router.gr.dart';
import 'package:sample/src/widgets/appbar_widget.dart';
import 'package:sample/src/widgets/button_widget.dart';
import 'package:sample/src/widgets/icon_widget.dart';
import 'package:sample/src/widgets/logo_widget.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: S.of(context).mainTitle,
        actions: [
          IconWidget(
            icon: Assets.icons.setting,
            onTap: () => router.push(const SettingsRoute()),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            const LogoWidget(),
            const Spacer(flex: 2),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ButtonWidget(
                  onTap: () => router.push(const CreateGameRoute()),
                  text: S.of(context).mainCreateGame,
                  padding: const EdgeInsets.only(bottom: 16),
                  withHapticFeedback: true,
                ),
                ButtonWidget(
                  onTap: () => router.push(
                    AppDialogRoute(
                      model: DialogModel(
                        title: 'Подключиться',
                        subTitle: 'Введите код комнаты',
                        children: [],
                        buttons: [
                          DialogButtonModel(
                            title: S.of(context).mainConnectGame,
                            onTap: () {},
                            padding: const EdgeInsets.only(bottom: 16),
                          ),
                          DialogButtonModel(
                            title: S.of(context).cancel,
                            padding: const EdgeInsets.only(bottom: 16),
                            state: ButtonStateEnum.outline,
                          ),
                        ],
                      ),
                    ),
                  ),
                  text: S.of(context).mainConnectGame,
                  state: ButtonStateEnum.outline,
                  withHapticFeedback: true,
                ),
              ],
            ),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
