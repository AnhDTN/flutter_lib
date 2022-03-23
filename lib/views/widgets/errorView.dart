import 'package:flutter/cupertino.dart';
import 'package:flutter_lib/resources/text_style.dart';

Widget errorView(BuildContext context, {String message = "Đã có lỗi xảy ra!"}) {
  return Center(child: Text(message, style: TextStyles.body1White(context),),);
}