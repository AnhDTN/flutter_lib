import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

class Helpers {
  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static dynamic getDataModel(json, String key) {
    try {
      final arrayKey = key.split('.');
      if (arrayKey.length > 0) {
        var currentValue = json;
        arrayKey.forEach((element) {
          currentValue = currentValue[element];
        });
        return currentValue;
      }
      return json[key];
    } catch (e) {
      return null;
    }
  }

  static String randomString(int strlen) {
    const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
    Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }

  static String assetPath(String name) {
    return 'assets/images/$name.png';
  }

  static String iconPath(String name) {
    return 'assets/icons/$name.svg';
  }

  static Color colorHex(String hex) {
    return Color(int.parse("0xFF$hex"));
  }

  static bool dateInRange(date, range) {
    final startRange = DateTime.now();
    final endRange = startRange.add(Duration(days: range));

    var isInRange = (date.difference(startRange).inDays == 0 &&
            date.day == startRange.day) ||
        (date.difference(endRange).inDays == 0 && date.day == endRange.day);
    if (isInRange == false)
      isInRange = date.isAfter(startRange) && date.isBefore(endRange);
    return isInRange;
  }

  static String formatString(String string, List<String> args) {
    var finalString = "";
    final arrString = string.split("%@");
    if (arrString.length == 0) return string;
    arrString.asMap().forEach((index, value) {
      if (index < arrString.length - 1 && index < args.length) {
        finalString += "$value${args[index]}";
      } else {
        finalString += value;
      }
    });
    return finalString;
  }

  static DateTime dateFromDate(String format, DateTime dateTime) {
    return Helpers.dateFromString(
        format, Helpers.stringFromDate(format, dateTime));
  }

  static String stringFromDate(String format, DateTime dateTime) {
    final formatter = DateFormat(format);
    return formatter.format(dateTime);
  }

  static DateTime dateFromSeconds(int seconds) {
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  }

  static DateTime dateFromString(String format, String dateTime) {
    final formatter = DateFormat(format);
    return formatter.parse(dateTime);
  }

  static String formatDateToStringWithTimeZone(DateTime date) {
    var dur = date.timeZoneOffset;
    if (dur.isNegative)
      return "${DateFormat("y-MM-ddTHH:mm:ss").format(date)}-${dur.inHours.toString().padLeft(2, '0')}:${(dur.inMinutes - (dur.inHours * 60)).toString().padLeft(2, '0')}";
    else
      return "${DateFormat("y-MM-ddTHH:mm:ss").format(date)}+${dur.inHours.toString().padLeft(2, '0')}:${(dur.inMinutes - (dur.inHours * 60)).toString().padLeft(2, '0')}";
  }

  static double roundDouble(double value, int places) {
    double mod = pow(10.0, places) as double;
    return ((value * mod).round().toDouble() / mod);
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static double maxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double maxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double bottomPadding(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static setStatusBarColor(Brightness brightness,
      {bool isAndroid = true, Color? color}) {
    SystemUiOverlayStyle style;
    style = SystemUiOverlayStyle(
        statusBarIconBrightness: brightness,
        statusBarColor: color,
        statusBarBrightness: brightness // status bar color
        );
    SystemChrome.setSystemUIOverlayStyle(style);
  }


  static String getFileExtension(String filePath){
    String fileName = getFileNameAndExtension(filePath);
    List<String> subs = fileName.split(".");
    if (subs.length > 1){
      return "." + subs[subs.length - 1];
    }
    return ".png";
  }

  static String getFileNameAndExtension(String filePath){
    return path.basename(filePath);
  }

  static String? dateTimeFromDateAndTime(String date, String time) {
    try{
      var dateToMillisecond = DateFormat("dd-MM-yyyy").parse(date).millisecondsSinceEpoch;
      var timeFormat = TimeOfDay.fromDateTime(DateFormat("HH:mm aaa").parse(time));
      var timeToMillisecond = timeFormat.hour * 60 * 60 * 1000 + timeFormat.minute * 60 * 1000;
      var millisecond = dateToMillisecond + timeToMillisecond;
      return DateTime.fromMillisecondsSinceEpoch(millisecond).toLocal().toString();
    } catch (e){
      try {
        var dateToMillisecond = DateFormat("dd-MM-yyyy").parse(date).millisecondsSinceEpoch;
        var timeFormat = TimeOfDay.fromDateTime(DateFormat("HH:mm").parse(time));
        var timeToMillisecond = timeFormat.hour * 60 * 60 * 1000 + timeFormat.minute * 60 * 1000;
        var millisecond = dateToMillisecond + timeToMillisecond;
        return DateTime.fromMillisecondsSinceEpoch(millisecond).toLocal().toString();
      } catch (e) {
          throw e;
      }
    }

  }

  static String stringToDate(String date) {
    var datetime = DateTime.parse(date);
    var parseString = DateFormat("dd-MM-yyyy HH:mm").format(datetime);
    return parseString;
  }
}
