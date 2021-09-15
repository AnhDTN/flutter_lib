import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lib/providers/bottom_menu_provider.dart';
import 'package:provider/provider.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {

  BottomNavigationBarItem _bottomNavigationBarItem(
      {BuildContext? context, String? imagePath, String? label, IconData? icon}) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 24,),
      label: label,
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: context.watch<BottomMenuProvider>().index,
          selectedLabelStyle: TextStyle(color: Colors.red),
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red,
          unselectedIconTheme:
          IconThemeData(color: Colors.black),
          selectedIconTheme:
          IconThemeData(color: Colors.red),
          onTap: (int index) {
            context.read<BottomMenuProvider>().indexBottomBarChange(index);
          },
          items: [
            _bottomNavigationBarItem(
                context: context, icon: Icons.home_outlined, label: "Home"),
            _bottomNavigationBarItem(
                context: context, icon: Icons.calendar_today_outlined, label: "L.Học"),
            _bottomNavigationBarItem(
                context: context, icon: Icons.folder_open, label: "T.Liệu"),
            _bottomNavigationBarItem(
                context: context, icon: Icons.storefront, label: "Shop"),
            _bottomNavigationBarItem(
                context: context, icon: Icons.account_circle_outlined, label: "TK"),
          ],
        ),
    );
  }
}
