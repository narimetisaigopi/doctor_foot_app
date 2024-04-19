import 'package:drfootapp/controllers/diet_chart_controller.dart';
import 'package:drfootapp/models/dietChartModels/diet_chart_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class AddDietChartScreen extends StatefulWidget {
  final DietChartModel? dietChart; // Existing diet chart data (optional)

  const AddDietChartScreen({Key? key, this.dietChart}) : super(key: key);

  @override
  State<AddDietChartScreen> createState() => _AddDietChartScreenState();
}

class _AddDietChartScreenState extends State<AddDietChartScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  DietChartModel _dietChart = DietChartModel(); // New instance or existing data

  DietChartController dietChartController = Get.put(DietChartController());

  SizedBox defaultSize = const SizedBox(
    height: 10,
  );

  @override
  void initState() {
    super.initState();
    if (widget.dietChart != null) {
      _dietChart = widget.dietChart!; // Copy existing data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.dietChart != null ? "Edit Diet Chart" : "New Diet Chart"),
      ),
      body: GetBuilder<DietChartController>(builder: (dietChartController) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  defaultSize,
                  // Week dropdown
                  DropdownButtonFormField<String>(
                    hint: Text("Select week"),
                    items: weeksList
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      dietChartController.weekController.text = value ?? "";
                    },
                    validator: (value) =>
                        value == null ? "Please select a day" : null,
                  ),
                  defaultSize,
                  DropdownButtonFormField<String>(
                    hint: Text("Select diet type"),
                    items: dietTypesList
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      dietChartController.dietTypeController.text = value ?? "";
                    },
                    validator: (value) =>
                        value == null ? "Please select a diet type" : null,
                  ),
                  defaultSize,
                  // Slot Title MyTextField
                  MyTextField(
                    hint: "Slot Title",
                    label: "",
                    labelNeeded: false,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    textEditingController:
                        dietChartController.slotTitleController,
                  ),
                  defaultSize,
                  // Slot Timing MyTextField
                  MyTextField(
                    label: "Slot Timing",
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    labelNeeded: false,
                    textEditingController:
                        dietChartController.slotTimingController,
                    hint: 'Slot Timing',
                  ),
                  defaultSize,
                  // Diet Image MyTextField (assuming image URL)
                  MyTextField(
                    label: "Diet Image URL",
                    hint: "Diet Image URL",
                    labelNeeded: false,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    textEditingController:
                        dietChartController.dietImageController,
                  ),
                  defaultSize,
                  // Diet Description MyTextField
                  MyTextField(
                    label: "Diet Description",
                    hint: "Diet Description",
                    maxLines: 5,
                    labelNeeded: false,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    textEditingController:
                        dietChartController.dietDescriptionController,
                  ),
                  defaultSize,
                  // Save Button
                  dietChartController.isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          onPress: validate,
                          buttonName: "Create",
                        ),
                  defaultSize,
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  validate() {
    bool status = _formKey.currentState?.saveAndValidate() ?? false;
    if (status) {
      dietChartController.addDiet();
    }
  }
}
