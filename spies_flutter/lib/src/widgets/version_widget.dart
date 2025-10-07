import 'package:flutter/material.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/core/utils/device_extension.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        DeviceExtension.appVersion,
        style: context.textTheme.semi14.copyWith(
          color: context.colorTheme.textGrayColor,
        ),
      ),
    );
  }
}
