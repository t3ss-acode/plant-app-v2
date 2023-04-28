import 'package:flutter/material.dart';

class ReminderTime {
  DateTime startDate;
  DateTime lastReminder;
  int daysBetweenReminders;
  TimeOfDay timeOfDay;

  ReminderTime(
    this.startDate,
    this.lastReminder,
    this.daysBetweenReminders,
    this.timeOfDay,
  );
}
