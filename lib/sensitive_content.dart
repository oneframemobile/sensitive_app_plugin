import 'dart:async';

import 'package:flutter/services.dart';

class SensitiveContent {
  static const MethodChannel _channel = const MethodChannel('sensitive_content');

  static Future hide() async {
    var result = await _channel.invokeMethod('hide');
    print("$result");
  }

  static Future show() async {
    var result = await _channel.invokeMethod('show');
    print("$result");
  }
}
