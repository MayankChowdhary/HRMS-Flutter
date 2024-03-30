import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  final double size;
  double height;
  TextAlign textAlign;
  final FontWeight fontWeight;
  int? maxLines;

  SmallText(
      {Key? key,
        required this.text,
        this.color = const Color(0xFF080808),
        this.size = 12,
        this.height = 1.2,
        this.textAlign = TextAlign.center,
        this.fontWeight = FontWeight.normal, this.maxLines = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
          color: color,
          fontSize: size,
          height: height,
          fontWeight: fontWeight,
          fontFamily: 'Montserrat'),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
