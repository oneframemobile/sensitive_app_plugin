import 'package:flutter/material.dart';
import 'package:sensitive_content/sensitive.dart';

class SensitiveView extends StatefulWidget {
  final Widget child;

  SensitiveView({Key key, @required this.child}) : super(key: key);

  @override
  _SensitiveViewState createState() => _SensitiveViewState();
}

class _SensitiveViewState extends State<SensitiveView> {
  bool _hidden = false;

  @override
  Widget build(BuildContext context) {
    return Lifecycle(
      inactive: () => _hide(),
      resumed: () => _show(),
      paused: () => _hide(),
      detached: () => _hide(),
      child: widget.child,
    );
  }

  void _hide() {
    if (!_hidden) {
      _hidden = true;
      SensitiveContent.hide();
    }
  }

  void _show() {
    if (_hidden) {
      _hidden = false;
      SensitiveContent.show();
    }
  }
}
