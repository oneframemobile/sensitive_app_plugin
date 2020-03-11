import 'package:flutter/material.dart';

class Lifecycle extends StatefulWidget {
  final VoidCallback inactive;
  final VoidCallback resumed;
  final VoidCallback detached;
  final VoidCallback paused;
  final Widget child;

  Lifecycle({
    Key key,
    @required this.inactive,
    @required this.resumed,
    @required this.paused,
    @required this.detached,
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
    print("$state");
    if (state == AppLifecycleState.inactive) {
      widget.inactive();
    } else if (state == AppLifecycleState.resumed) {
      widget.resumed();
    } else if (state == AppLifecycleState.detached) {
      widget.detached();
    } else if (state == AppLifecycleState.paused) {
      widget.paused();
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
