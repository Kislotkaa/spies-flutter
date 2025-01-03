import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) return const SizedBox();

        var text = 'v.${data.version} +${data.buildNumber}';

        return Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: appTheme.textTheme.bodySemibold14.copyWith(color: appTheme.textGrayColor),
          ),
        );
      },
    );
  }
}
