import 'package:flutter/widgets.dart';

class TextView extends StatelessWidget {
  final double? height;
  final double? width;
  final String value;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? textOverflow;
  const TextView(this.value, {Key? key, this.height = 20, this.width, this.style, this.maxLines, this.textOverflow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Text(value, style: style,maxLines: maxLines, overflow: textOverflow,),
    );
  }
}
