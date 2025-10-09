import 'package:flutter/material.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/widgets/icon_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final Widget? leadingWidget;
  final bool needClose;

  const AppBarWidget({
    super.key,
    required this.title,
    this.actions = const [],
    this.leadingWidget,
    this.needClose = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorTheme = context.colorTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          elevation: 0.0,
          titleSpacing: 20,
          leading: leadingWidget ??
              (needClose
                  ? IconWidget(
                      onTap: router.maybePopTop,
                      icon: Assets.icons.arrowLeft,
                      padding: const EdgeInsets.only(left: 12),
                    )
                  : null),
          centerTitle: false,
          title: Text(
            title,
            style: textTheme.semi20,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(children: actions),
            ),
          ],
        ),
        Container(
          height: 1,
          color: colorTheme.cardColor,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
