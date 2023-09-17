import '../databases/task_status/task_status_db.dart';

class TaskStatusModel extends TaskStatusDb {
  TaskStatusModel({String? statusId, String? statusName}) : super(statusId: statusId, statusName: statusName);

  factory TaskStatusModel.fromDb({TaskStatusDb? taskStatusDb}) =>
      TaskStatusModel(statusId: taskStatusDb?.statusId, statusName: taskStatusDb?.statusName);

  toDb() => TaskStatusDb(statusId: statusId, statusName: statusName);
}
