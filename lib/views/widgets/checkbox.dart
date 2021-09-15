import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lib/resources/colors.dart';

class CustomCheckBox extends StatefulWidget {
  final String? title;
  final void Function(bool) onChange;
  final bool isCheck;
  const CustomCheckBox({Key? key, this.title, required this.onChange,required this.isCheck}) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  var isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: widget.isCheck,
            hoverColor: AppColors.gray2,
            checkColor: AppColors.white,
            activeColor: AppColors.blue,
            onChanged: (value) {
              setState(() {
                isCheck = value!;
              });
              widget.onChange(value!);
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            widget.title!,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColors.gray2),
          ),
        ),
      ],
    );
  }
}
