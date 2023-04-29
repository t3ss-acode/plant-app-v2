import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenericTextFormField extends StatelessWidget {
  final String labelText;
  final bool numbersInput;

  const GenericTextFormField({
    super.key,
    required this.labelText,
    this.numbersInput = false,
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
      keyboardType: numbersInput ? TextInputType.number : TextInputType.text,
      inputFormatters: numbersInput
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : <TextInputFormatter>[],
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
