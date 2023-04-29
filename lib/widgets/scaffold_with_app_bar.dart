import 'package:flutter/material.dart';
import 'package:water_plant/util/style_util.dart';

class ScaffoldWithAppBar extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const ScaffoldWithAppBar({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      floatingActionButton: floatingActionButton,
      backgroundColor: StyleUtil.green10,
    );
  }
}
