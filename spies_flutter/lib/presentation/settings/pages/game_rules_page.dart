import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/core/utils/list_extension.dart';
import 'package:sample/src/widgets/appbar_widget.dart';
import 'package:sample/src/widgets/button_widget.dart';

@RoutePage()
class GameRulesPage extends StatelessWidget {
  const GameRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Scaffold(
      appBar: AppBarWidget(
        title: locale.gameRulesTitle,
        needClose: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _GameRulesGroupWidget(
            title: locale.gameRulesStartGame,
            children: [
              _GameRulesItemWidget(locale.gameRulesStartGame1),
              _GameRulesItemWidget(locale.gameRulesStartGame2),
              _GameRulesItemWidget(locale.gameRulesStartGame3),
            ],
          ),
          _GameRulesGroupWidget(
            title: locale.gameRulesProcessGame,
            children: [
              _GameRulesItemWidget(locale.gameRulesProcessGame1),
              _GameRulesItemWidget(locale.gameRulesProcessGame2),
            ],
          ),
          _GameRulesGroupWidget(
            title: locale.gameRulesEndGame,
            children: [
              _GameRulesItemWidget(locale.gameRulesEndGame1),
              _GameRulesItemWidget(locale.gameRulesEndGame2),
            ],
          ),
          ButtonWidget(
            onTap: router.maybePopTop,
            text: locale.gameRulesConfirm,
          ),
        ],
      ),
    );
  }
}

class _GameRulesGroupWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _GameRulesGroupWidget({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              title,
              style: textTheme.extra20,
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: children.separatedBy(const SizedBox(height: 12)),
          )
        ],
      ),
    );
  }
}

class _GameRulesItemWidget extends StatelessWidget {
  final String text;

  const _GameRulesItemWidget(this.text);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Text(
      text,
      style: textTheme.semi16.copyWith(fontWeight: FontWeight.w400),
      textAlign: TextAlign.center,
    );
  }
}
