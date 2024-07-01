import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_hive/resources/constants.dart';

class DateandTime {
  static showDate(DateTime date) {
    var formatDate = DateFormat('dd/MM/yy').format(date).toString();
    return Text(
      formatDate,
      style: TextStyle(
        color: MyColors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static showTime(DateTime date) {
    var formatDate = DateFormat('jm').format(date).toString();
    return Text(
      formatDate,
      style: TextStyle(
        color: MyColors.darkGreen,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
