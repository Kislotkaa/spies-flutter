import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/widgets/progess_indicator_widget.dart';
import 'package:sample/feature/splash/presentation/bloc/splash_bloc.dart';
import 'package:sample/locator.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SplashBloc(
        sl(),
      )..add(SplashInitialEvent()),
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ProgressIndicatorWidget(),
      ),
    );
  }
}
