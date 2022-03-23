import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/color.dart';
import 'package:flutter_lib/resources/text_style.dart';

class InputCustomView extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
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
  final Color borderColor;
  final Color backgroundColor;
  final Gradient? gradient;
  final double borderRadius;
  final String? error;
  final EdgeInsets? contentPadding;
  final int? maxLength;

  const InputCustomView(
      {Key? key,
      this.controller,
      this.textInputType,
      this.onSubmit,
      this.onChanged,
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
      this.initialValue,
      this.onTap,
      this.borderColor = ColorRes.border,
      this.backgroundColor = Colors.white,
      this.gradient,
      this.borderRadius = 0,
      this.error,
      this.contentPadding,
      this.maxLength})
      : super(key: key);

  @override
  _InputCustomViewState createState() => _InputCustomViewState();
}

class _InputCustomViewState extends State<InputCustomView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(color: widget.borderColor, width: 0.5),
              gradient: widget.gradient),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.textInputType ?? TextInputType.text,
            onFieldSubmitted: widget.onSubmit,
            onChanged: widget.onChanged,
            validator: widget.validator,
            obscureText: widget.obscureText,
            readOnly: widget.readOnly,
            style: widget.textStyle ?? TextStyles.body1White(context),
            enabled: widget.enable,
            textAlign: TextAlign.start,
            textInputAction: widget.textInputAction,
            autofocus: widget.autoFocus,
            initialValue: widget.initialValue,
            onTap: widget.onTap,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              fillColor: Colors.white,
              hoverColor: Colors.white,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              hintText: widget.hintText,
              hintStyle: TextStyles.body1Gray(context),
              contentPadding: widget.contentPadding ?? const EdgeInsets.all(0),
              counterText: ""
            ),
          ),
        ),
        if (widget.error != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              widget.error!,
              style: TextStyles.captionRed(context),
            ),
          )
      ],
    );
  }
}
