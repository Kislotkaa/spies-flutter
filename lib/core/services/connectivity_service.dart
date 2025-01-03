import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final _connectivity = Connectivity();
  Stream<List<ConnectivityResult>> get stream => _connectivity.onConnectivityChanged;

  bool isWifiAvailable(List<ConnectivityResult> list) {
    if (list.contains(ConnectivityResult.wifi)) return true;

    return false;
  }
}
