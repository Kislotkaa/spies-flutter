import 'package:flutter/material.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/core/utils/list_extension.dart';
import 'package:sample/src/widgets/progess_indicator_widget.dart';

class SettingsGroupWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool isLoading;

  const SettingsGroupWidget({
    super.key,
    required this.title,
    required this.children,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Text(
                  title,
                  style: textTheme.semi18,
                ),
                if (isLoading)
                  const ProgressIndicatorWidget(
                    padding: EdgeInsets.only(left: 12),
                  ),
              ],
            ),
          ),
          if (!isLoading)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: children.separatedBy(const SizedBox(height: 16)),
            ),
        ],
      ),
    );
  }
}
