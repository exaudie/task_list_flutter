import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:uuid/uuid.dart';

import 'dart:developer' as developer;

import '../../app/app.locator.dart';
import '../services/local_db_service.dart';
import 'seeder.dart';
import 'settings/settings_db.dart';
import 'task_status/task_status_db.dart';
import 'tasks/tasks_db.dart';

class HiveDb {
  static Future init() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(TasksDbAdapter());
    Hive.registerAdapter(SettingsDbAdapter());
    Hive.registerAdapter(TaskStatusDbAdapter());

    await Hive.openBox<TasksDb>(LocalDbService.tasksBox);
    await Hive.openBox<SettingsDb>(LocalDbService.settingsBox);
    await Hive.openBox<TaskStatusDb>(LocalDbService.taskStatusBox);
  }

  static void setUpSettings() async {
    _setStatusDefault();
  }

  static Future<void> _setStatusDefault() async {
    final localDbService = locator<LocalDbService>();
    final taskStatus = await localDbService.getTaskStatus();

    if (taskStatus != null) return;

    const uuid = Uuid();
    List<TaskStatusDb> status = Seeder.taskStatus
        .map((e) => TaskStatusDb()
          ..statusName = e
          ..statusId = uuid.v1())
        .toList();
    localDbService.storeMultipleTaskStatus(status);
  }
}
