import 'package:flutter/material.dart';
import 'package:sample/core/cubits/theme_cubit.dart';

class SliverAppBarWidget extends StatelessWidget {
  final String? title;
  final bool pinned;
  final bool withBlur;
  final List<Widget> actions;
  final Widget? leadingWidget;

  const SliverAppBarWidget({
    this.title,
    this.pinned = true,
    this.withBlur = true,
    this.actions = const [],
    this.leadingWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sliverAppBar = SliverAppBar(
      pinned: pinned,
      leading: leadingWidget,
      title: Text(
        title!,
        style: appTheme.textTheme.bodyExtrabold20,
      ),
      actions: actions,
    );

    return sliverAppBar;
  }
}
