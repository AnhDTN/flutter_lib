import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lib/resources/colors.dart';

class TextInput extends StatefulWidget {
  final void Function(String value) onChange;
  final String? Function(String? value)? validator;
  final void Function() onTap;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final TextInputType? inputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final bool? enable;
  final String? initValue;
  const TextInput(
      {Key? key,
      required this.onChange,
      required this.onTap,
      this.labelText,
      this.validator,
      this.inputType = TextInputType.text,
      this.suffixIcon,
      this.prefixIcon,
      this.hintText,
      this.controller,
      this.focusNode,
      this.height = 56,
      this.enable = true,
      this.initValue})
      : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.white,
            border: Border.all(width: 1, color: AppColors.gray4)),
        child: Center(
          child: TextFormField(
            expands: true,
            onChanged: widget.onChange,
            keyboardType: widget.inputType,
            controller: widget.controller,
            minLines: null,
            maxLines: null,
            enabled: widget.enable,
            initialValue: widget.initValue,
            cursorColor: AppColors.black,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColors.gray4),
            decoration: InputDecoration(
                labelText: widget.labelText,
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColors.gray4),
                contentPadding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
                filled: true,
                fillColor: AppColors.white,
                hoverColor: AppColors.white,
                focusColor: AppColors.white,
                border: InputBorder.none,
                // alignLabelWithHint: false,
                // enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: AppColors.gray7Color, width: 1)),
                // // border: OutlineInputBorder(
                //     borderSide: BorderSide(
                //         color: AppColors.gray7Color,
                //         width: 1,
                //         style: BorderStyle.none)),
                // focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: AppColors.green1Color)),
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColors.gray4),
                suffixIcon: widget.suffixIcon),
            validator: widget.validator,
          ),
        ),
      ),
    );
  }
}

class TextLabelInput extends StatefulWidget {
  final void Function(String? value)? onChange;
  final String? Function(String? value)? validator;
  final void Function() onTap;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String labelText;
  final String? hintText;
  final TextInputType? inputType;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final double? height;
  final bool? enable;
  final String? initValue;

  const TextLabelInput(
      {Key? key,
        this.onChange,
        required this.onTap,
        required this.labelText,
        this.validator,
        this.inputType = TextInputType.text,
        this.suffixIcon,
        this.preffixIcon,
        this.hintText,
        this.controller,
        this.focusNode,
        this.height = 56,
        this.initValue,
        this.enable = true})
      : super(key: key);

  @override
  _TextLabelInputState createState() => _TextLabelInputState();
}

class _TextLabelInputState extends State<TextLabelInput> {

  var _focusNode =  FocusNode();
  Color _color = AppColors.gray4;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if(_focusNode.hasFocus) {
        setState(() {
          _color = AppColors.gray2;
        });
      } else {
        setState(() {
          _color = AppColors.gray4;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.white,
            border: Border.all(width: 1, color: _color)),
        child: Center(
          child: TextFormField(
            expands: true,
            onChanged: widget.onChange,
            keyboardType: widget.inputType,
            controller: widget.controller,
            minLines: null,
            maxLines: null,
            initialValue: widget.initValue,
            enabled: widget.enable,
            cursorColor: AppColors.black,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColors.gray2),
            focusNode: _focusNode,
            decoration: InputDecoration(
                labelText: widget.labelText,
                hintText: widget.hintText,
                prefixIcon: widget.preffixIcon,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColors.gray2),
                contentPadding: EdgeInsets.only(top: 8, left: 16, bottom: 8),
                filled: true,
                border: InputBorder.none,
                fillColor: AppColors.white,
                hoverColor: AppColors.green,
                focusColor: AppColors.green,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColors.gray2),
                suffixIcon: widget.suffixIcon),
            validator: widget.validator,
          ),
        ),
      ),
    );
  }
}
