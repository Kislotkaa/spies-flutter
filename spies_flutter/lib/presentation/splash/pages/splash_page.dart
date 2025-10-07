import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/src/repositories/user_repository.dart';
import 'package:sample/src/router/app_router.dart';
import 'package:sample/src/router/app_router.gr.dart';
import 'package:sample/src/widgets/progess_indicator_widget.dart';
import 'package:sample/presentation/splash/bloc/splash_bloc.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SplashBloc(
        context.read<UserRepository>(),
      )..add(SplashInitialEvent()),
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashToAuthState) {
          router.replace(const AuthRoute());
        }
        if (state is SplashToMainState) {
          router.replace(const MainRoute());
        }
      },
      child: const Scaffold(
        body: Center(
          child: ProgressIndicatorWidget(),
        ),
      ),
    );
  }
}
