import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../infrastructure/constants/menu_items.dart';
import '../../../infrastructure/enums/menu_home.dart';
import '../../../infrastructure/helpers/colors_app.dart';
import '../../../infrastructure/helpers/ui_app.dart';
import '../../../infrastructure/models/task_model.dart';
import 'home_viewmodel.dart';
import 'widgets/task_item.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: _titleAppBar(viewModel),
        elevation: 0,
        backgroundColor: ColorsApp.kcLightGrey,
        actions: [
          viewModel.isSearch
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: viewModel.onPressedToggleSearch,
                  icon: const Icon(Icons.search),
                ),
          _popupMenu(viewModel),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _filterList(),
            _periodTask(),
            _progressTask(),
            verticalSpaceSmall,
            _taskList(viewModel),
          ],
        ),
      ),
    );
  }

  Widget _titleAppBar(HomeViewModel viewModel) => SizedBox(
        height: 36,
        child: viewModel.isSearch
            ? TextField(
                controller: viewModel.searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.only(top: 4, right: 12, left: 12),
                  hintText: 'search title or code',
                  suffixIcon: IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: viewModel.onPressedToggleSearch,
                    icon: const Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              )
            : const Align(
                alignment: Alignment.centerLeft,
                child: Text('Task List'),
              ),
      );

  Widget _filterItem({required String label, bool selected = false}) => Container(
        decoration: BoxDecoration(
          color: selected ? ColorsApp.kcVeryLightGrey : Colors.grey[100],
          borderRadius: BorderRadius.circular(18),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        child: Text(label),
      );

  Widget _filterList() => Container(
        alignment: Alignment.centerLeft,
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            _filterItem(label: 'All'),
            _filterItem(label: 'Active', selected: true),
            _filterItem(label: 'Backlog'),
          ],
        ),
      );

  Widget _progressTask() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: SizedBox(
                  height: 6,
                  child: LinearProgressIndicator(
                    value: 0.8,
                    backgroundColor: Colors.red[200],
                    color: Colors.green[400],
                  ),
                ),
              ),
            ),
            UiApp.horizontalSpace(16),
            const Text('80 / 100'),
          ],
        ),
      );

  Widget _periodTask() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Expanded(
                child: Text(
              '07 Mei 2023 - 14 Mei 2023',
              textAlign: TextAlign.center,
            )),
            IconButton(onPressed: () {}, icon: const Icon(Icons.date_range)),
          ],
        ),
      );

  Widget _taskList(HomeViewModel viewModel) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          TaskModel task = viewModel.taskList[index];
          return index == (viewModel.taskList.length)
              ? Divider(
                  color: Colors.grey[200],
                  thickness: 24,
                  height: 24,
                )
              : TaskItem(task: task);
        },
        itemCount: viewModel.taskList.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[200],
          thickness: 8,
          height: 8,
        ),
      ),
    );
  }

  Widget _popupMenu(HomeViewModel viewModel) => PopupMenuButton(
        icon: const Icon(Icons.menu),
        onSelected: viewModel.onSelectedPopupMenu,
        itemBuilder: (context) => List<PopupMenuEntry<MenuHome>>.from(
          MenuItems.popupMenuList.map(
            (element) => PopupMenuItem<MenuHome>(
              value: element['value'],
              child: Text(element['label']),
            ),
          ),
        ),
      );
}
