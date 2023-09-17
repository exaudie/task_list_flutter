// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_status_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskStatusDbAdapter extends TypeAdapter<TaskStatusDb> {
  @override
  final int typeId = 2;

  @override
  TaskStatusDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskStatusDb()
      ..statusId = fields[0] as String?
      ..statusName = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, TaskStatusDb obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.statusId)
      ..writeByte(1)
      ..write(obj.statusName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskStatusDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
