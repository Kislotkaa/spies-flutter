import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';

class TextButtonWidget extends StatefulWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    this.onTap,
    this.withFeedback = false,
  });

  final Function()? onTap;
  final String text;
  final bool withFeedback;

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  bool _isProcess = false;
  bool _flag = false;
  final Duration _duration = Durations.short2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (_isProcess || widget.onTap == null) return;
        _isProcess = true;
        if (widget.withFeedback) HapticFeedback.mediumImpact();
        setState(() => _flag = true);
        await Future.delayed(_duration);
        widget.onTap?.call();
        setState(() => _flag = false);
        await Future.delayed(_duration);
        _isProcess = false;
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(12.0),
        child: AnimatedScale(
          scale: _flag ? 0.8 : 1,
          duration: _duration,
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
