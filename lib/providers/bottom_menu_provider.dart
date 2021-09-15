import 'package:flutter/foundation.dart';

class BottomMenuProvider with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void indexBottomBarChange(int index) {
    _index = index;
    notifyListeners();
  }
}
