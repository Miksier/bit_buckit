import 'package:bucqit/models/commentDTO.dart';
import 'package:bucqit/models/userDTO.dart';
import 'package:bucqit/ui/Widgets/avatar.dart';
import 'package:bucqit/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

class ActivityComment extends StatelessWidget {
  const ActivityComment(
      {Key key, @required this.user, @required this.comment, this.onTap})
      : super(key: key);

  final UserDTO user;
  final CommentDTO comment;
  final Future Function(BuildContext, CommentDTO) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[400], width: 0.5))),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Avatar(
                      url: user.avatarUrl,
                      size: 40,
                      status: "",
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  comment.author.displayName,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateTimeUtil.fromTimeStamp(
                                      comment.createdDate),
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Container(
                              height: 8,
                            ),
                            Text(comment.text)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Icon(Icons.more_horiz),
                      onPressed: () {
                        //TODO move those actions to some popup on click with more
                        //FlatButton(child: Text("Create task"),onPressed: (){},),
                        // FlatButton(child: Text("Create Jira issue"),onPressed: (){},),
                        // FlatButton(child: Text("Like"),onPressed: (){},),
                      },
                    ),
                    FlatButton(
                      child: Text("Reply"),
                      onPressed: () {
                        if (onTap != null) onTap(context, comment);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          if (comment.tasks != null && comment.tasks.isNotEmpty)
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: comment.tasks?.length ?? 0,
                itemBuilder: (c, i) {
                  final task = comment?.tasks[i];
                  final taskClosed = task.state == "OPEN" ? false : true;
                  return Container(
                    height: 35,
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
        ],
      ),
    );
  }
}
