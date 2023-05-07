import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'app/app.locator.dart';
import 'app/my_app.dart';
import 'infrastructure/services/setup/bottomsheets_setup.dart';
import 'infrastructure/services/setup/dialogs_setup.dart';

void main() {
  runZonedGuarded(() {
    setupLocator();
    setupDialogUi();
    setupBottomSheetUi();

    runApp(const MyApp());
  }, (error, stack) {
    developer.log(name: 'runApp', '$error $stack');
  });
}
