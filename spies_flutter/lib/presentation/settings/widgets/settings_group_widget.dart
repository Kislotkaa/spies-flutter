import 'package:flutter/material.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/core/utils/list_extension.dart';

class SettingsGroupWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsGroupWidget({
    super.key,
    required this.title,
    required this.children,
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
            child: Text(
              title,
              style: textTheme.semi18,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: children.separatedBy(const SizedBox(height: 16)),
          ),
        ],
      ),
    );
  }
}
