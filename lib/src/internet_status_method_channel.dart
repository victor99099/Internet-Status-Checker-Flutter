import 'package:flutter/services.dart';

class InternetStatusChecker {
  static const MethodChannel _channel =
      MethodChannel('internet_status_checker');

  /// Returns true only when the device has actual validated internet access.
  static Future<bool> isConnected() async {
    try {
      final bool result = await _channel.invokeMethod('isConnected');
      return result;
    } catch (_) {
      return false;
    }
  }
}
