import 'package:stacked/stacked.dart';

import '../../../infrastructure/mixins/bottom_navi_model.dart';

class ProfileViewModel extends BaseViewModel with BottomNaviModel {


  void onPressedToHome() =>onTapNavi(0);
}
