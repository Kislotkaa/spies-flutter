import 'package:flutter/material.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/core/utils/button_animation_mixin.dart';

class TextButtonWidget extends StatefulWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    this.onTap,
    this.onLongTap,
    this.withFeedback = false,
  });

  final Function()? onTap;
  final Function()? onLongTap;
  final String text;
  final bool withFeedback;

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> with ButtonMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressCancel: () => longPressSetState(false, onLongTap: widget.onLongTap, setState: setState),
      onLongPressEnd: (_) => longPressSetState(false, onLongTap: widget.onLongTap, setState: setState),
      onLongPressDown: (_) => longPressSetState(true, onLongTap: widget.onLongTap, setState: setState),
      onLongPressStart: (_) =>
          longPressStart(onLongTap: widget.onLongTap, withFeedback: widget.withFeedback, setState: setState),
      onTap: () => press(
        onTap: widget.onTap,
        withFeedback: widget.withFeedback,
        setState: setState,
      ),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(12.0),
        child: AnimatedScale(
          scale: flag ? 0.8 : 1,
          duration: duration,
          child: Text(
            widget.text,
            style: appTheme.textTheme.bodySemibold14,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
