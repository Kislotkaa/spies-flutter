import 'package:flutter/material.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/widgets/logo_widget.dart';

class AuthContentWidget extends StatelessWidget {
  const AuthContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final textTheme = context.textTheme;
    final colorTheme = context.colorTheme;

    return Column(
      children: [
        const LogoWidget(),
        Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 24),
          child: Text(
            locale.appName,
            style: textTheme.extra20.copyWith(
              fontSize: 32,
            ),
          ),
        ),
        Text(
          locale.youAreYours,
          style: textTheme.semi14.copyWith(
            color: colorTheme.textGrayColor,
          ),
        ),
      ],
    );
  }
}
