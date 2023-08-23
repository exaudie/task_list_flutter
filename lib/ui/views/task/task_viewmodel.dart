import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../infrastructure/databases/tasks/tasks_db.dart';
import '../../../infrastructure/services/local_db_service.dart';

class TaskViewModel extends FutureViewModel {
  final _localDbService = locator<LocalDbService>();

  final formKey = GlobalKey<FormState>();
  final taskCodeController = TextEditingController();
  final taskTitleController = TextEditingController();
  final taskDescController = TextEditingController();
  final taskPointController = TextEditingController();

  @override
  Future futureToRun() async {
    await initSettings();
  }

  Future<void> initSettings() async {
    final settings = await _localDbService.getSettings();
    final lastTaskId = await _localDbService.getLastTaskId() ?? 0;
    await _localDbService.getTasks();

    taskCodeController.text = '${settings?.prefixCode ?? ''} - ${lastTaskId + 1}';
  }

  void onPressedSaveTask() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      TasksDb task = TasksDb();
      task.taskCode = taskCodeController.text;
      task.taskTitle = taskTitleController.text;
      task.taskDesc = taskDescController.text;
      task.taskPoint = int.tryParse(taskPointController.text) ?? 0;
      await _localDbService.storeTasks(task);

      var snackbaar = SnackbarService();
      snackbaar.showSnackbar(message: 'saved task');
    }
  }
}
