import 'package:flutter/material.dart';
import 'package:water_plant/entities/plant_entry.dart';
import 'package:water_plant/services/plant_service.dart';

class PlantProvider extends ChangeNotifier {
  final List<PlantEntry> _plants = [];

  Future<bool> loadPlants() async {
    await _fetchPlants();
    return true;
  }

  /// Returns true if the plants were fetched successfully
  Future<bool> _fetchPlants() async {
    List<PlantEntry> plants = await PlantService().getPlantEntries();

    int plantsAdded = 0;
    if (_plants.isEmpty) {
      _plants.addAll(plants);
      plantsAdded = plants.length;
    } else {
      for (var plant in plants) {
        if (_plantNotInList(plant)) {
          _plants.add(plant);
          plantsAdded++;
        }
      }
    }

    if (plantsAdded > 0) {
      notifyListeners();
    }

    return true;
  }

  _plantNotInList(PlantEntry newPlant) {
    var contains = _plants.where((plant) => plant.id == newPlant.id);
    return contains.isEmpty;
  }

  List<PlantEntry> getCachedPlants() {
    return _plants;
  }

  void addPlant(PlantEntry plant) {
    _plants.add(plant);

    notifyListeners();
  }

  // TODO Use plant.id instead?
  void removePlant(PlantEntry plant) {
    _plants.remove(plant);

    notifyListeners();
  }
}
