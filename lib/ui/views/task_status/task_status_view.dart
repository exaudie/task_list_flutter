import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../infrastructure/helpers/ui_app.dart';
import '../../../infrastructure/helpers/validate_field_app.dart';
import '../../../infrastructure/models/task_status_model.dart';
import '../../shared/text_field_app.dart';
import 'task_status_viewmodel.dart';

class TaskStatusView extends StackedView<TaskStatusViewModel> {
  const TaskStatusView({super.key});

  @override
  TaskStatusViewModel viewModelBuilder(BuildContext context) => TaskStatusViewModel();

  @override
  Widget builder(BuildContext context, TaskStatusViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Task Status',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _taskStatusList(viewModel),
              UiApp.verticalSpace(16),
              _taskStatusItemPlus(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _taskStatusList(TaskStatusViewModel viewModel) {
    List<Widget>? items = viewModel.taskStatusList?.map((e) => _taskStatusItem(viewModel, taskStatus: e)).toList();

    return Column(children: items ?? []);
  }

  Widget _taskStatusItem(TaskStatusViewModel viewModel, {TaskStatusModel? taskStatus}) => Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(taskStatus?.statusName ?? ""),
            ),
          ),
          IconButton(
            onPressed: () => viewModel.onPressedDeleteStatus(taskStatus),
            icon: const Icon(Icons.remove),
          ),
        ],
      );

  Widget _taskStatusItemPlus(TaskStatusViewModel viewModel) => Row(
        children: [
          Expanded(
            child: Form(
              key: viewModel.formKey,
              child: TextFieldApp(
                controller: viewModel.taskStatusController,
                focusNode: viewModel.taskStatusFocusNode,
                hintText: 'Enter Status Name',
                validator: (value) => ValidateFieldApp.validateRequired(value),
              ),
            ),
          ),
          IconButton(
            onPressed: viewModel.onPressedAddStatus,
            icon: const Icon(Icons.add),
          ),
        ],
      );
}
