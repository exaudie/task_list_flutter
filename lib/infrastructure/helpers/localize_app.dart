import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizeApp {
  static AppLocalizations get texts {
    BuildContext? context = StackedService.navigatorKey?.currentContext;
    return AppLocalizations.of(context!)!;
  }
}
