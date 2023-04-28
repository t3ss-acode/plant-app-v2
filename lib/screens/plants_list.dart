import 'package:flutter/material.dart';
import 'package:water_plant/entities/plant_entry.dart';
import 'package:water_plant/services/plant_service.dart';
import 'package:water_plant/widgets/generic_list/generic_list.dart';
import 'package:water_plant/widgets/generic_list/generic_list_item.dart';
import 'package:water_plant/widgets/scaffold_with_app_bar.dart';

class PlantsListScreen extends StatefulWidget {
  const PlantsListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PlantsListScreen();
}

class _PlantsListScreen extends State<PlantsListScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      title: 'Plants',
      body: FutureBuilder(
        future: PlantService().getPlantEntries(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Loading...'),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            List<PlantEntry> plants = snapshot.data;
            return GenericList(
              includeTopPadding: true,
              includeBottomPadding: true,
              listItems: _toListItems(plants),
            );
          }
        },
      ),
    );
  }

  _toListItems(List<PlantEntry> plants) {
    List<GenericListItem> listItems = [];
    listItems = plants.map((plant) => GenericListItem(plant.name)).toList();

    return listItems;
  }
}
