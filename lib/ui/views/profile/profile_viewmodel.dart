import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../infrastructure/mixins/bottom_navi_model.dart';

class ProfileViewModel extends BaseViewModel with BottomNaviModel {


  void onPressedToHome() =>onTapNavi(0);
}
