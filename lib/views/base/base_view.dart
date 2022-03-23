import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/color.dart';
import 'package:flutter_lib/resources/text_style.dart';
import 'package:flutter_lib/views/widgets/svg_icons.dart';
import 'package:flutter_lib/views/widgets/top_alert.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

mixin BaseView {
  OverlayEntry? _overlayEntry;

  Widget consumer(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        //ref.watch(provider);
        return Container(color: Colors.transparent);
      },
    );
  }

  double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  void alert(String message) {}

  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  void topAlert(BuildContext context, Widget icon, Widget child,
      {Color backgroundColor = Colors.white,
      Color borderColor = ColorRes.primary}) {
    if (_overlayEntry != null) {
      return;
    }
    var overlay = OverlayEntry(builder: (BuildContext context) {
      return TopAlert(
        icon: icon,
        child: child,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
      );
    });
    _overlayEntry = overlay;
    Navigator.of(context).overlay?.insert(overlay);
    Future.delayed(const Duration(seconds: 5), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  void showToastError(BuildContext context, String icon, String message) {
    topAlert(
        context,
        SvgIcon(icon: icon),
        Text(
          message,
          style: TextStyles.body2Red(context),
        ));
  }

  void showToastSuccess(BuildContext context, String icon, String message) {
    topAlert(
        context,
        SvgIcon(icon: icon),
        Text(
          message,
          style: TextStyles.body1White(context),
        ),
        borderColor: ColorRes.white,
        backgroundColor: Colors.white.withOpacity(0.2));
  }

  Widget progressView() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(ColorRes.primary),
      ),
    );
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


  Future<dynamic> pushNamed(BuildContext context, String name,
      {Object? arguments}) async {
    return Navigator.of(context).pushNamed(name, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(BuildContext context, String name,
      {Object? arguments}) async {
    return Navigator.of(context)
        .pushReplacementNamed(name, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(BuildContext context,
      {required String name,
        required String oldRouteName,
        Object? arguments}) async {
    return Navigator.of(context).pushNamedAndRemoveUntil(
        name, ModalRoute.withName(oldRouteName),
        arguments: arguments);
  }

  Future<dynamic> pushNamedNewRouter(BuildContext context,
      {required String name, Object? arguments}) async {
    return Navigator.of(context)
        .pushNamedAndRemoveUntil(name, (route) => false, arguments: arguments);
  }

  Future<dynamic> pushAndRemove(BuildContext context, Widget widget) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
          (Route<dynamic> route) => false,
    );
  }

  void showSnackBarError(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSnackBar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget padding({
    double left = .0,
    double top = .0,
    double right = .0,
    double bottom = .0,
    double vertical = .0,
    double horizontal = .0,
    double all = .0,
    Widget? child,
  }) {
    double firstLeft = left > 0 ? left : (horizontal > 0 ? horizontal : all);
    double firstRight = right > 0 ? right : (horizontal > 0 ? horizontal : all);
    double firstTop = top > 0 ? top : (vertical > 0 ? vertical : all);
    double firstBottom = bottom > 0 ? bottom : (vertical > 0 ? vertical : all);
    return Padding(
      padding: EdgeInsets.only(
        left: firstLeft,
        right: firstRight,
        top: firstTop,
        bottom: firstBottom,
      ),
      child: child,
    );
  }
}
