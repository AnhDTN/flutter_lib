import 'dart:ui';

class AppColors {
  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const blue1 = Color(0xFF0052CC);
  static const blue2 = Color(0xFFFF9D54);
  static const blue = Color(0xFF073787);
  static const green = Color(0xFF36B37E);
  static const titleText = Color(0xFF172B4D);
  static const orange = Color(0xFF172B4D);
  static const gray1 = Color(0xFF333333);
  static const gray2 = Color(0xFF4F4F4F);
  static const gray3 = Color(0xFF9D9898);
  static const gray4 = Color(0xFFF2F4F8);
  static const yellow = Color(0xFFFDD835);
  static const red = Color(0xFFFF6262);
  static const redDark = Color(0xFFEC1C24);
  static const blueLight = Color(0xFFEAFAFF);
  static const divider = Color(0xFF4F4F4F);
  static const border = Color(0xFF9D9898);
  static const backgroundImage = Color.fromRGBO(19, 20, 53, 1);
  static const backgroundOuting = Color(0xff262261);
  static const background = Color(0xff262244);

  AppColors._internal();
}