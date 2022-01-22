import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lib/resources/colors.dart';

class OutlineButtonApp extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPressed;
  final String? buttonText;
  final Color? buttonTextColor;
  final double? width;
  final double? height;
  final Widget? prefixIcon;
  final TextStyle? textStyle;

  const OutlineButtonApp(
      {Key? key,
      this.onPressed,
      this.buttonText,
      this.buttonTextColor,
      this.onLongPressed,
      this.width,
      this.prefixIcon,
      this.height = 48,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        onLongPress: onLongPressed,
        style: Theme.of(context).outlinedButtonTheme.style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefixIcon ?? SizedBox(),
              Text(
                buttonText ?? "BUTON",
                style: textStyle ?? Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: buttonTextColor ?? AppColors.white),
              ),
            ],
          ),
        ),
    );
  }
}

class ButtonApp extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPressed;
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  const ButtonApp(
      {Key? key,
      this.onPressed,
      this.onLongPressed,
      this.buttonText,
      this.buttonColor,
      this.textColor,
      this.width,
      this.height = 48,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPressed,
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(
                buttonColor ?? AppColors.red)),
        child: Text(buttonText ?? "BUTTON",
            style: textStyle ?? Theme.of(context).textTheme.button!.copyWith(
                color: textColor ?? AppColors.white)),
      ),
    );
  }
}
