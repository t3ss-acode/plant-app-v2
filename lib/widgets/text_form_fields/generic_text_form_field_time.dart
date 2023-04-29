import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GenericTextFormFieldTime extends StatefulWidget {
  final String labelText;

  const GenericTextFormFieldTime({
    super.key,
    required this.labelText,
  });

  @override
  State<StatefulWidget> createState() => _GenericTextFormFieldTimeState();
}

class _GenericTextFormFieldTimeState extends State<GenericTextFormFieldTime> {
  TextEditingController timeinput = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: timeinput,
      style: const TextStyle(
        fontSize: 24,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        errorStyle: const TextStyle(fontSize: 16),
      ),
      readOnly: true,
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        );

        if (pickedTime != null) {
          DateTime now = DateTime.now();
          DateTime dateTime = DateTime(
              now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);

          String formattedTime = DateFormat("HH:mm").format(dateTime);

          setState(() {
            timeinput.text = formattedTime;
          });
        }
      },
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.labelText.toLowerCase()}';
        }
        return null;
      },
    );
  }
}
