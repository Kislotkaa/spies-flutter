import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/router/app_router.gr.dart';
import 'package:sample/src/widgets/appbar_widget.dart';
import 'package:sample/src/widgets/button_widget.dart';

@RoutePage()
class CreateGamePage extends StatelessWidget {
  const CreateGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: S.of(context).createGameTitle,
        needClose: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ButtonWidget(
            onTap: () => router.push(const GameRoute()),
            text: S.of(context).createGameCreate,
            withHapticFeedback: true,
          ),
        ],
      ),
    );
  }
}
