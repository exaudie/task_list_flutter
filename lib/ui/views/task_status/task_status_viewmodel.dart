import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../infrastructure/databases/task_status/task_status_db.dart';
import '../../../infrastructure/models/task_status_model.dart';
import '../../../infrastructure/services/local_db_service.dart';

class TaskStatusViewModel extends FutureViewModel {
  final _localDbService = locator<LocalDbService>();
  final _snackbarService = SnackbarService();

  final formKey = GlobalKey<FormState>();
  final taskStatusController = TextEditingController();
  final taskStatusFocusNode = FocusNode();

  List<TaskStatusModel>? taskStatusList;

  @override
  Future futureToRun() async {
    await _getTaskStatus();
  }

  Future<void> _getTaskStatus() async {
    List<TaskStatusDb>? taskStatusDbList = await _localDbService.getTaskStatus();
    taskStatusList = taskStatusDbList?.map((e) => TaskStatusModel.fromDb(taskStatusDb: e)).toList();
  }

  Future<void> _deleteTaskStatus({required TaskStatusModel taskStatus}) async {
    for (var i = 0; i < taskStatusList!.length; i++) {
      TaskStatusModel itm = taskStatusList!.elementAt(i);
      if (itm.statusId == taskStatus.statusId) {
        await _localDbService.removeTaskStatusByIndex(i);

        break;
      }
    }
  }

  Future<void> _addTaskStatus() async {
    String statusName = taskStatusController.text;
    await _localDbService.storeTaskStatus(TaskStatusDb(statusName: statusName));
    taskStatusController.clear();
    taskStatusFocusNode.unfocus();
  }

  Future<void> onPressedAddStatus() async {
    if (!(formKey.currentState != null && formKey.currentState!.validate())) return;

    await _addTaskStatus();
    await _getTaskStatus();
    notifyListeners();
    _snackbarService.showSnackbar(
      message: 'Simpan status berhasil',
      duration: const Duration(seconds: 2),
    );
  }

  Future<void> onPressedDeleteStatus(TaskStatusModel? taskStatus) async {
    // TODO: add confirmation before delete task status
    if (taskStatus == null || taskStatusList == null) return;

    await _deleteTaskStatus(taskStatus: taskStatus);
    await _getTaskStatus();
    notifyListeners();
    _snackbarService.showSnackbar(
      message: 'Hapus status berhasil',
      duration: const Duration(seconds: 2),
    );
  }
}
