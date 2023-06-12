import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../infrastructure/services/local_db_service.dart';

class TaskViewModel extends FutureViewModel {
  final _localDbService = locator<LocalDbService>();

  final formKey = GlobalKey<FormState>();
  final taskCodeController = TextEditingController();
  final pointController = TextEditingController();

  var titleController;

  var descController;

  @override
  Future futureToRun() async {
    initSettings();
  }

  Future<void> initSettings() async {
    final settings = await _localDbService.getSettings();
    final lastTaskId = await _localDbService.getLastTaskId() ?? 0;

    taskCodeController.text = '${settings?.prefixCode ?? ''} - ${lastTaskId + 1}';
  }

  void onPressedSaveTask() {}
}
