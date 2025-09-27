import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/cubits/snackbar_cubit.dart';
import 'package:sample/core/widgets/snackbar_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SnackBarCubit, SnackbarState>(
      listener: (context, state) {
        if (state.snackbarModel != null) {
          if (state.snackbarModel!.withFeedBack) HapticFeedback.heavyImpact();
          SnackbarWidget.showSnackBar(
            title: state.snackbarModel!.title,
            description: state.snackbarModel!.subTitle,
            duration: state.snackbarModel!.duration,
            status: state.snackbarModel!.status,
            button: state.snackbarModel!.button,
            overlayState: Overlay.of(context),
          );
        }
      },
      builder: (context, _) => const AutoRouter(),
    );
  }
}
