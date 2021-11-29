import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routing {
  static final Routing _instance = Routing._internal();

  factory Routing() {
    return _instance;
  }

  Routing._internal();

  static Future<T?> navigate2<T>(BuildContext context, WidgetBuilder builder,
      {bool replace = false, required String routeName}) async {
    if (replace) {
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              settings: RouteSettings(name: routeName), builder: builder));
      return null;
    }
  }

  static Future<T?> navigateAnim<T>(BuildContext context, Widget child,
      {bool replace = false,
      PageTransitionType transitionType = PageTransitionType.fade,
      required String routeName}) async {
    if (replace) {
      await Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: child,
              settings: RouteSettings(name: routeName)));
      return null;
    }

    return Navigator.push<T>(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: child,
            settings: RouteSettings(name: routeName)));
  }

  static void popToRoot(BuildContext context) {
    while (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static Future openDialog(BuildContext context, WidgetBuilder builder,
      {bool? fullscreen}) async {
    return await Navigator.push(
        context,
        MaterialPageRoute(
          builder: builder,
          fullscreenDialog: fullscreen ?? false,
        ));
  }
}
