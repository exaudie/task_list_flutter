import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../infrastructure/helpers/app_local.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();

  @override
  Widget builder(BuildContext context, ProfileViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.texts.titlePageProfile),
      ),
      body: Center(
        child: Column(
          children: [
            Text(AppLocal.texts.titlePageProfile),
            ElevatedButton(onPressed:viewModel.onPressedToHome, child: Text(AppLocal.texts.titlePageHome))
          ],
        ),
      ),
    );
  }
}
