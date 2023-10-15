import 'dart:developer' as developer;

import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../databases/settings/settings_db.dart';
import '../databases/task_status/task_status_db.dart';
import '../databases/tasks/tasks_db.dart';

class LocalDbService {
  static const String tasksBox = "tasksBox";
  static const String settingsBox = "settingsBox";
  static const String taskStatusBox = 'taskStatusBox';

  Future<void> storeTasks(TasksDb tasks) async {
    Box dataBox = Hive.box<TasksDb>(tasksBox);
    tasks.taskId = dataBox.length + 1;
    tasks.taskCreateDate = DateTime.now();
    await dataBox.add(tasks);
  }

  Future<void> removeTasks() async {
    Box dataBox = Hive.box<TasksDb>(tasksBox);
    await dataBox.clear();
  }

  Future<Iterable?> getTasks() async {
    try {
      Box dataBox = Hive.box<TasksDb>(tasksBox);
      if (dataBox.length > 0) {
        return dataBox.values;
      }

      return null;
    } on HiveError catch (_) {
      return null;
    }
  }

  Future<int?> getLastTaskId() async {
    try {
      Box dataBox = Hive.box<TasksDb>(tasksBox);
      if (dataBox.length > 0) {
        return await dataBox.values.last.taskId;
      }

      return null;
    } on HiveError catch (_) {
      return null;
    }
  }

  Future<void> storeSettings(SettingsDb settings) async {
    Box dataBox = Hive.box<SettingsDb>(settingsBox);
    await dataBox.add(settings);
  }

  Future<void> removeSettings() async {
    Box dataBox = Hive.box<SettingsDb>(settingsBox);
    await dataBox.clear();
  }

  Future<SettingsDb?> getSettings() async {
    try {
      Box dataBox = Hive.box<SettingsDb>(settingsBox);
      if (dataBox.length > 0) {
        return await dataBox.values.first;
      }

      return null;
    } on HiveError catch (_) {
      return null;
    }
  }

  Future<bool> storeMultipleTaskStatus(List<TaskStatusDb> taskStatusList) async {
    Box dataBox = Hive.box<TaskStatusDb>(taskStatusBox);
    final save = await dataBox.addAll(taskStatusList);

    return (save.isNotEmpty);
  }

  Future<bool> storeTaskStatus(TaskStatusDb taskStatus) async {
    const uuid = Uuid();
    Box dataBox = Hive.box<TaskStatusDb>(taskStatusBox);
    taskStatus.statusId ??= uuid.v1();

    final save = await dataBox.add(taskStatus);
    developer.log("$save", name: "storeTaskStatus");
    return (!save.isNegative);
  }

  Future<void> removeAllTaskStatus() async {
    Box dataBox = Hive.box<TaskStatusDb>(taskStatusBox);
    await dataBox.clear();
  }

  Future<void> removeTaskStatusByIndex(int index) async {
    Box dataBox = Hive.box<TaskStatusDb>(taskStatusBox);
    await dataBox.deleteAt(index);
  }

  Future<List<TaskStatusDb>?> getTaskStatus() async {
    try {
      Box dataBox = Hive.box<TaskStatusDb>(taskStatusBox);

      if (dataBox.length > 0) {
        return dataBox.values.map<TaskStatusDb>((e) => e).toList();
      }

      return null;
    } on HiveError catch (_) {
      return null;
    }
  }
}
