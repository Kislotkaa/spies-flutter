import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/router/app_router.gr.dart';
import 'package:sample/src/widgets/appbar_widget.dart';
import 'package:sample/src/widgets/button_widget.dart';

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
          ButtonWidget(
            onTap: () => router.push(const SuggestWordRoute()),
            text: S.of(context).settingsSuggest,
            leftWidget: Assets.icons.faceScreaming.svg(),
          ),
        ],
      ),
    );
  }
}
