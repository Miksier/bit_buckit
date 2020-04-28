import 'package:bucqit/models/taskDTO.dart';
import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final int taskCount;
  final List<TaskDTO> tasks;
  final int activeTasks;
  final bool shoulShowDialog;

  const TasksList(this.taskCount,
      {this.activeTasks, this.tasks, this.shoulShowDialog = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!shoulShowDialog) return;
        showDialog(
          context: context,
          builder: (context) {
            return buildAlertDialog();
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

  AlertDialog buildAlertDialog() {
    return AlertDialog(
        content: SingleChildScrollView(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tasks?.length,
          itemBuilder: (c, i) {
            final task = tasks[i];
            final taskClosed = task.state == "OPEN" ? false : true;
            return Row(
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
            );
          }),
    ));
  }
}
