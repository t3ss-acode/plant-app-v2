import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_plant/entities/plant_entry.dart';
import 'package:water_plant/providers/plant_provider.dart';
import 'package:water_plant/widgets/generic_list/generic_list.dart';
import 'package:water_plant/widgets/generic_list/generic_list_item.dart';
import 'package:water_plant/widgets/scaffold_with_app_bar.dart';

class PlantsListScreen extends StatefulWidget {
  const PlantsListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PlantsListScreen();
}

class _PlantsListScreen extends State<PlantsListScreen> {
  late Future<bool> plantsLoaded;

  @override
  void initState() {
    super.initState();

    plantsLoaded =
        Provider.of<PlantProvider>(context, listen: false).loadPlants();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      title: 'Plants',
      body: FutureBuilder(
        future: plantsLoaded,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const LoadScreen();
          } else if (snapshot.hasError) {
            return const ErrorScreen();
          } else {
            return Consumer<PlantProvider>(
              builder: (context, value, child) {
                return GenericList(
                  includeTopPadding: true,
                  includeBottomPadding: true,
                  listItems: _toListItems(value.getCachedPlants()),
                );
              },
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

class LoadScreen extends StatelessWidget {
  const LoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Loading...'),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error occured loading plants'),
    );
  }
}
