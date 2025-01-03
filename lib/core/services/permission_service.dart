import 'dart:developer';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';

class PermissionService {
  Future<void> init() async {
    await requestTrackingTransparency();
    await requestPermissonLocalNetwork();
  }

  Future<void> requestTrackingTransparency() async {
    await AppTrackingTransparency.requestTrackingAuthorization();
  }

  Future<void> requestPermissonLocalNetwork() async {
    try {
      await HttpClient().getUrl(Uri.parse('http://192.168.1.1/'));
    } catch (e) {
      log('error: $e');
    }
  }
}
