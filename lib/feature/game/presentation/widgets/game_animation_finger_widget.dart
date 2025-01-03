import 'package:flutter/material.dart';
import 'package:spies/core/constants/duration.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';

class GameAnimationFingerWidget extends StatefulWidget {
  const GameAnimationFingerWidget({super.key});

  @override
  State<GameAnimationFingerWidget> createState() => _GameAnimationFingerWidgetState();
}

class _GameAnimationFingerWidgetState extends State<GameAnimationFingerWidget> with SingleTickerProviderStateMixin {
  Tween<double> tween = Tween(begin: 0.1, end: 1);
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: AppDuration.verySlooow,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1.2).animate(_controller)..addListener(() => setState(() {}));
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.2,
      right: MediaQuery.of(context).size.width * 0.1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 4 * _animation.value, color: appTheme.textColor),
            ),
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 4 * _animation.value, color: appTheme.textColor),
            ),
          ),
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 4 * _animation.value, color: appTheme.textColor),
            ),
          ),
        ],
      ),
    );
  }
}
