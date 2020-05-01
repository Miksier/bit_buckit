import 'package:bucqit/models/taskDTO.dart';
import 'package:flutter/material.dart';

import 'activity_container.dart';

class TasksList extends StatelessWidget {
  final int taskCount;
  final List<TaskDTO> tasks;
  final int activeTasks;
  final bool shouldShowDialog;

  const TasksList(this.taskCount,
      {this.activeTasks, this.tasks, this.shouldShowDialog = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!shouldShowDialog) return;
        showDialog(
          context: context,
          builder: (context) {
            return buildAlertDialog(context);
          },
        );
      },
      child: Row(
        children: <Widget>[
          if (activeTasks != null)
            Text("${activeTasks.toString()}/${taskCount.toString()}")
          else
            Text(taskCount.toString()),
          Icon(
            Icons.check_box,
            size: 20,
          ),
        ],
      ),
    );
  }

  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: tasks?.length ?? 0,
            itemBuilder: (c, i) {
              final task = tasks[i];
              final taskClosed = task.state == "OPEN" ? false : true;
              return ActivityContainer(
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: taskClosed,
                      onChanged: (b) {},
                    ),
                    Expanded(
                        child: Text(
                      task.text,
                      style: TextStyle(
                          decoration: taskClosed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    )),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
