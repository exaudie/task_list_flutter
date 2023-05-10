import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:task_list/infrastructure/databases/tasks/tasks_db.dart';

class HiveDb {
  static Future init() async {final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDir.path);

  Hive.registerAdapter(TasksDbAdapter());


  await Hive.openBox<TasksDb>('tasksBox');

  }
}
