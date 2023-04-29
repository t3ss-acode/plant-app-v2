import 'package:flutter/material.dart';
import 'package:water_plant/widgets/scaffold_with_app_bar.dart';
import 'package:water_plant/widgets/text_form_fields/generic_text_form_field.dart';
import 'package:water_plant/widgets/text_form_fields/generic_text_form_field_time.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddPlantScreen();
}

class _AddPlantScreen extends State<AddPlantScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      title: 'Add plant',
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const GenericTextFormField(
                labelText: 'Name',
              ),
              const SizedBox(height: 24),
              const GenericTextFormField(
                labelText: 'Days between reminder',
              ),
              const SizedBox(height: 24),
              const GenericTextFormFieldTime(
                labelText: 'Time of reminder',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
