import 'package:flutter/material.dart';
import 'package:gregory/utils/app_colors.dart';

class ArrowButton extends StatelessWidget {
  final Function onTap;
  final bool isBack;
  const ArrowButton({Key key, this.onTap, this.isBack = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Icon(
          isBack ? Icons.arrow_back : Icons.arrow_forward,
          color: kSecondaryColor,
        ),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            // color: Colors.black,
            border: Border.all(color: kSecondaryColor),
            shape: BoxShape.circle),
      ),
    );
  }
}
