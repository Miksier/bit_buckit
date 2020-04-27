import 'package:bucqit/models/pullRequestActionDTO.dart';
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
    return Container(
      height: action.removedReviewers.length * 40.0 +
          action.addedReviewers.length * 40.0,
      child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: <Widget>[
              Container(
                height: action.addedReviewers.length * 40.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: action.addedReviewers.length,
                    itemBuilder: (context, i) {
                      var reviewer = action.addedReviewers[0];
                      return Row(
                        children: <Widget>[
                          Avatar(
                            url: reviewer.avatarUrl,
                            size: 40,
                            status: "",
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "${reviewer.displayName} ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: " joined as a reviewer"),
                              ])))
                        ],
                      );
                    }),
              ),
              Container(
                height: action.removedReviewers.length * 40.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: action.removedReviewers.length,
                    itemBuilder: (context, i) {
                      var reviewer = action.removedReviewers[0];
                      return Row(
                        children: <Widget>[
                          Avatar(
                            url: reviewer.avatarUrl,
                            size: 40,
                            status: "",
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "${reviewer.displayName} ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: " is no longer a reviewer"),
                              ])))
                        ],
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
