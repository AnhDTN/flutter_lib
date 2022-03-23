import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/color.dart';
import 'package:flutter_lib/resources/text_style.dart';
import 'package:flutter_lib/views/widgets/svg_icons.dart';
import 'package:flutter_lib/views/widgets/top_alert.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Future<dynamic> push(BuildContext context, Widget widget) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<dynamic> pushAndRemove(BuildContext context, Widget widget) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
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
