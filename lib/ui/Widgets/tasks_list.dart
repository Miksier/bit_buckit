import 'package:bucqit/models/taskDTO.dart';
import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final int taskCount;
  final List<TaskDTO> tasks;
  final int activeTasks;
  final bool shoulShowDialog;
  TasksList(this.taskCount,
      {this.activeTasks, this.tasks, this.shoulShowDialog = false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!shoulShowDialog) return;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                content: SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: tasks?.length,
                  itemBuilder: (c, i) {
                    var task = tasks[i];
                    var taskClosed = task.state == "OPEN" ? false : true;
                    return Container(
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
            ));
          },
        );
      },
      child: Row(
        children: <Widget>[
          activeTasks != null
              ? Text("${activeTasks.toString()}/${taskCount.toString()}")
              : Text(taskCount.toString()),
          Icon(Icons.check_box),
        ],
      ),
    );
  }
}
