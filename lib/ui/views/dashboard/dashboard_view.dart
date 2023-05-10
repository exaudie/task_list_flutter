import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task_list/ui/views/home/home_view.dart';
import 'package:task_list/ui/views/profile/profile_view.dart';

import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) => DashboardViewModel();

  @override
  Widget builder(BuildContext context, DashboardViewModel viewModel, Widget? child) {
    List<Widget> _widgetOptions = <Widget>[
      const HomeView(),
      const ProfileView(),
    ];
    return Scaffold(
      body: _widgetOptions.elementAt(viewModel.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.blue[300],
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.onTapNavi,
      ),
    );
  }
}
