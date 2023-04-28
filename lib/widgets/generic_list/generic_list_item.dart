import 'package:flutter/material.dart';
import 'package:water_plant/util/style_util.dart';

class GenericListItem {
  final String text;

  GenericListItem(this.text);

  Widget build() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(
                width: 2,
                color: StyleUtil.green80,
              ),
              color: StyleUtil.green30,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
