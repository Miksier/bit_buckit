import 'package:bucqit/config/config.dart';
import 'package:bucqit/models/pullRequestActionDTO.dart';
import 'package:bucqit/ui/Widgets/activity_container.dart';
import 'package:bucqit/ui/Widgets/avatar.dart';
import 'package:bucqit/ui/Widgets/rounded_container.dart';
import 'package:flutter/material.dart';

class ActivityAproved extends StatelessWidget {
  const ActivityAproved({
    Key key,
    @required this.action,
  }) : super(key: key);

  final PullRequestActionDTO action;

  @override
  Widget build(BuildContext context) {
    return ActivityContainer(
      child: Row(
        children: <Widget>[
          Avatar(
            key: UniqueKey(),
            url: action.user.avatarUrl,
            size: 40,
            status: "",
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "${action.user.displayName} ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: "marked the pull request as "),
                      WidgetSpan(
                          child: RoundedContainer(
                        color: AppColors.approvedColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 2),
                          child: Text(
                            "APPROVED",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                    ]),
                  ))),
        ],
      ),
    );
  }
}
