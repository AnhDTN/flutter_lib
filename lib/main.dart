import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_lib/model/language.dart';
import 'package:flutter_lib/providers/app_provider.dart';
import 'package:flutter_lib/resources/constants.dart';
import 'package:flutter_lib/resources/themes.dart';
import 'package:flutter_lib/services/app_service/dialog_service/dialog_manager.dart';
import 'package:flutter_lib/services/app_service/dialog_service/dialog_service.dart';
import 'package:flutter_lib/services/local_storage_service/local_storage_service.dart';
import 'package:flutter_lib/views/page/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

import 'model/account.dart';


class ImageCached extends ImageCache {
  @override
  void clear() {
    super.clear();
  }
}

class CustomWidgetsBinding extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() => ImageCached();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await setUp();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],
      child: const MyApp(
        title: 'Base App',
      )));
}

Future<void> setUp() async {
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(AccountAdapter())
    ..registerAdapter(LanguageAppAdapter());
  var _appBox = await Hive.openBox(Constants.appBox);
  GetIt.I.registerLazySingleton(() => StorageService(appBox: _appBox));
  GetIt.I.registerLazySingleton(() => DialogService());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, state, child) => MaterialApp(
          theme: state.isDarkTheme ? darkTheme : lightTheme,
          themeMode: ThemeMode.light,
          locale: state.languageApp == LanguageApp.vi ? const Locale('vi', '') :  const Locale('en', ''),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('vi', ''), // VietNam
            Locale('en', ''), // English
          ],
          builder: (context, child) => Navigator(
                onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => DialogManager(child: child!)),
              ),
          home: const SplashPage()),
    );
  }
}
