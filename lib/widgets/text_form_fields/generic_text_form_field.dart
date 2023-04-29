import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_plant/util/style_util.dart';

class GenericTextFormField extends StatelessWidget {
  static const border = UnderlineInputBorder(
    borderSide: BorderSide(
      color: StyleUtil.green100,
    ),
  );

  final String labelText;
  final Function(String) onSaved;
  final bool numbersInput;

  const GenericTextFormField({
    super.key,
    required this.labelText,
    required this.onSaved,
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
        labelStyle: const TextStyle(color: StyleUtil.green100),
        focusedBorder: border,
        enabledBorder: border,
        errorStyle: const TextStyle(fontSize: 16),
      ),
      keyboardType: numbersInput ? TextInputType.number : TextInputType.text,
      inputFormatters: numbersInput
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : <TextInputFormatter>[],
      onSaved: (newValue) {
        if (newValue != null) {
          onSaved(newValue);
        }
      },
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
