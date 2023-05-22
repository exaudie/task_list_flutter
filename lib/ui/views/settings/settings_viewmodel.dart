import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../infrastructure/databases/settings/settings_db.dart';
import '../../../infrastructure/services/local_db_service.dart';

class SettingsViewModel extends FutureViewModel {
  final _localDbService = locator<LocalDbService>();

  final formKey = GlobalKey<FormState>();
  final prefixCodeController = TextEditingController();

  @override
  Future futureToRun() async {
    await initSettings();
  }

  Future<void> initSettings() async {
    final settings = await _localDbService.getSettings();
    prefixCodeController.text = settings?.prefixCode ?? '';
  }

  Future<void> onPressedSettings() async {
    SettingsDb settings = SettingsDb();
    settings.prefixCode = prefixCodeController.text;

    await _localDbService.removeSettings();
    await _localDbService.storeSettings(settings);
    notifyListeners();
  }
}
