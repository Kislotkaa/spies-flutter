import 'package:flutter/material.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:sample/core/widgets/icon_button_widget.dart';

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
    return AppBar(
      elevation: 0.0,
      titleSpacing: 20,
      leading: leadingWidget ??
          (needClose
              ? Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButtonWidget(
                    onTap: () => router.removeLast(),
                    icon: Assets.icons.arrowLeft,
                    withFeedback: true,
                  ),
                )
              : null),
      centerTitle: false,
      title: Text(
        title,
        style: appTheme.textTheme.bodySemibold20,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Row(children: actions),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
