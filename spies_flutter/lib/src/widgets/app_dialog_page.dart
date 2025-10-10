import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/core/models/dialog_model.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/widgets/button_widget.dart';

@RoutePage()
class AppDialogPage extends StatelessWidget {
  final DialogModel model;

  const AppDialogPage(
    this.model, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;
    final textTheme = context.textTheme;

    return Dialog(
      elevation: 0,
      backgroundColor: colorTheme.basicColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      insetPadding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (model.title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  model.title!,
                  style: textTheme.semi20,
                ),
              ),
            if (model.subTitle != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  model.subTitle!,
                  style: textTheme.semi14
                      .copyWith(color: colorTheme.textGrayColor),
                ),
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: model.children,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: model.buttons
                  .map(
                    (e) => ButtonWidget(
                      onTap: () {
                        router.maybePopTop();
                        e.onTap?.call();
                      },
                      text: e.title,
                      padding: e.padding ?? EdgeInsets.zero,
                      state: e.state ?? ButtonStateEnum.fill,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
