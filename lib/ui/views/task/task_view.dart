import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task_list/infrastructure/helpers/validate_field_app.dart';

import '../../../infrastructure/helpers/ui_app.dart';
import '../../shared/text_field_app.dart';
import 'task_viewmodel.dart';

class TaskView extends StackedView<TaskViewModel> {
  const TaskView({super.key});

  @override
  TaskViewModel viewModelBuilder(BuildContext context) => TaskViewModel();

  @override
  Widget builder(BuildContext context, TaskViewModel viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: viewModel.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tasks Code'),
                  SizedBox(
                    width: 100,
                    child: TextFieldApp(
                      controller: viewModel.taskCodeController,
                    ),
                  ),
                  UiApp.verticalSpace(16),
                  const Text('Point'),
                  SizedBox(
                    width: 50,
                    child: TextFieldApp(
                      controller: viewModel.taskPointController,
                    ),
                  ),
                  UiApp.verticalSpace(16),
                  const Text('Title'),
                  TextFieldApp(
                    controller: viewModel.taskTitleController,
                    validator: (value) => ValidateFieldApp.validateRequired(value),
                  ),
                  UiApp.verticalSpace(16),
                  const Text('Description'),
                  TextFieldApp(
                    controller: viewModel.taskDescController,
                  ),
                  UiApp.verticalSpace(16),
                  const Text('Status'),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField<int>(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(),
                      ),
                      value: 1,
                      items: const [
                        DropdownMenuItem(value: 1, child: Text('to do')),
                      ],
                      onChanged: (value) {
                        log('$value', name: 'value dropdown');
                      },
                    ),
                  ),
                  UiApp.verticalSpace(24),
                  ElevatedButton(onPressed: viewModel.onPressedSaveTask, child: const Text('Save'))
                ],
              ),
            ),
          ),
        ));
  }
}
