import 'package:flutter/material.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/widgets/feedback_widget.dart';

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

class _CheckerWidgetState extends State<CheckerWidget> {
  bool isPressed = false;

  @override
  void initState() {
    isPressed = widget.initialActive;
    super.initState();
  }

  void _onPress() {
    setState(() {
      isPressed = !isPressed;
      widget.callBack?.call(isPressed);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;

    return FeedbackWidget(
      isEnabled: widget.callBack != null,
      withHapticFeedback: true,
      child: GestureDetector(
        onTap: _onPress,
        child: AnimatedContainer(
          height: 28,
          width: 55,
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isPressed ? colorTheme.textColor : colorTheme.textGrayColor,
              width: isPressed ? 6 : 3,
            ),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(2),
          duration: Durations.short3,
        ),
      ),
    );
  }
}
