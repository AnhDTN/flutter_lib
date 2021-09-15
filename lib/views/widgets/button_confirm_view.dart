import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_lib/helpers/svg_icons.dart';
import 'package:flutter_lib/resources/colors.dart';
import 'package:flutter_lib/resources/image_name.dart';

class ButtonView extends StatelessWidget {
  final BoxDecoration? decoration;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final void Function()? onTap;
  final double? width;
  final EdgeInsetsGeometry? padding;
  ButtonView(
      {this.decoration,
      this.backgroundColor = AppColors.redDark,
      this.textColor = AppColors.white,
      required this.text,
      required this.onTap, this.width, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        height: 56,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: decoration ??
            BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(8))),
        child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStateProperty.all<Color>(backgroundColor), elevation:  MaterialStateProperty.all<double>(0)),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

class ButtonOutlineView extends StatefulWidget {
  final Color borderColor;
  final String text;
  final Color textColor;
  final String? iconName;
  final Color iconColor;
  final double height;
  final double? width;
  final void Function()? onTap;

  const ButtonOutlineView(
      {Key? key,
      this.borderColor = AppColors.redDark,
      this.text = "Đăng ký",
      this.textColor = AppColors.redDark,
      this.iconColor = AppColors.redDark,
      this.onTap,
      this.height = 56,
      this.iconName, this.width})
      : super(key: key);

  @override
  _ButtonOutlineViewState createState() => _ButtonOutlineViewState();
}

class _ButtonOutlineViewState extends State<ButtonOutlineView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height,
      child: OutlinedButton(
        style: Theme.of(context).outlinedButtonTheme.style,
        onPressed: widget.onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (widget.iconName != null)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: SvgIcons(
                  icon: IconName.user,
                  color: widget.iconColor,
                ),
              ),
            Text(
              widget.text,
              style: TextStyle(color: widget.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
