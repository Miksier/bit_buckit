import 'package:bucqit/config/config.dart';
import 'package:bucqit/models/pull_requestDTO.dart';
import 'package:bucqit/ui/Widgets/avatar.dart';
import 'package:bucqit/ui/Widgets/reviewers_list.dart';
import 'package:bucqit/ui/Widgets/tasks_list.dart';
import 'package:flutter/material.dart';

class PullRequestTile extends StatelessWidget {
  const PullRequestTile({Key key, @required this.pr, @required this.onTap})
      : super(key: key);

  final PullRequestDTO pr;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey,
        )),
        child: Container(
          color: pr.properties.mergeResult.outcome == "CONFLICTED"
              ? AppColors.conflictColor
              : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: <Widget>[
                Avatar(
                  url: pr.author.user.avatarUrl,
                  size: 40,
                  status: "",
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          pr.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(pr.author.user.displayName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12)),
                            ),
                            Row(
                              children: <Widget>[
                                if (pr.properties.commentCount != null &&
                                    pr.properties.commentCount > 0)
                                  Row(
                                    children: <Widget>[
                                      Text(pr.properties.commentCount
                                          .toString()),
                                      Icon(Icons.comment),
                                    ],
                                  ),
                                if (pr.properties.openTaskCount != null &&
                                    pr.properties.openTaskCount > 0)
                                  TasksList(pr.properties.openTaskCount),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ReviewersList(
                  reviewers: pr.reviewers,
                  shownAvatars: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
