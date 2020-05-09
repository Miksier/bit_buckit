import 'package:bucqit/models/pullRequestActionDTO.dart';
import 'package:bucqit/ui/Widgets/activity_container.dart';
import 'package:bucqit/ui/Widgets/avatar.dart';
import 'package:flutter/material.dart';

class ActivityReviewer extends StatelessWidget {
  const ActivityReviewer({
    Key key,
    @required this.action,
  }) : super(key: key);

  final PullRequestActionDTO action;

  @override
  Widget build(BuildContext context) {
    return ActivityContainer(
      height: action.removedReviewers.length * 56.0 +
          action.addedReviewers.length * 56.0 +
          0.5,
      child: Column(
        children: <Widget>[
          Container(
            height: action.addedReviewers.length * 40.0,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: action.addedReviewers.length,
                itemBuilder: (context, i) {
                  final reviewer = action.addedReviewers[i];
                  return Row(
                    children: <Widget>[
                      Avatar(
                        key: UniqueKey(),
                        url: reviewer.avatarUrl,
                        size: 40,
                        status: "",
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "${reviewer.displayName} ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const TextSpan(text: " joined as a reviewer"),
                          ])))
                    ],
                  );
                }),
          ),
          Container(
            height: action.removedReviewers.length * 40.0,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: action.removedReviewers.length,
                itemBuilder: (context, i) {
                  final reviewer = action.removedReviewers[i];
                  return Row(
                    children: <Widget>[
                      Avatar(
                        key: UniqueKey(),
                        url: reviewer.avatarUrl,
                        size: 40,
                        status: "",
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "${reviewer.displayName} ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const TextSpan(text: " is no longer a reviewer"),
                          ])))
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
