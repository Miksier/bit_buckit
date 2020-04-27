import 'package:bucqit/config/config.dart';
import 'package:bucqit/models/pullRequestActionDTO.dart';
import 'package:bucqit/ui/Widgets/avatar.dart';
import 'package:flutter/material.dart';

class ActivityOpened extends StatelessWidget {
  const ActivityOpened({
    Key key,
    @required this.action,
  }) : super(key: key);

  final PullRequestActionDTO action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
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
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      WidgetSpan(
                          child: Container(
                        decoration: new BoxDecoration(
                            color: AppColors.openedPrBackgroundColor,
                            borderRadius: new BorderRadius.all(
                                const Radius.circular(3.0))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 2),
                          child: Text(
                            "OPENED",
                            style: TextStyle(
                                color: AppColors.openedPrTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                      TextSpan(text: " the pull request"),
                    ]),
                  ))),
        ],
      ),
    );
  }
}
