import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/color.dart';

class ButtonView extends StatefulWidget {
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  final void Function() onTap;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const ButtonView({
    Key? key,
    this.backgroundColor = ColorRes.primary,
    this.textColor = Colors.white,
    required this.text,
    required this.onTap,
    this.width,
    this.padding,
    this.borderColor = ColorRes.primary,
  }) : super(key: key);

  @override
  State<ButtonView> createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> {
  Timer? _debounceTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: 48,
        width: widget.width ?? MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor:
                  MaterialStateProperty.all<Color>(widget.backgroundColor),
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: widget.borderColor),
                      borderRadius: BorderRadius.circular(40)))),
          onPressed: () {
            if (_debounceTime?.isActive ?? false) {
              _debounceTime?.cancel();
            }
            _debounceTime = Timer(const Duration(seconds: 1), () {
              widget.onTap();
            });
          },
          child: Text(
            widget.text,
            style: TextStyle(color: widget.textColor),
          ),
        ),
      ),
    );
  }
}

class ButtonView2 extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Widget child;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const ButtonView2(
      {Key? key,
      this.backgroundColor = ColorRes.primary,
      required this.onTap,
      this.width,
      this.padding,
      this.borderColor = ColorRes.primary,
      required this.child,
      this.height = 56,
      this.borderRadius = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor),
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: borderColor),
                      borderRadius: BorderRadius.circular(borderRadius)))),
          onPressed: onTap,
          child: child,
        ),
      ),
    );
  }
}
