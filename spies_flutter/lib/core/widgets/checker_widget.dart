import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:sample/core/utils/button_animation_mixin.dart';

class CheckerWidget extends StatefulWidget {
  const CheckerWidget({
    super.key,
    this.initialActive = false,
    this.callBack,
  });

  final bool initialActive;
  final Function(bool isActive)? callBack;

  @override
  State<CheckerWidget> createState() => _CheckerWidgetState();
}

class _CheckerWidgetState extends State<CheckerWidget> with ButtonMixin {
  @override
  void initState() {
    isPressed = widget.initialActive;
    duration = Durations.short3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<ThemeCubit>().appTheme;

    return GestureDetector(
      onTap: () => pressSwitch(
        callBack: () => widget.callBack?.call(isPressed),
        setState: setState,
        withFeedback: true,
      ),
      child: AnimatedContainer(
        height: 28,
        width: 55,
        decoration: BoxDecoration(
          border: Border.all(
            color: isPressed ? appTheme.textColor : appTheme.textGrayColor,
            width: isPressed ? 6 : 3,
          ),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(2),
        duration: duration,
      ),
    );
  }
}
