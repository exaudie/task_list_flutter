import 'package:stacked/stacked.dart';
import 'package:task_list/infrastructure/mixins/bottom_navi_model.dart';

import '../../../app/app.locator.dart';

class DashboardViewModel extends BaseViewModel with BottomNaviModel {
  @override
  void onTapNavi(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
