import 'package:flutter/material.dart';

class GenericTextFormField extends StatelessWidget {
  final String labelText;

  const GenericTextFormField({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 24,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        errorStyle: const TextStyle(fontSize: 16),
      ),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${labelText.toLowerCase()}';
        }
        return null;
      },
    );
  }
}
