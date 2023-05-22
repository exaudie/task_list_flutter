import 'package:hive/hive.dart';

import '../databases/settings/settings_db.dart';
import '../databases/tasks/tasks_db.dart';

class LocalDbService {
  static const String tasksBox = "tasksBox";
  static const String settingsBox = "settingsBox";

  Future<void> storeTasks(TasksDb tasks) async {
    Box dataBox = Hive.box<TasksDb>(tasksBox);
    await dataBox.add(tasks);
  }

  Future<void> removeTasks() async {
    Box dataBox = Hive.box<TasksDb>(tasksBox);
    await dataBox.clear();
  }

  Future<TasksDb?> getTasks() async {
    try {
      Box dataBox = Hive.box<TasksDb>(tasksBox);
      if (dataBox.length > 0) {
        return await dataBox.getAt(0);
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
        return await dataBox.getAt(0);
      }
      return null;
    } on HiveError catch (_) {
      return null;
    }
  }
}
