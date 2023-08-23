import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_list/app/app.router.dart';
import 'package:task_list/infrastructure/models/task_model.dart';
import 'package:task_list/infrastructure/services/local_db_service.dart';

import '../../../app/app.locator.dart';
import '../../../infrastructure/databases/settings/settings_db.dart';
import '../../../infrastructure/enums/bottom_sheet_type.dart';
import '../../../infrastructure/enums/dialog_type.dart';
import '../../../infrastructure/enums/menu_home.dart';
import '../../../infrastructure/helpers/localize_app.dart';

class HomeViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _localDbService = locator<LocalDbService>();

  final searchController = TextEditingController();

  List<TaskModel> taskList = [];

  String get counterLabel => 'Counter is: $_counter';

  bool isSearch = false;
  int _counter = 0;

  @override
  Future futureToRun() async {
    await initTaskListView();
  }

  Future<void> initTaskListView() async {
    var tasks = await _localDbService.getTasks();

    if (tasks == null) return;
    developer.log('${tasks.length}');
    taskList = List.from(tasks.map((e) => TaskModel.formStorage(e)));
    developer.log('${taskList.length}');
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: LocalizeApp.texts.ksHomeBottomSheetTitle,
      description: LocalizeApp.texts.ksHomeBottomSheetDescription,
    );
  }

  void onPressedToggleSearch() {
    searchController.text = "";
    isSearch = !isSearch;
    notifyListeners();
  }

  void onSelectedPopupMenu(MenuHome value) {
    switch (value) {
      case MenuHome.addTask:
        _toAddTask();
        break;
      case MenuHome.period:
        _navigationService.navigateTo(Routes.taskView);
        break;
      case MenuHome.setting:
        _toSettingTask();
        break;
    }
  }

  void _toSettingTask() => _navigationService.navigateTo(Routes.settingsView);

  Future<void> _toAddTask() async {
    final SettingsDb? settings = await _localDbService.getSettings();
    final String prefixCode = settings?.prefixCode ?? '';

    if (prefixCode == '') return _toSettingTask();

    _navigationService.navigateTo(Routes.taskView);
  }
}
