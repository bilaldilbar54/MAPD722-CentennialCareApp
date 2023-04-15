import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {
  final String data;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;
  const TextWidget(
      {super.key,
      required this.data,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
      required this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}