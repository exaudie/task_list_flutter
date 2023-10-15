import 'package:task_list/infrastructure/databases/tasks/tasks_db.dart';

class TaskModel {
  int? taskId;
  String? taskCode;
  String? taskTitle;
  String? taskDesc;
  int? taskPoint;
  int? taskStatus;
  DateTime? taskCreateDate;

  TaskModel({
    this.taskId,
    this.taskCode,
    this.taskTitle,
    this.taskDesc,
    this.taskPoint,
    this.taskStatus,
    this.taskCreateDate,
  });

  factory TaskModel.formStorage(TasksDb storage) {
    return TaskModel(
      taskId: storage.taskId,
      taskCode: storage.taskCode,
      taskTitle: storage.taskTitle,
      taskDesc: storage.taskDesc,
      taskPoint: storage.taskPoint,
      taskStatus: storage.taskStatus,
      taskCreateDate: storage.taskCreateDate,
    );
  }
}
