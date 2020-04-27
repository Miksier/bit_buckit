import 'package:bucqit/models/reviewerDTO.dart';
import 'package:flutter/material.dart';

import 'avatar.dart';

class ReviewersList extends StatelessWidget {
  const ReviewersList({Key key, this.reviewers, this.shownAvatars = 1})
      : super(key: key);

  final List<ReviewerDTO> reviewers;
  final int shownAvatars;

  @override
  Widget build(BuildContext context) {
    var avatars = List<Widget>();
    for (var i = 0; i < reviewers.length; i++) {
      if (reviewers.length > shownAvatars && i == shownAvatars - 1) {
        avatars.add(buildMoreAvatar(reviewers.length - (shownAvatars -1)));
        break;
      }
      avatars.add(Avatar(
          url: reviewers[i].user.avatarUrl,
          size: 40,
          status: reviewers[i].status));
    }

    return Container(
      width: avatars.length * 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[...avatars],
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
}
