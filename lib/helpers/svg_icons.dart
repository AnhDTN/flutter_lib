import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcons extends StatefulWidget {
  final String? icon;
  final double? size;
  final Color? color;

  const SvgIcons({Key? key, required this.icon, this.size, this.color})
      : super(key: key);

  @override
  _SvgIconsState createState() => _SvgIconsState();
}

class _SvgIconsState extends State<SvgIcons> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      widget.icon!,
      height: widget.size,
      width: widget.size,
      color: widget.color,
    );
  }
}
