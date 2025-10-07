import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/utils/constants.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/presentation/auth/bloc/auth_bloc.dart';
import 'package:sample/src/widgets/button_widget.dart';
import 'package:sample/src/widgets/icon_button_widget.dart';
import 'package:sample/src/widgets/text_field_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AuthFormWidget extends StatelessWidget {
  const AuthFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    final locale = S.of(context);
    final textTheme = context.textTheme;
    final colorTheme = context.colorTheme;

    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => current is AuthUpdatedState,
      builder: (context, state) {
        if (state is AuthUpdatedState) {
          return Column(
            children: [
              TextFieldWidget(
                titleText: locale.name,
                titleCenter: true,
                controller: state.nameController,
                prefixIcon: IconWidget(
                  icon: Assets.icons.userSquare,
                ),
                suffixIcon: BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) => current is AuthSuffixShownState,
                  builder: (context, state) {
                    if (state is AuthSuffixShownState && state.isShownSuffix) {
                      return IconButton(
                        onPressed: () => bloc.add(AuthOnClearNameEvent()),
                        icon: Assets.icons.clear.svg(),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                onChanged: (value) => bloc.add(AuthOnInputNameEvent()),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                  FilteringTextInputFormatter.allow(RegExp(r'[\p{L}\p{N}_]', unicode: true)),
                ],
                validator: (value) {
                  if (value == null || value.length < 2) {
                    return locale.nameNotValid;
                  }
                  return null;
                },
              ),
              ButtonWidget(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                onTap: () => bloc.add(AuthSignInEvent()),
                text: locale.enter,
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => launchUrlString(Constants.politUrl),
                  children: [
                    TextSpan(
                      text: locale.politPart1,
                      style: textTheme.semi12,
                    ),
                    TextSpan(
                      text: locale.politPart2,
                      style: textTheme.semi12.copyWith(
                        color: colorTheme.blueColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
