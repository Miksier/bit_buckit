import 'package:flutter/material.dart';

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({
    this.width,
    this.height,
    this.child,
    Key key,
  }) : super(key: key);

  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[500], width: 0.5))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}