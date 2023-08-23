import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../infrastructure/helpers/ui_app.dart';
import '../../../../infrastructure/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topItem(task),
          _titleItem(task?.taskTitle ?? ''),
          _descItem(task?.taskDesc),
          _bottomItem(task),
        ],
      ),
    );
  }

  Widget _itemStatus({required String label}) => Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      );

  Widget _topItem(TaskModel task) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(task?.taskCode ?? ''),
            const Spacer(),
            _itemStatus(label: '${task?.taskPoint ?? 0}'),
            horizontalSpaceSmall,
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            )
          ],
        ),
      );

  Widget _bottomItem(TaskModel task) => Padding(
        padding: const EdgeInsets.only(right: 16, top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.access_time,
              color: Colors.orange,
              size: 12,
            ),
            horizontalSpaceTiny,
            Text(
              DateFormat.yMd().format(task?.taskCreateDate ?? DateTime.now()),
              style: const TextStyle(fontSize: 12),
            ),
            horizontalSpaceTiny,
            _itemStatus(label: '${task?.taskStatus}'),
          ],
        ),
      );

  Widget _titleItem(String title) => Container(
        width: double.infinity,
        color: Colors.grey[100],
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget _descItem(String? desc) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          desc ?? 'Description ...',
          style: const TextStyle(color: Colors.grey),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
}
