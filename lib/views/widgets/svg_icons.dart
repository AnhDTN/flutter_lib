import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({Key? key, required this.icon, this.size = 24, this.color})
      : super(key: key);
  final String icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      height: size,
      width: size,
      color: color,
      fit: BoxFit.cover,
    );
  }
}
