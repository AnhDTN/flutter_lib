import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<DateTime?> showDateTimePicker(BuildContext context) async {
  var dateTime = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1930),
    lastDate: DateTime(2040),
  );
  return dateTime;
}

Future<TimeOfDay?> timePicker(BuildContext context) async {
  var time = await showTimePicker(
    context: context, initialTime: TimeOfDay.now(),
  );
  return time;
}