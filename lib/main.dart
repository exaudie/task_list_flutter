import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'app/app.bottomsheets.dart';
import 'app/app.dialogs.dart';
import 'app/app.locator.dart';
import 'app/my_app.dart';

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
