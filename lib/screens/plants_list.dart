import 'package:flutter/material.dart';
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
      body: GenericList(
        includeTopPadding: true,
        includeBottomPadding: true,
        listItems: _getPlants(),
      ),
    );
  }

  List<GenericListItem> _getPlants() {
    List<GenericListItem> plants = [];
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    plants.add(GenericListItem('Plant1'));
    return plants;
  }
}
