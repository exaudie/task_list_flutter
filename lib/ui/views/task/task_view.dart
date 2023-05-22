import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'task_viewmode.dart';

class TaskView extends StackedView<TaskViewModel> {
  const TaskView({super.key});

  @override
  TaskViewModel viewModelBuilder(BuildContext context) => TaskViewModel();

  @override
  Widget builder(BuildContext context, TaskViewModel viewModel, Widget? child) {
    return Scaffold(
      body: ListView(
        children: [],
      ),
     );
  }
}
