import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) => SettingsViewModel();

  @override
  Widget builder(BuildContext context, SettingsViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
