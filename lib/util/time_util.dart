import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeUtil {
  static String formatTimeOfDay(TimeOfDay timeOfDay) {
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );

    String formattedTime = DateFormat("HH:mm").format(dateTime);
    return formattedTime;
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
