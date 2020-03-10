import 'package:flutter/material.dart';
import 'package:sensitive_content/sensitive.dart';

class SensitiveView extends Lifecycle {
  SensitiveView({
    Key key,
    @required Widget child,
  }) : super(
          key: key,
          child: child,
          inactive: () => SensitiveContent.hide(),
          resumed: () => SensitiveContent.show(),
        );
}
