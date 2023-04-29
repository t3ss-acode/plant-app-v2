import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:water_plant/providers/plant_provider.dart';
import 'package:water_plant/screens/plants_list.dart';

class Plapp extends StatefulWidget {
  const Plapp({super.key});

  @override
  State<StatefulWidget> createState() => _PlappState();
}

class _PlappState extends State<Plapp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlantProvider(),
      child: MaterialApp(
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: const PlantsListScreen(),
      ),
    );
  }
}
