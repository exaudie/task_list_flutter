import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import '../../../infrastructure/helpers/colors_app.dart';
import '../../../infrastructure/helpers/localize_app.dart';
import '../../../infrastructure/helpers/text_style_app.dart';
import '../../../infrastructure/helpers/ui_app.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) =>
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());

  @override
  Widget builder(BuildContext context, StartupViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(LocalizeApp.texts.logo, style: TextStyleApp.text40w900),
            Text(LocalizeApp.texts.appName, style: TextStyleApp.text18w900),
            UiApp.verticalSpace(24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(LocalizeApp.texts.labelLoading, style: TextStyleApp.text16w400),
                UiApp.horizontalSpace(16),
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: ColorsApp.kcDarkGreyColor,
                    strokeWidth: 3,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
