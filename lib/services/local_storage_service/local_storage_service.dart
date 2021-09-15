import 'package:flutter_lib/model/account.dart';
import 'package:flutter_lib/model/language.dart';
import 'package:hive/hive.dart';

class StorageService {
  String _firstRun = "firstRun";
  String _currentUser = "currentUser";
  String _theme = "theme";
  String _language = "language";

  Box _appBox;
  StorageService(
      {required Box appBox})
      : _appBox = appBox;

  bool? getFirstRun() {
    var isFirstRun = _appBox.get(_firstRun, defaultValue: false);
    return isFirstRun;
  }

  void setFirstRun() {
    _appBox.put(_firstRun, false);
  }

  Account? getAccount() {
    var account = _appBox.get(_currentUser, defaultValue: null);
    return account;
  }

  Future<void> setAccount(Account account) async{
    await _appBox.put(_currentUser, account);
  }

  bool getTheme() {
    var theme = _appBox.get(_theme, defaultValue: false);
    return theme;
  }

  Future<void> setTheme(bool isDark) async{
    await _appBox.put(_theme, isDark);
  }

  LanguageApp getLanguage() {
    var account = _appBox.get(_language, defaultValue: LanguageApp.en);
    return account;
  }

  Future<void> setLanguage(LanguageApp language) async{
    await _appBox.put(_language, language);
  }

  Future<void> removeAuth() async {
    await _appBox.delete(_currentUser);
  }

  Future<void> closeBoxes() async {
    await _appBox.compact();
    await _appBox.close();
  }
}
