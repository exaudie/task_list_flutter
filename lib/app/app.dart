import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../infrastructure/services/apis/authentication_api_service.dart';
import '../infrastructure/services/apis/transaction_api_service.dart';
import '../infrastructure/services/local_db_service.dart';
import '../ui/views/dashboard/dashboard_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/settings/settings_view.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/task/task_view.dart';
import '../ui/views/task_status/task_status_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: TaskView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: TaskStatusView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: LocalDbService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationApiService),
    LazySingleton(classType: TransactionApiService),
// @stacked-service
  ],
)
class App {}
