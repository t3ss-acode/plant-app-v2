import 'package:flutter/material.dart';

class ReminderTime {
  late DateTime startDate; // TODO choose your own start date
  DateTime? lastReminder;
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

  DateTime getNextReminder() {
    DateTime? countFrom = lastReminder;
    countFrom ??= startDate;

    DateTime nextReminderDay =
        countFrom.add(Duration(days: daysBetweenReminders)).toLocal();

    DateTime nextReminder = DateTime(
      nextReminderDay.year,
      nextReminderDay.month,
      nextReminderDay.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );

    return nextReminder;
  }
}
