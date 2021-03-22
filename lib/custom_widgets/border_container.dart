import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color bgColor;
  final double padding;
  const BorderContainer(
      {Key key,
      this.child,
      this.color = Colors.white,
      this.bgColor,
      this.padding = 8.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: color)),
        child: child);
  }
}
