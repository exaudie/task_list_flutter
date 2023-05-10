import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:task_list/infrastructure/helpers/app_colors.dart';

import '../../../infrastructure/helpers/app_local.dart';
import '../../../infrastructure/helpers/app_text_style.dart';
import '../../../infrastructure/helpers/app_ui.dart';
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
            Text(AppLocal.texts.logo, style: AppTextStyle.text40w900),
            Text(AppLocal.texts.appName, style: AppTextStyle.text18w900),
            AppUi.verticalSpace(24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppLocal.texts.labelLoading, style: AppTextStyle.text16w400),
                AppUi.horizontalSpace(16),
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: AppColors.kcDarkGreyColor,
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
