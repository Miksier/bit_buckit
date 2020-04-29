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
  final String pullRequestId;
  final String projectName;
  final String repositorySlug;

  const ActivityList(
      this.bloc, this.projectName, this.pullRequestId, this.repositorySlug);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      bloc: bloc,
      contentBuilder: (s) {
        final prActions = s.data as List<PullRequestActionDTO>;
        return InfiniteList(
            bloc: bloc,
            itemCount: prActions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (c, i) {
              final PullRequestActionDTO prAction = prActions[i];
              Widget activityWidget;
              switch (prAction.action) {
                case "COMMENTED":
                  activityWidget = CommentTree(
                    comment: prAction.comment,
                    onPressed: (BuildContext context, CommentDTO c) async {
                      final value = await Navigator.of(context)
                          .push(MaterialPageRoute<CommentDTO>(
                              builder: (BuildContext context) {
                                return ReplyDialog(
                                  baseComment: c,
                                );
                              },
                              fullscreenDialog: true));
                      if (value != null) {
                        bloc.add(AddComment(message: value.text,parent: value.parent));
                        bloc.add(const ReloadActivities());
                      }
                    },
                  );
                  break;
                case "UPDATED":
                  activityWidget = ActivityReviewer(action: prAction);
                  break;
                case "UNAPPROVED":
                  activityWidget = ActivityUnaproved(action: prAction);
                  break;
                case "APPROVED":
                  activityWidget = ActivityAproved(action: prAction);
                  break;
                case "OPENED":
                  activityWidget = ActivityOpened(action: prAction);
                  break;
                case "REVIEWED":
                  activityWidget = ActivityNeedsWork(action: prAction);
                  break;
                default:
                  activityWidget = Text(
                      "There should be some specific widget for this action :${prAction.action}, but there isnt :(");
                  break;
              }
              return activityWidget;
            });
      },
    );
  }
}
