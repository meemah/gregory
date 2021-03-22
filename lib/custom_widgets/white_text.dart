import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteText extends StatelessWidget {
  final String text;
  // final TextStyle style;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const WhiteText(
      {Key key,
      this.text,
      this.fontSize,
      this.fontWeight,
      this.textAlign = TextAlign.left})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
            color: Colors.white,
            fontSize: fontSize == null ? 14.0 : fontSize,
            fontWeight: fontWeight == null ? FontWeight.normal : fontWeight));
  }
}
