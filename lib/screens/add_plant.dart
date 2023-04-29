import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:water_plant/entities/plant_entry.dart';
import 'package:water_plant/entities/reminder_time.dart';
import 'package:water_plant/providers/plant_provider.dart';
import 'package:water_plant/util/navigation_util.dart';
import 'package:water_plant/widgets/scaffold_with_app_bar.dart';
import 'package:water_plant/widgets/text_form_fields/generic_text_form_field.dart';
import 'package:water_plant/widgets/text_form_fields/generic_text_form_field_time.dart';
import 'package:water_plant/widgets/toast.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddPlantScreen();
}

class _AddPlantScreen extends State<AddPlantScreen> {
  late FToast fToast;
  final _formKey = GlobalKey<FormState>();

  String? _name;
  int? _daysBetweenReminders;
  TimeOfDay? _reminderTime;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      title: 'Add plant',
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 24),
                  GenericTextFormField(
                    labelText: 'Name',
                    onSaved: (String value) {
                      _name = value;
                    },
                  ),
                  const SizedBox(height: 24),
                  GenericTextFormField(
                    labelText: 'Days between reminder',
                    onSaved: (String value) {
                      _daysBetweenReminders = int.parse(value);
                    },
                    numbersInput: true,
                  ),
                  const SizedBox(height: 24),
                  GenericTextFormFieldTime(
                    labelText: 'Time of reminder',
                    onSaved: (TimeOfDay value) {
                      _reminderTime = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          // Close keyboard and show loader while plant is being created
                          FocusManager.instance.primaryFocus?.unfocus();

                          if (_name != null &&
                              _daysBetweenReminders != null &&
                              _reminderTime != null) {
                            PlantEntry newPlant = _createPlantEntry();

                            bool plantAdded = await Provider.of<PlantProvider>(
                                    context,
                                    listen: false)
                                .addPlant(newPlant);

                            if (plantAdded) {
                              // Show toast and then return to list
                              _showToast('Plant added');
                              NavigationUtil.popScreen(context);
                            } else {
                              // Show toast that adding plant failed
                              _showToast('Failed tp add plant');
                            }
                          }
                        }
                      },
                      child: const Text('Create'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PlantEntry _createPlantEntry() {
    ReminderTime reminderTime = ReminderTime(
      _daysBetweenReminders!,
      _reminderTime!,
    );
    PlantEntry plant = PlantEntry(
      _name!,
      reminderTime,
    );

    return plant;
  }

  _showToast(String toastMessage) {
    fToast.showToast(
      child: GenericToast(toastMessage: toastMessage),
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
