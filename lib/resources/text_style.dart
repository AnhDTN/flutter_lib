import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/color.dart';

class TextStyles {
  static final TextStyles _singleton = TextStyles._internal();

  factory TextStyles() {
    return _singleton;
  }
  TextStyles._internal();

  static TextStyle? headLine1White(BuildContext context) => Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white);
  static TextStyle? headLine1(BuildContext context) => Theme.of(context).textTheme.headline1;
  static TextStyle? headLine1Red(BuildContext context) => Theme.of(context).textTheme.headline1?.copyWith(color: ColorRes.red);
  static TextStyle? headLine1Bold(BuildContext context) => Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.bold);

  static TextStyle? headLine2White(BuildContext context) => Theme.of(context).textTheme.headline2?.copyWith(color: Colors.white);
  static TextStyle? headLine2(BuildContext context) => Theme.of(context).textTheme.headline2;
  static TextStyle? headLine2Red(BuildContext context) => Theme.of(context).textTheme.headline2?.copyWith(color: ColorRes.red);
  static TextStyle? headLine2Bold(BuildContext context) => Theme.of(context).textTheme.headline2?.copyWith(fontWeight: FontWeight.bold);
  static TextStyle? headLine2WhiteBold(BuildContext context) => Theme.of(context).textTheme.headline2?.copyWith(color: Colors.white, fontWeight: FontWeight.bold);

  static TextStyle? headLine3White(BuildContext context) => Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white);
  static TextStyle? headLine3(BuildContext context) => Theme.of(context).textTheme.headline3;
  static TextStyle? headLine3Red(BuildContext context) => Theme.of(context).textTheme.headline3?.copyWith(color: ColorRes.red);
  static TextStyle? headLine3Bold(BuildContext context) => Theme.of(context).textTheme.headline3?.copyWith(fontWeight: FontWeight.bold);
  static TextStyle? headLine3WhiteBold(BuildContext context) => Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white, fontWeight: FontWeight.bold);

  static TextStyle? headLine4White(BuildContext context) => Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white);
  static TextStyle? headLine4(BuildContext context) => Theme.of(context).textTheme.headline4;
  static TextStyle? headLine4Red(BuildContext context) => Theme.of(context).textTheme.headline4?.copyWith(color: ColorRes.red);
  static TextStyle? headLine4Bold(BuildContext context) => Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold);
  static TextStyle? headLine4WhiteBold(BuildContext context) => Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white, fontWeight: FontWeight.bold);

  static TextStyle? headLine5White(BuildContext context) => Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white);
  static TextStyle? headLine5(BuildContext context) => Theme.of(context).textTheme.headline5;
  static TextStyle? headLine5Red(BuildContext context) => Theme.of(context).textTheme.headline5?.copyWith(color: ColorRes.red);
  static TextStyle? headLine5Bold(BuildContext context) => Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold);
  static TextStyle? headLine5WhiteBold(BuildContext context) => Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white, fontWeight: FontWeight.bold);

  static TextStyle? headLine6White(BuildContext context) => Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white);
  static TextStyle? headLine6(BuildContext context) => Theme.of(context).textTheme.headline6;
  static TextStyle? headLine6Red(BuildContext context) => Theme.of(context).textTheme.headline6?.copyWith(color: ColorRes.red);
  static TextStyle? headLine6Bold(BuildContext context) => Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold);
  static TextStyle? headLine6WhiteBold(BuildContext context) => Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.bold);

  static TextStyle? buttonWhite(BuildContext context) => Theme.of(context).textTheme.button?.copyWith(color: Colors.white);
  static TextStyle? buttonRed(BuildContext context) => Theme.of(context).textTheme.button?.copyWith(color: ColorRes.red);

  static TextStyle? body1(BuildContext context) => Theme.of(context).textTheme.bodyText1;
  static TextStyle? body1Red(BuildContext context) => Theme.of(context).textTheme.bodyText1?.copyWith(color: ColorRes.red);
  static TextStyle? body1BlueBold(BuildContext context) => Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold, color: Colors.blue);
  static TextStyle? body1Italic(BuildContext context) => Theme.of(context).textTheme.bodyText1?.copyWith(fontStyle: FontStyle.italic);
  static TextStyle? body1Gray(BuildContext context) => Theme.of(context).textTheme.bodyText1?.copyWith(color: ColorRes.textDefault);
  static TextStyle? body1Bold(BuildContext context) => Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold);
  static TextStyle? body1White(BuildContext context) => Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white);

  static TextStyle? body2(BuildContext context) => Theme.of(context).textTheme.bodyText2;
  static TextStyle? body2Italic(BuildContext context) => Theme.of(context).textTheme.bodyText2?.copyWith(fontStyle: FontStyle.italic);
  static TextStyle? body2Gray(BuildContext context) => Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white60);
  static TextStyle? body2Red(BuildContext context) => Theme.of(context).textTheme.bodyText2?.copyWith(color: ColorRes.red);
  static TextStyle? body2Bold(BuildContext context) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold);
  static TextStyle? body2White(BuildContext context) => Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white);

  static TextStyle? caption(BuildContext context) => Theme.of(context).textTheme.caption;
  static TextStyle? captionItalic(BuildContext context) => Theme.of(context).textTheme.caption?.copyWith(fontStyle: FontStyle.italic);
  static TextStyle? captionGray(BuildContext context) => Theme.of(context).textTheme.caption?.copyWith(color: Colors.white60);
  static TextStyle? captionRed(BuildContext context) => Theme.of(context).textTheme.caption?.copyWith(color: ColorRes.red);
  static TextStyle? captionBold(BuildContext context) => Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.bold);
  static TextStyle? captionWhite(BuildContext context) => Theme.of(context).textTheme.caption?.copyWith(color: Colors.white);

  static TextStyle? subtitle1(BuildContext context) => Theme.of(context).textTheme.subtitle1;
  static TextStyle? subtitle1Italic(BuildContext context) => Theme.of(context).textTheme.subtitle1?.copyWith(fontStyle: FontStyle.italic);
  static TextStyle? subtitle1Gray(BuildContext context) => Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white60);
  static TextStyle? subtitle1Red(BuildContext context) => Theme.of(context).textTheme.subtitle1?.copyWith(color: ColorRes.red);
  static TextStyle? subtitle1Bold(BuildContext context) => Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold);
  static TextStyle? subtitle1White(BuildContext context) => Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white);

  static TextStyle? subtitle2(BuildContext context) => Theme.of(context).textTheme.subtitle2;
  static TextStyle? subtitle2Italic(BuildContext context) => Theme.of(context).textTheme.subtitle2?.copyWith(fontStyle: FontStyle.italic);
  static TextStyle? subtitle2Gray(BuildContext context) => Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white60);
  static TextStyle? subtitle2Red(BuildContext context) => Theme.of(context).textTheme.subtitle2?.copyWith(color: ColorRes.red);
  static TextStyle? subtitle2Bold(BuildContext context) => Theme.of(context).textTheme.subtitle2?.copyWith(fontWeight: FontWeight.bold);
  static TextStyle? subtitle2White(BuildContext context) => Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white);

}