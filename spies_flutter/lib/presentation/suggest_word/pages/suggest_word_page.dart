import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/src/widgets/appbar_widget.dart';

@RoutePage()
class SuggestWordPage extends StatelessWidget {
  const SuggestWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: S.of(context).settingsSuggestWord,
        needClose: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [],
      ),
    );
  }
}
