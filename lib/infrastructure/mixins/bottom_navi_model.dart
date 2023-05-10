import 'package:stacked/stacked.dart';

mixin BottomNaviModel on BaseViewModel {
  // static final BottomNaviModel _instance = BottomNaviModel._internal();
  //
  // factory BottomNaviModel() => _instance;
  //
  // BottomNaviModel._internal();

  int currentIndex = 0;

  void onTapNavi(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
