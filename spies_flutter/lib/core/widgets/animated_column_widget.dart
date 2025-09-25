import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedColumnWidget extends StatelessWidget {
  const AnimatedColumnWidget({
    super.key,
    required this.children,
    this.padding,
  });
  final EdgeInsets? padding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        children: AnimateList(
          interval: 50.ms,
          effects: [
            const FadeEffect(),
            const MoveEffect(begin: Offset(50, 0)),
          ],
          children: children,
        ),
      ),
    );
  }
}
