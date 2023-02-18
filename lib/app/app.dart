import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../infrastructure/services/apis/authentication_api_service.dart';
import '../infrastructure/services/apis/transaction_api_service.dart';
import '../ui/customs/bottom_sheets/notice/notice_sheet.dart';
import '../ui/customs/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/startup/startup_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationApiService),
    LazySingleton(classType: TransactionApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
