import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/colors.dart';

class ScaffoldExtView extends StatelessWidget {
  final Widget? appBar;
  final Widget body;
  final double? width;
  final double? height;

  ScaffoldExtView({this.appBar, required this.body, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBar != null
          ? PreferredSize(
              preferredSize: Size(
                  width ?? MediaQuery.of(context).size.width, height ?? 56),
              child: appBar!)
          : null,
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: body),
    );
  }
}
