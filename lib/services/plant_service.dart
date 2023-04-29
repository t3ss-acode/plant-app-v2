import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:water_plant/entities/plant_entry.dart';
import 'package:water_plant/entities/reminder_time.dart';

class PlantService {
  Future<List<PlantEntry>> getPlantEntries() {
    List<PlantEntry> plants = [];
    plants.add(_createDummyPlant(name: 'Plant 1'));
    plants.add(_createDummyPlant(name: 'Plant 2'));
    plants.add(_createDummyPlant(name: 'Plant 3'));
    plants.add(_createDummyPlant(name: 'Plant 3'));
    plants.add(_createDummyPlant(name: 'Plant 3'));
    plants.add(_createDummyPlant(name: 'Plant 3'));

    return Future.value(plants);
  }

  _createDummyPlant({
    DateTime? created,
    String? name,
    DateTime? reminderStartDate,
    DateTime? lastReminder,
    int? daysBetweenReminders,
    TimeOfDay? reminderTimeOfDay,
  }) {
    PlantEntry plant = PlantEntry.fullPlant(
      const Uuid(),
      created ?? DateTime.parse('2023-04-28 21:45:01'),
      name ?? 'Plant name',
      ReminderTime.allFields(
        reminderStartDate ?? DateTime.parse('2023-04-28 21:45:01'),
        lastReminder ?? DateTime.parse('2023-04-28 21:45:01'),
        daysBetweenReminders ?? 3,
        reminderTimeOfDay ?? const TimeOfDay(hour: 12, minute: 00),
      ),
    );

    return plant;
  }
}
