import 'package:flutter/material.dart';

class Lifecycle extends StatefulWidget {
  final VoidCallback inactive;
  final VoidCallback resumed;
  final Widget child;

  Lifecycle({
    Key key,
    @required this.inactive,
    @required this.resumed,
    @required this.child,
  }) : super(key: key);

  @override
  _LifecycleState createState() => _LifecycleState();
}

class _LifecycleState extends State<Lifecycle> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      widget.inactive();
    } else if (state == AppLifecycleState.resumed) {
      widget.resumed();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
