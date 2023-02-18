import 'package:mockito/annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_list/app/app.locator.dart';
import 'package:task_list/infrastructure/services/apis/authentication_api_service.dart';
import 'package:task_list/infrastructure/services/apis/transaction_api_service.dart';

// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthenticationApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TransactionApiService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
// @stacked-mock-register
}

// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
