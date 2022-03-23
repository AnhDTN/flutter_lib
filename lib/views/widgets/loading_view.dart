import 'package:flutter/material.dart';

Widget loadingView(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(32.0),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}