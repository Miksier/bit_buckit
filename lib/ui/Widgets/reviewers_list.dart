import 'package:bucqit/models/reviewerDTO.dart';
import 'package:flutter/material.dart';

import 'activity_container.dart';
import 'avatar.dart';

class ReviewersList extends StatelessWidget {
  const ReviewersList(
      {Key key,
      this.reviewers,
      this.shownAvatars = 1,
      this.shouldShowDialog = false})
      : super(key: key);

  final List<ReviewerDTO> reviewers;
  final int shownAvatars;
  final bool shouldShowDialog;

  @override
  Widget build(BuildContext context) {
    var avatars = List<Widget>();
    for (var i = 0; i < reviewers.length; i++) {
      if (reviewers.length > shownAvatars && i == shownAvatars - 1) {
        avatars.add(buildMoreAvatar(reviewers.length - (shownAvatars - 1)));
        break;
      }
      avatars.add(Avatar(
          url: reviewers[i].user.avatarUrl,
          size: 40,
          status: reviewers[i].status));
    }

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
      child: Container(
        width: avatars.length * 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[...avatars],
        ),
      ),
    );
  }

  buildMoreAvatar(int reviewersCount) {
    return Container(
      width: 40,
      height: 40,
      decoration: new BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Center(child: Text("+${reviewersCount}")),
    );
  }

  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: reviewers?.length ?? 0,
            itemBuilder: (c, i) {
              final reviewer = reviewers[i];
              return ActivityContainer(
                child: Row(
                  children: <Widget>[
                    Avatar(
                      size: 35.0,
                      url: reviewer.user.avatarUrl,
                      status: reviewer.status,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:16.0),
                      child: Expanded(
                          child: Text(
                        reviewer.user.displayName,
                       
                      )),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
