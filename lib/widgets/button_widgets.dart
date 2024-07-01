import 'package:flutter/material.dart';
import 'package:notes_app_hive/resources/constants.dart';

class OrangeButton extends StatelessWidget {
  double borderRadius;
  String text;
  Function() onTap;
  OrangeButton({
    super.key,
    required this.text,
    this.borderRadius = 10,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: MyColors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
          color: MyColors.orange,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class GreenButton extends StatelessWidget {
  double borderRadius;
  String text;
  void Function() onTap;
  GreenButton({
    super.key,
    required this.text,
    this.borderRadius = 10,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: MyColors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
          color: MyColors.darkGreen,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
