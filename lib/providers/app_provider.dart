import 'package:flutter/cupertino.dart';
import 'package:flutter_lib/model/job.dart';
import 'package:flutter_lib/model/language.dart';
import 'package:flutter_lib/repository/job_repo.dart';
import 'package:flutter_lib/services/local_storage_service/local_storage_service.dart';
import 'package:get_it/get_it.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    initApp();
  }

  final JobRepo _jobRepo = JobRepo();
  final StorageService _storageService = GetIt.I.get<StorageService>();

  LanguageApp _languageApp = LanguageApp.en;
  LanguageApp get languageApp => _languageApp;

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  List<Job>? get jobs => _jobs;
  List<Job>? _jobs;

  int get countJobs => _countJobs;
  int _countJobs = 0;
  void initApp() {
    _languageApp = _storageService.getLanguage();
    _isDarkTheme = _storageService.getTheme();
    notifyListeners();
  }

  void onChangeTheme(bool isDark) {
    _storageService.setTheme(isDark);
    _isDarkTheme = isDark;
    notifyListeners();
  }

  void onChangeLanguage(LanguageApp language) {
    _storageService.setLanguage(language);
    _languageApp = language;
    notifyListeners();
  }

  Future<void> getJobs(int page) async {
    var result = await _jobRepo.getJobs(page);
    if(page > 0) {
      _jobs!.addAll(result.data ?? []);
    } else {
      _jobs = result.data;
      _countJobs = result.count;
    }
    notifyListeners();
  }
}