import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_status_checker/internet_status_checker_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelInternetStatusChecker platform = MethodChannelInternetStatusChecker();
  const MethodChannel channel = MethodChannel('internet_status_checker');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
