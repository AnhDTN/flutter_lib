import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/text_style.dart';

Widget searchView(
    {required BuildContext context,
    required void Function(String keyword) onChange,
    String hint = "Tìm tên bài viết, tag, người đăng",
    Color? colors,
    TextStyle? textStyles}) {
  return TextFormField(
    style: textStyles ?? TextStyles.body1White(context),
    onChanged: onChange,
    decoration: InputDecoration(
      suffixIcon: Icon(
        Icons.search,
        size: 24,
        color: colors ?? Colors.white30,
      ),
      hintText: hint,
      filled: true,
      // fillColor: Colors.white.withOpacity(0.06),
      hintStyle: TextStyles.body1Gray(context),
      errorStyle: TextStyles.body2Red(context),
      contentPadding: const EdgeInsets.only(left: 16, right: 16),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide:
              BorderSide(width: 0.5, color: Colors.white.withOpacity(0.2))),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide:
              BorderSide(width: 0.5, color: Colors.white.withOpacity(0.2))),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide:
              BorderSide(width: 0.5, color: Colors.white.withOpacity(0.7))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide:
              BorderSide(width: 0.5, color: Colors.white.withOpacity(0.7))),
    ),
  );
}
