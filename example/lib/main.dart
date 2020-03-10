import 'package:flutter/material.dart';
import 'package:sensitive_content/sensitive.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Page(),
      ),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SensitiveView(
      child: Center(
        child: RaisedButton(
          child: Text('Running on'),
          onPressed: () {},
        ),
      ),
    );
  }
}
