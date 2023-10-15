import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'app/app.locator.dart';
import 'app/my_app.dart';
import 'infrastructure/databases/hive_db.dart';
import 'infrastructure/services/setup/bottomsheets_setup.dart';
import 'infrastructure/services/setup/dialogs_setup.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await HiveDb.init();

    await setupLocator();
    setupDialogUi();
    setupBottomSheetUi();
    HiveDb.setUpSettings();

    runApp(const MyApp());
  }, (error, stack) {
    developer.log(name: 'runAppMain', '$error $stack');
  });
}
