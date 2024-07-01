import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app_hive/resources/constants.dart';

class TitleText extends StatelessWidget {
  Color? textColor;
  String text;
  TextOverflow? overflow;
  int? maxLines;
  TitleText(
      {super.key,
      required this.text,
      this.textColor,
      this.overflow,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  Color? textColor;
  String text;
  double size;
  TextOverflow? overflow;
  int? maxLines;
  DescriptionText(
      {super.key,
      required this.text,
      this.textColor,
      this.size = 12,
      this.overflow,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    this.textColor = textColor;
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: textColor,
        fontSize: size,
      ),
    );
  }
}
