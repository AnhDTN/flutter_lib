import 'package:flutter/material.dart';
import 'package:flutter_lib/views/page/home_page.dart';
import 'package:flutter_lib/views/page/list_page.dart';
import 'package:flutter_lib/views/page/splash_page.dart';
import 'package:flutter_lib/views/widgets/float_menu_view.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {

      /// MAIN
      case RouteName.main:
        return _materialRoute(const SplashPage());
      case RouteName.homePage:
        return _materialRoute(const HomePage());
      case RouteName.listPage:
        return _materialRoute(const ListPage());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(
      builder: (_) => view,
    );
  }
}

class RouteName {
  static const String main = "/";
  static const String homePage = "/homePage";
  static const String listPage = "/listPage";
}
