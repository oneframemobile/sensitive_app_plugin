import 'dart:async';

import 'package:flutter/services.dart';

class SensitiveContent {
  static const MethodChannel _channel = const MethodChannel('sensitive_content');

  static Future hide() async {
    String result = await _channel.invokeMethod('hide');
    var emre = 5;
  }
}
