import 'package:uuid/uuid.dart';
import 'package:water_plant/entities/reminder_time.dart';

class PlantEntry {
  Uuid id;
  DateTime created;
  String name;
  ReminderTime wateringTime;

  // nutrients, more?

  PlantEntry(
    this.id,
    this.created,
    this.name,
    this.wateringTime,
  );
}
