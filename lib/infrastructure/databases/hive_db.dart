import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../services/local_db_service.dart';
import 'settings/settings_db.dart';
import 'tasks/tasks_db.dart';

class HiveDb {
  static Future init() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(TasksDbAdapter());
    Hive.registerAdapter(SettingsDbAdapter());

    await Hive.openBox<TasksDb>(LocalDbService.tasksBox);
    await Hive.openBox<SettingsDb>(LocalDbService.settingsBox);
  }
}
