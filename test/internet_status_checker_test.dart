import 'package:flutter_test/flutter_test.dart';
import 'package:internet_status_checker/internet_status_checker.dart';
import 'package:internet_status_checker/internet_status_checker_platform_interface.dart';
import 'package:internet_status_checker/internet_status_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInternetStatusCheckerPlatform
    with MockPlatformInterfaceMixin
    implements InternetStatusCheckerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InternetStatusCheckerPlatform initialPlatform = InternetStatusCheckerPlatform.instance;

  test('$MethodChannelInternetStatusChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInternetStatusChecker>());
  });

  test('getPlatformVersion', () async {
    InternetStatusChecker internetStatusCheckerPlugin = InternetStatusChecker();
    MockInternetStatusCheckerPlatform fakePlatform = MockInternetStatusCheckerPlatform();
    InternetStatusCheckerPlatform.instance = fakePlatform;

    expect(await internetStatusCheckerPlugin.getPlatformVersion(), '42');
  });
}
