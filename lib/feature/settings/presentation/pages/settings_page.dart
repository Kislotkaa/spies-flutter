import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spies/core/constants/constants.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/core/widgets/appbar_widget.dart';
import 'package:spies/core/widgets/button_widget.dart';
import 'package:spies/core/widgets/list_view_widget.dart';
import 'package:spies/locator.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Настройки',
        needClose: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: ListViewWidget(
          elementPadding: EdgeInsets.only(bottom: 16),
          children: [
            Text('Основные', style: appTheme.textTheme.bodySemibold18),
            ButtonWidget(
              onTap: () => launchUrl(Uri.parse(politUrl)),
              text: 'Политика',
              baseButtonEnum: BaseButtonEnum.outline,
            ),
            ButtonWidget(
              onTap: () => sl<ThemeCubit>().switchTheme(),
              text: sl<ThemeCubit>().state.isDarkMode ? 'Тёмная тема' : 'Светлая тема',
              baseButtonEnum: BaseButtonEnum.outline,
            )
          ],
        ),
      ),
    );
  }
}
