import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String datetimeFormat = "hh:mm aaa dd/MM/yyyy";
const String dateFormat = "dd/MM/yyyy";
const String kUTCDatetimeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
//  return stringFromDate("HH:mm aaa", date);
String stringFromDate(String format, DateTime dateTime) {
  final formatter = DateFormat(format);
  return formatter.format(dateTime);
}

DateTime dateFromMilliseconds(int milliseconds) {
  return DateTime.fromMillisecondsSinceEpoch(milliseconds);
}

String millisecondsToDateString(int time) {
  var date = dateFromMilliseconds(time);
  var now = DateTime.now();
  if (DateUtils.isSameDay(date, now)) {
    return "Hôm nay";
  }
  var yesterday = now.subtract(const Duration(days: 1));
  if (DateUtils.isSameDay(date, yesterday)) {
    return "Hôm qua";
  } else {
    return stringFromDate(dateFormat, date);
  }
}

String millisecondsToDateString2(int time) {
  var date = dateFromMilliseconds(time);
  return stringFromDate(dateFormat, date);
}

String parseDateFormat({String format = datetimeFormat, required String time}) {
  DateTime dateTime = DateTime.parse(time);
  final formatter = DateFormat(format);
  return formatter.format(dateTime);
}