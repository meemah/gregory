import 'package:flutter/material.dart';
import 'package:gregory/custom_widgets/white_text.dart';
import 'package:gregory/utils/app_colors.dart';

class YellowWhiteColumn extends StatelessWidget {
  final String heading;

  final String value;

  const YellowWhiteColumn({Key key, this.heading, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          heading,
          style: TextStyle(color: kSecondaryColor),
        ),
        WhiteText(
          text: value,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
