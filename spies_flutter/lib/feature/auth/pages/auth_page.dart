import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/repositories/user_repository.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/router/app_router.gr.dart';
import 'package:sample/core/widgets/snackbar_widget.dart';
import 'package:sample/feature/auth/bloc/auth_bloc.dart';
import 'package:sample/feature/auth/pages/auth_form_widget.dart';
import 'package:sample/feature/auth/widgets/auth_content_widget.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        context.read<UserRepository>(),
      )..add(AuthInitialEvent()),
      child: const _AuthView(),
    );
  }
}

class _AuthView extends StatelessWidget {
  const _AuthView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) router.replace(const MainRoute());
          if (state is AuthNameValidationFailedState) {
            SnackbarWidget.show(
              title: state.title,
              subTitle: state.subTitle,
              status: SnackbarStatus.warning,
              overlayState: Overlay.of(context),
            );
          }
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Spacer(flex: 1),
                  AuthContentWidget(),
                  Spacer(flex: 2),
                  AuthFormWidget(),
                  Spacer(flex: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
