import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/src/widgets/appbar_widget.dart';
import 'package:sample/src/widgets/icon_widget.dart';

@RoutePage()
class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: S.of(context).gameTitle,
        actions: [
          IconWidget(
            icon: Assets.icons.login,
            onTap: router.maybePopTop,
          ),
        ],
        leadingWidget: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconWidget(
            icon: Assets.icons.logo,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [],
      ),
    );
  }
}
