import 'package:drfootapp/controllers/diet_chart_controller.dart';
import 'package:drfootapp/models/dietChartModels/diet_chart_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_drop_down_widget.dart';
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
                  CustomDropDownWidget(
                      hint: "Select week",
                      menuItems: weeksList
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        dietChartController.weekController.text = value ?? "";
                      },
                      errorMessage: "Please select a day"),
                  defaultSize,
                  CustomDropDownWidget(
                      hint: "Select diet type",
                      menuItems: dietTypesList
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        dietChartController.dietTypeController.text =
                            value ?? "";
                      },
                      errorMessage: "Please select diet type"),
                  defaultSize,
                  CustomDropDownWidget(
                      hint: "Select slot title",
                      menuItems: dietTitlesList
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        dietChartController.slotTitleController.text =
                            value ?? "";
                      },
                      errorMessage: "Please select slot title"),
                  defaultSize,
                  CustomDropDownWidget(
                      hint: "Select slot time",
                      menuItems: dietTimingsList
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        dietChartController.slotTimingController.text =
                            value ?? "";
                      },
                      errorMessage: "Please select slot timing"),
                  defaultSize,
                  // Diet Image MyTextField (assuming image URL)
                  MyTextField(
                    label: "Diet Image URL",
                    hint: "Diet Image URL",
                    labelNeeded: false,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.url(),
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
      dietChartController.addNewDiet();
    }
  }
}
