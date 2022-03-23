// neu co 2 theme sang toi thi sai, khong thi xoa di

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lib/resources/color.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.red,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonColor: ColorResDark.red,
  backgroundColor: ColorResDark.white,
  disabledColor: ColorResDark.disable,
  appBarTheme: AppBarTheme(
    // color: AppColors.white,
      backgroundColor: ColorResDark.white,
      brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: ColorResDark.white)),
  fontFamily: 'Roboto',
  buttonTheme: ButtonThemeData(
      buttonColor: ColorResDark.red,
      minWidth: 90,
      height: 56,
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
              color: ColorResDark.textDefault,
              fontSize: 16,
              fontWeight: FontWeight.w500)),
          foregroundColor:
          MaterialStateProperty.all<Color>(ColorResDark.red),
          backgroundColor:
          MaterialStateProperty.all<Color>(ColorResDark.red),
          shadowColor:
          MaterialStateProperty.all<Color>(ColorResDark.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))))),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: ColorResDark.red,
        ),
        textStyle: const TextStyle(
            color: ColorResDark.red,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      )),
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: ColorResDark.textDefault,
      fontSize: 34,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
        color: ColorResDark.textDefault,
        fontSize: 24,
        fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: ColorResDark.textDefault,
        fontSize: 20,
        fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: ColorResDark.textDefault,
        fontSize: 18,
        fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: ColorResDark.textDefault,
        fontSize: 16,
        fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: ColorResDark.textDefault,
        fontSize: 14,
        fontWeight: FontWeight.bold),
    button: TextStyle(
        color: ColorResDark.textDefault,
        fontSize: 16,
        fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        color: ColorResDark.textDefault,
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: ColorResDark.textDefault,
        fontSize: 13,
        fontWeight: FontWeight.normal),
    caption: TextStyle(
        color: ColorResDark.textDefault,
        fontSize: 12,
        fontWeight: FontWeight.normal),
    subtitle1: TextStyle(
        color: ColorResDark.textDefault,
        fontSize: 11,
        fontWeight: FontWeight.w500),
    subtitle2: TextStyle(
        color: ColorResDark.textDefault,
        fontSize: 10,
        fontWeight: FontWeight.normal),
  ),
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: ColorRes.primaryDark,
  primarySwatch: ColorRes.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonColor: ColorRes.red,
  backgroundColor: Colors.white,
  disabledColor: ColorRes.colorDisable,
  appBarTheme: AppBarTheme(
    // color: AppColors.white,
      backgroundColor: Colors.white,
      brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Colors.white)),
  fontFamily: 'Roboto',
  buttonTheme: ButtonThemeData(
      buttonColor: ColorRes.red,
      minWidth: 90,
      height: 56,
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500)),
          foregroundColor:
          MaterialStateProperty.all<Color>(ColorRes.primary),
          backgroundColor:
          MaterialStateProperty.all<Color>(ColorRes.primary),
          shadowColor:
          MaterialStateProperty.all<Color>(ColorRes.primaryDark),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))))),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: ColorRes.primary,
        ),
        textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      )),
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 34,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold),
    button: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.normal),
    caption: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.normal),
    subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 11,
        fontWeight: FontWeight.w500),
    subtitle2: TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.normal),
  ),
);