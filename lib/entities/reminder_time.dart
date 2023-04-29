import 'package:flutter/material.dart';

class ReminderTime {
  late DateTime startDate; // TODO choose your own start date
  late DateTime lastReminder;
  int daysBetweenReminders;
  TimeOfDay timeOfDay;

  ReminderTime(
    this.daysBetweenReminders,
    this.timeOfDay,
  ) {
    startDate = DateTime.now();
  }

  ReminderTime.allFields(
    this.startDate,
    this.lastReminder,
    this.daysBetweenReminders,
    this.timeOfDay,
  );
}
