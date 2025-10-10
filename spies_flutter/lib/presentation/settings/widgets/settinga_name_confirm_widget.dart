import 'package:flutter/widgets.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/widgets/feedback_widget.dart';
import 'package:sample/src/widgets/progess_indicator_widget.dart';

class SettingsNameConfirmWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isLoading;

  const SettingsNameConfirmWidget({
    super.key,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;

    return FeedbackWidget(
      withHapticFeedback: true,
      child: GestureDetector(
        onTap: () => isLoading ? null : onTap?.call(),
        child: Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(left: 8, top: 16),
          decoration: BoxDecoration(
            color: colorTheme.primaryColor,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Center(
            child: isLoading
                ? const ProgressIndicatorWidget()
                : Assets.icons.tick.svg(
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      colorTheme.greenColor,
                      BlendMode.srcIn,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
