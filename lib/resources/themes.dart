// neu co 2 theme sang toi thi sai, khong thi xoa di

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.red,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonColor: AppColors.red,
  backgroundColor: AppColors.white,
  disabledColor: AppColors.gray2,
  appBarTheme: AppBarTheme(
    // color: AppColors.white,
      backgroundColor: AppColors.white,
      brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: AppColors.white)),
  fontFamily: 'Roboto',
  buttonTheme: ButtonThemeData(
      buttonColor: AppColors.redDark,
      minWidth: 90,
      height: 56,
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500)),
          foregroundColor:
          MaterialStateProperty.all<Color>(AppColors.redDark),
          backgroundColor:
          MaterialStateProperty.all<Color>(AppColors.redDark),
          shadowColor:
          MaterialStateProperty.all<Color>(AppColors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))))),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: AppColors.redDark,
        ),
        textStyle: TextStyle(
            color: AppColors.redDark,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      )),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: AppColors.black,
      fontSize: 34,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
        color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: AppColors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold),
    button: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: AppColors.black,
        fontSize: 13,
        fontWeight: FontWeight.normal),
    caption: TextStyle(
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.normal),
    subtitle1: TextStyle(
        color: AppColors.black,
        fontSize: 11,
        fontWeight: FontWeight.w500),
    subtitle2: TextStyle(
        color: AppColors.black,
        fontSize: 10,
        fontWeight: FontWeight.normal),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonColor: AppColors.red,
  backgroundColor: AppColors.black,
  disabledColor: AppColors.gray2,
  appBarTheme: AppBarTheme(
    // color: AppColors.white,
      backgroundColor: AppColors.white,
      brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: AppColors.white)),
  fontFamily: 'Roboto',
  buttonTheme: ButtonThemeData(
      buttonColor: AppColors.redDark,
      minWidth: 90,
      height: 56,
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500)),
          foregroundColor:
          MaterialStateProperty.all<Color>(AppColors.blue),
          backgroundColor:
          MaterialStateProperty.all<Color>(AppColors.blue),
          shadowColor:
          MaterialStateProperty.all<Color>(AppColors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))))),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: AppColors.blue,
        ),
        textStyle: TextStyle(
            color: AppColors.redDark,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      )),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: AppColors.white,
      fontSize: 34,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold),
    button: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: AppColors.white,
        fontSize: 13,
        fontWeight: FontWeight.normal),
    caption: TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.normal),
    subtitle1: TextStyle(
        color: AppColors.white,
        fontSize: 11,
        fontWeight: FontWeight.w500),
    subtitle2: TextStyle(
        color: AppColors.white,
        fontSize: 10,
        fontWeight: FontWeight.normal),
  ),
);