// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksDbAdapter extends TypeAdapter<TasksDb> {
  @override
  final int typeId = 0;

  @override
  TasksDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasksDb()
      ..taskId = fields[0] as int?
      ..taskCode = fields[1] as String?
      ..taskTitle = fields[2] as String?
      ..taskDesc = fields[3] as String?
      ..taskPoint = fields[4] as int?
      ..taskStatus = fields[5] as int?
      ..taskCreateDate = fields[6] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, TasksDb obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.taskId)
      ..writeByte(1)
      ..write(obj.taskCode)
      ..writeByte(2)
      ..write(obj.taskTitle)
      ..writeByte(3)
      ..write(obj.taskDesc)
      ..writeByte(4)
      ..write(obj.taskPoint)
      ..writeByte(5)
      ..write(obj.taskStatus)
      ..writeByte(6)
      ..write(obj.taskCreateDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
