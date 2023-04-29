import 'package:flutter/material.dart';

class GenericToast extends StatelessWidget {
  final String toastMessage;

  const GenericToast({
    super.key,
    required this.toastMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          width: 3,
          color: Colors.lightGreen[400]!,
        ),
        color: Colors.lightGreen[800],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.eco_outlined,
            color: Colors.lightGreen[100]!,
          ),
          const SizedBox(width: 12.0),
          Text(
            toastMessage,
            style: TextStyle(
              color: Colors.lightGreen[100]!,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
