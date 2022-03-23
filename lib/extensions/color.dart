import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

MaterialColor createColor(int rawColor,Color color) {
  Map<int, Color> mapColor = {};
  mapColor.addAll({50: Color.fromRGBO(color.red, color.green, color.blue, 0.1,)},);
  for (int i = 1; i < 10; i++) {
    mapColor.addAll({i * 100: Color.fromRGBO(color.red, color.green, color.blue, 0.1 * i,)},);
  }

  return MaterialColor(rawColor, mapColor);
}


