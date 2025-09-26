import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/utils/env_config.dart';
import 'package:sample/core/widgets/button_widget.dart';
import 'package:sample/core/widgets/text_field_widget.dart';
import 'package:sample/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AuthFormWidget extends StatelessWidget {
  const AuthFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => current is AuthUpdatedState,
      builder: (context, state) {
        if (state is AuthUpdatedState) {
          return Column(
            children: [
              TextFieldWidget(
                titleText: 'Никнейм',
                titleCenter: true,
                initialValue: state.name,
                prefixIcon: IconButton(
                  onPressed: () => bloc.add(AuthClearNameEvent()),
                  icon: Assets.icons.userSquare.svg(),
                ),
                suffixIcon: IconButton(
                  onPressed: () => bloc.add(AuthClearNameEvent()),
                  icon: Assets.icons.clear.svg(),
                ),
                onChanged: (value) => bloc.add(AuthInputEvent(value)),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                  FilteringTextInputFormatter.allow(RegExp(r'[\w]')),
                ],
                validator: (value) {
                  if (value == null || value.length < 2) {
                    return 'Длина должна быть не меньше 2-х символов';
                  }
                  return null;
                },
              ),
              ButtonWidget(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                onTap: () => bloc.add(AuthSignInEvent()),
                text: 'Войти',
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => launchUrlString(EnvConfig.POLIT_URL),
                  children: [
                    TextSpan(
                      text: 'Войдя, вы соглашаетесь с настоящей ',
                      style: appTheme.textTheme.bodySemibold12,
                    ),
                    TextSpan(
                      text: 'политикой конфиденциальности.',
                      style: appTheme.textTheme.bodySemibold12.copyWith(
                        color: appTheme.blueColor,
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
