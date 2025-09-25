import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class DeviceExtension {
  static String appVersion = '';
  static String deviceUuid = '';

  static init() async {
    final dataYaml = await rootBundle.loadString("pubspec.yaml");
    final yaml = loadYaml(dataYaml);
    appVersion = yaml["version"];

    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      deviceUuid = iosDeviceInfo.identifierForVendor ?? '';
    } else {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      deviceUuid = androidDeviceInfo.id;
    }
  }
}
