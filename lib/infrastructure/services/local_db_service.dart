import 'package:hive/hive.dart';

import '../databases/tasks/tasks_db.dart';

class LocalDbService {
  Future<void> storeFirstLogin(TasksDb firstLogin) async {
    Box firstLoginBox = Hive.box<TasksDb>('tasksBox');
    await firstLoginBox.add(firstLogin);
  }

  Future<void> removeFirstLogin() async {
    Box firstLoginBox = Hive.box<TasksDb>('tasksBox');
    await firstLoginBox.clear();
  }

  Future<TasksDb?> getFirstLogin() async {
    try {
      Box firstLoginBox = Hive.box<TasksDb>('tasksBox');
      if (firstLoginBox.length > 0) {
        return await firstLoginBox.getAt(0);
      }
      return null;
    } on HiveError catch (_) {
      return null;
    }
  }
}
