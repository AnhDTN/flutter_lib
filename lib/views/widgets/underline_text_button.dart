import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/text_style.dart';

class ButtonUnderLineView extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final double underLineHeight;
  final Color underLineColor;
  final double underLinePadding;
  final ButtonStyle? style;

  const ButtonUnderLineView(
      this.text,
      {Key? key,
      this.onTap,
      this.padding,
      this.alignment,
      this.textStyle,
      this.underLineHeight = 1,
      this.underLineColor = Colors.red,
      this.underLinePadding = 2,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: style ?? TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Container(
          alignment: alignment,
          padding: EdgeInsets.only(bottom: underLinePadding),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: underLineHeight, color: underLineColor),
            ),
          ),
          child: Text(
            text,
            style: textStyle ?? TextStyles.buttonRed(context),
          ),
        )
    );
  }
}
