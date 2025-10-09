import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/router/app_router.gr.dart';
import 'package:sample/presentation/settings/widgets/settings_group_widget.dart';
import 'package:sample/presentation/settings/widgets/settings_item_widget.dart';
import 'package:sample/src/cubits/theme_cubit.dart';
import 'package:sample/src/widgets/appbar_widget.dart';
import 'package:sample/src/widgets/button_widget.dart';
import 'package:sample/src/widgets/switcher_widget.dart';
import 'package:sample/src/widgets/version_widget.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: S.of(context).settingsTitle,
        needClose: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SettingsGroupWidget(
            title: 'Основные',
            children: [
              ButtonWidget(
                onTap: () => router.push(const SuggestWordRoute()),
                text: S.of(context).settingsSuggest,
                leftWidget: Assets.icons.faceScreaming.svg(),
                withHapticFeedback: true,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ],
          ),
          SettingsGroupWidget(
            title: 'Дополнительные',
            children: [
              SettingsItemWidget(
                title: 'Тёмная тема',
                icon: Assets.icons.moon,
                onTap: () {},
                action: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
                  return SwitcherWidget(
                    initialActive: state.isDarkMode,
                    callBack: (_) => context.read<ThemeCubit>().switchTheme(),
                  );
                }),
              ),
              SettingsItemWidget(
                title: 'Правила игры',
                icon: Assets.icons.informationSquare,
                onTap: () {},
              ),
              SettingsItemWidget(
                title: 'Политика конфинденциальности',
                icon: Assets.icons.notebook,
                onTap: () {},
              ),
            ],
          ),
          SettingsGroupWidget(
            title: 'Аккаунт',
            children: [
              SettingsItemWidget(
                title: 'Удалить аккаунт',
                icon: Assets.icons.cancel,
                onTap: () {},
              ),
              const VersionWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
