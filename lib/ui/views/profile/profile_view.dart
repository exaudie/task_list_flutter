import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../infrastructure/helpers/localize_app.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();

  @override
  Widget builder(BuildContext context, ProfileViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizeApp.texts.titlePageProfile),
      ),
      body: Center(
        child: Column(
          children: [
            Text(LocalizeApp.texts.titlePageProfile),
            ElevatedButton(onPressed:viewModel.onPressedToHome, child: Text(LocalizeApp.texts.titlePageHome))
          ],
        ),
      ),
    );
  }
}
