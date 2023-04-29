import 'package:flutter/material.dart';
import 'package:water_plant/util/style_util.dart';

class GenericListItem {
  final String text;
  final String? subtitle;

  GenericListItem(this.text, {this.subtitle});

  Widget build() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(
                width: 2,
                color: StyleUtil.green100,
              ),
              color: StyleUtil.green25,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: StyleUtil.green200,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      color: StyleUtil.green200,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
