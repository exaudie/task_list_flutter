import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_list/app/app.router.dart';

import '../../../app/app.locator.dart';
import '../../../infrastructure/enums/bottom_sheet_type.dart';
import '../../../infrastructure/enums/dialog_type.dart';
import '../../../infrastructure/enums/menu_home.dart';
import '../../../infrastructure/helpers/app_local.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final searchController = TextEditingController();

  String get counterLabel => 'Counter is: $_counter';

  bool isSearch = false;
  int _counter = 0;

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
      title: AppLocal.texts.ksHomeBottomSheetTitle,
      description: AppLocal.texts.ksHomeBottomSheetDescription,
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
        _navigationService.navigateTo(Routes.taskView);
        break;
    }
  }
}
