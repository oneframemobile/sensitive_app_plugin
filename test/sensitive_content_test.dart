import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sensitive_content/sensitive_content.dart';

void main() {
  const MethodChannel channel = MethodChannel('sensitive_content');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
//    expect(await SensitiveContent.platformVersion, '42');
  });
}
