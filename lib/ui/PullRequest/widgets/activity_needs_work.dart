import 'package:bucqit/config/config.dart';
import 'package:bucqit/models/pullRequestActionDTO.dart';
import 'package:bucqit/ui/Widgets/avatar.dart';
import 'package:bucqit/ui/Widgets/rounded_container.dart';
import 'package:flutter/material.dart';

class ActivityNeedsWork extends StatelessWidget {
  const ActivityNeedsWork({
    Key key,
    @required this.action,
  }) : super(key: key);

  final PullRequestActionDTO action;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Avatar(
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
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            const TextSpan(text: "marked the pull request as "),
                            WidgetSpan(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: AppColors.needsWorkBorderColor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(3.0))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 2),
                                child: Text(
                                  "NEEDS WORK",
                                  style: TextStyle(
                                      color: AppColors.needsWorkTextColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                          ]),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
