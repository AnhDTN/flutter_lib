import 'package:hive_flutter/hive_flutter.dart';
part 'language.g.dart';
@HiveType(typeId: 1)
enum LanguageApp {
  @HiveField(0)
  en,
  @HiveField(1)
  vi
}
