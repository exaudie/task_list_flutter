import 'package:hive/hive.dart';

part 'task_status_db.g.dart';

@HiveType(typeId: 2)
class TaskStatusDb extends HiveObject {
  @HiveField(0)
  String? statusId;

  @HiveField(1)
  String? statusName;

  TaskStatusDb({this.statusId, this.statusName});
}
