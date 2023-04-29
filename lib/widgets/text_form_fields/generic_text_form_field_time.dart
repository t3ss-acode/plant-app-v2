import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_plant/util/style_util.dart';

class GenericTextFormFieldTime extends StatefulWidget {
  final String labelText;
  final Function(TimeOfDay) onSaved;

  const GenericTextFormFieldTime({
    super.key,
    required this.labelText,
    required this.onSaved,
  });

  @override
  State<StatefulWidget> createState() => _GenericTextFormFieldTimeState();
}

class _GenericTextFormFieldTimeState extends State<GenericTextFormFieldTime> {
  static const border = UnderlineInputBorder(
    borderSide: BorderSide(
      color: StyleUtil.green100,
    ),
  );
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
        labelStyle: const TextStyle(color: StyleUtil.green100),
        focusedBorder: border,
        enabledBorder: border,
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
            now.year,
            now.month,
            now.day,
            pickedTime.hour,
            pickedTime.minute,
          );

          String formattedTime = DateFormat("HH:mm").format(dateTime);

          setState(() {
            timeinput.text = formattedTime;
          });
        }
      },
      onSaved: (newValue) {
        if (newValue != null) {
          DateTime dateTime = DateFormat.Hm().parse(newValue);

          widget.onSaved(TimeOfDay.fromDateTime(dateTime.toLocal()));
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
