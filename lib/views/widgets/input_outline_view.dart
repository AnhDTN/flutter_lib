import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/color.dart';
import 'package:flutter_lib/resources/text_style.dart';

class InputTextOutline extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  final String? hintText;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double height;
  final bool obscureText;
  final bool readOnly;
  final bool enable;
  final bool autoFocus;
  final String? initialValue;
  final void Function()? onTap;

  const InputTextOutline(
      {Key? key,
      this.controller,
      this.textInputType,
      this.onSubmit,
      this.onChange,
      this.validator,
      this.textStyle,
      this.hintText,
      this.maxLines,
      this.prefixIcon,
      this.suffixIcon,
      this.height = 56,
      this.obscureText = false,
      this.readOnly = false,
      this.textInputAction,
      this.enable = true,
      this.autoFocus = false,
      this.initialValue, this.onTap})
      : super(key: key);

  @override
  _InputTextOutlineState createState() => _InputTextOutlineState();
}

class _InputTextOutlineState extends State<InputTextOutline> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType ?? TextInputType.text,
        onFieldSubmitted: widget.onSubmit,
        onChanged: widget.onChange,
        validator: widget.validator,
        obscureText: widget.obscureText,
        readOnly: widget.readOnly,
        style: widget.textStyle ?? TextStyles.body1(context),
        enabled: widget.enable,
        textAlign: TextAlign.start,
        textInputAction: widget.textInputAction,
        autofocus: widget.autoFocus,
        initialValue: widget.initialValue,
        onTap: widget.onTap,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: ColorRes.border,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: ColorRes.border,
            ),
          ),
          prefixIcon: widget.prefixIcon != null
              ? SizedBox(
                  child: Center(child: SizedBox(child: widget.prefixIcon)),
                  width: 30,
                  height: 30,
                )
              : null,
          suffixIcon: widget.suffixIcon != null
              ? SizedBox(
                  child: Center(child: SizedBox(child: widget.suffixIcon)),
                  width: 30,
                  height: 30,
                )
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyles.body1Gray(context),
        ),
      ),
    );
  }
}
