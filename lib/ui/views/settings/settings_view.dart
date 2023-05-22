import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../infrastructure/helpers/colors_app.dart';
import '../../../infrastructure/helpers/localize_app.dart';
import '../../../infrastructure/helpers/validate_field_app.dart';
import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) => SettingsViewModel();

  @override
  Widget builder(BuildContext context, SettingsViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            onPressed: viewModel.onPressedSettings,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: viewModel.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocalizeApp.texts.labelPrefixCode),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      border: const OutlineInputBorder(),
                      hintText: 'XXQE',
                      filled: true,
                      fillColor: viewModel.prefixCodeController.text.isNotEmpty ? ColorsApp.kcLightGrey : Colors.white,
                    ),
                    controller: viewModel.prefixCodeController,
                    enableInteractiveSelection: viewModel.prefixCodeController.text.isNotEmpty,
                    readOnly: viewModel.prefixCodeController.text.isNotEmpty,
                    validator: (value) => ValidateFieldApp.validatePrefixCode(value),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
