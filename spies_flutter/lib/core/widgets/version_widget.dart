import 'package:flutter/material.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:sample/core/utils/device_extension.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        DeviceExtension.appVersion,
        style: appTheme.textTheme.bodySemibold14.copyWith(
          color: appTheme.textGrayColor,
        ),
      ),
    );
  }
}
