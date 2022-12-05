import 'package:flutter/cupertino.dart';

/// currently, I don't use routes methods because there is a lot of run time errors.
/// I use normal Navigator because i don't know how to make Get.to without root.

class Go {
final BuildContext context;
Go(this.context);
 to( Widget page,{bool withoutRoot=false})  {
  PageRoute route =
      CupertinoPageRoute(builder: (context) => page, maintainState: withoutRoot);
  return Navigator.of(context, rootNavigator: withoutRoot).push(route);
}

  offAll(Widget page) {
    return Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (BuildContext context) => page,
        ),
        (route) => false);
  }

  back() {
    return Navigator.of(context).maybePop();
  }
}
