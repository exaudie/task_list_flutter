// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsDbAdapter extends TypeAdapter<SettingsDb> {
  @override
  final int typeId = 1;

  @override
  SettingsDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsDb()..prefixCode = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, SettingsDb obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.prefixCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
