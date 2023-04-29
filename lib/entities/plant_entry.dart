import 'package:uuid/uuid.dart';
import 'package:water_plant/entities/reminder_time.dart';

class PlantEntry {
  late Uuid id;
  late DateTime created;
  String name;
  ReminderTime wateringTime;

  // nutrients, more?

  PlantEntry(
    this.name,
    this.wateringTime,
  );

  PlantEntry.fullPlant(
    this.id,
    this.created,
    this.name,
    this.wateringTime,
  );
}
