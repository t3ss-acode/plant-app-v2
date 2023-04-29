import 'package:flutter/material.dart';

class NavigationUtil {
  static void pushScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static void popScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}
