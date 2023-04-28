import 'package:flutter/material.dart';
import 'package:water_plant/util/style_util.dart';

class ScaffoldWithAppBar extends StatelessWidget {
  final String title;
  final Widget body;

  const ScaffoldWithAppBar({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      backgroundColor: StyleUtil.green10,
    );
  }
}
