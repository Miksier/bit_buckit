import 'package:bucqit/config/config.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  const RoundedContainer({this.child,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.all(const Radius.circular(3.0))),
      child: child,
    );
  }
}
