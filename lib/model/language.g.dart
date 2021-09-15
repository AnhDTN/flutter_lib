// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguageAppAdapter extends TypeAdapter<LanguageApp> {
  @override
  final int typeId = 1;

  @override
  LanguageApp read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LanguageApp.en;
      case 1:
        return LanguageApp.vi;
      default:
        return LanguageApp.en;
    }
  }

  @override
  void write(BinaryWriter writer, LanguageApp obj) {
    switch (obj) {
      case LanguageApp.en:
        writer.writeByte(0);
        break;
      case LanguageApp.vi:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageAppAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
