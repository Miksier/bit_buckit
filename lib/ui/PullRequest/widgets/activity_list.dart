import 'package:bucqit/models/commentDTO.dart';
import 'package:bucqit/models/pullRequestActionDTO.dart';
import 'package:bucqit/ui/PullRequest/widgets/activity_needs_work.dart';
import 'package:bucqit/ui/PullRequest/widgets/activity_opened.dart';
import 'package:bucqit/ui/PullRequest/widgets/activity_reviewer.dart';
import 'package:bucqit/ui/PullRequest/widgets/bloc/activitylist_bloc.dart';
import 'package:bucqit/ui/PullRequest/widgets/reply_dialog.dart';
import 'package:bucqit/ui/Widgets/base_widget.dart';
import 'package:bucqit/ui/Widgets/infinite_list.dart';
import 'package:flutter/material.dart';

import 'activity_aproved.dart';
import 'activity_unaproved.dart';
import 'comment_tree.dart';

class ActivityList extends StatelessWidget {
  final ActivitylistBloc bloc;


  const ActivityList({@required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      bloc: bloc,
      contentBuilder: (s) {
        final activities = s.data as List<PullRequestActionDTO>;
        return InfiniteList(
          bloc: bloc,
            itemCount: activities.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (c, i) {
              final PullRequestActionDTO activity = activities[i];
              Widget acivity;
              switch (activity.action) {
                case "COMMENTED":
                  acivity = CommentTree(
                    comment: activity.comment,
                    onPressed: (BuildContext context, CommentDTO c) async {
                      final value = await Navigator.of(context)
                          .push(MaterialPageRoute<bool>(
                              builder: (BuildContext context) {
                                return ReplyDialog(
                                  baseComment: c,
                                );
                              },
                              fullscreenDialog: true));
                      if (value != null && value == true) {
                        bloc.add(const LoadActivities());
                      }
                    },
                  );
                  break;
                case "UPDATED":
                  acivity = ActivityReviewer(action: activity);
                  break;
                case "UNAPPROVED":
                  acivity = ActivityUnaproved(action: activity);
                  break;
                case "APPROVED":
                  acivity = ActivityAproved(action: activity);
                  break;
                case "OPENED":
                  acivity = ActivityOpened(action: activity);
                  break;
                case "REVIEWED":
                  acivity = ActivityNeedsWork(action: activity);
                  break;
                default:
                  acivity = Text(activity.action);
                  break;
              }
              return Column(
                children: <Widget>[
                  acivity,
                  if (activity.action != "COMMENTED")
                    Divider(
                      color: Colors.grey,
                    ),
                ],
              );
            });
      },
    );
  }
}
