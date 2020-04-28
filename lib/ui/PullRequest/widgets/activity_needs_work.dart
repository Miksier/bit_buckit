import 'package:bucqit/config/config.dart';
import 'package:bucqit/models/pullRequestActionDTO.dart';
import 'package:bucqit/ui/Widgets/activity_container.dart';
import 'package:bucqit/ui/Widgets/avatar.dart';
import 'package:flutter/material.dart';

class ActivityNeedsWork extends StatelessWidget {
  const ActivityNeedsWork({
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
            url: action.user.avatarUrl,
            size: 40,
            status: "",
          ),
          buildMessage(),
        ],
      ),
    );
  }

  Expanded buildMessage() {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "${action.user.displayName} ",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: "marked the pull request as "),
                WidgetSpan(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.needsWorkBorderColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(3.0))),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                    child: Text(
                      "NEEDS WORK",
                      style: TextStyle(
                          color: AppColors.needsWorkTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
              ]),
            )));
  }
}
