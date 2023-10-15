import 'package:hive/hive.dart';

part 'tasks_db.g.dart';

@HiveType(typeId: 0)
class TasksDb extends HiveObject {
  @HiveField(0)
  int? taskId;

  @HiveField(1)
  String? taskCode;

  @HiveField(2)
  String? taskTitle;

  @HiveField(3)
  String? taskDesc;

  @HiveField(4)
  int? taskPoint;

  @HiveField(5)
  int? taskStatus;

  @HiveField(6)
  DateTime? taskCreateDate;
}
