import 'package:drfootapp/controllers/diet_chart_controller.dart';
import 'package:drfootapp/models/dietChartModels/diet_chart_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_drop_down_widget.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddDietChartScreen extends StatefulWidget {
  final DietChartModel? dietChartModel; // Existing diet chart data (optional)

  const AddDietChartScreen({super.key, this.dietChartModel});

  @override
  State<AddDietChartScreen> createState() => _AddDietChartScreenState();
}

class _AddDietChartScreenState extends State<AddDietChartScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  DietChartModel dietChartModel =
      DietChartModel(); // New instance or existing data

  DietChartController dietChartController = Get.put(DietChartController());

  SizedBox defaultSize = const SizedBox(
    height: 10,
  );

  @override
  void initState() {
    super.initState();
    if (widget.dietChartModel != null) {
      dietChartModel = widget.dietChartModel!; // Copy existing data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        title: Text(widget.dietChartModel != null
            ? "Edit Diet Chart"
            : "New Diet Chart"),
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
                  InkWell(
                    onTap: dietChartController.pickFile,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: dietChartController.xFile != null
                          ? Image.network(dietChartController.xFile!.path)
                          : widget.dietChartModel != null
                              ? CustomNetworkImageWidget(
                                  path: widget.dietChartModel!.image)
                              : const Icon(Icons.image),
                    ),
                  ),
                  TextButton(
                      onPressed: dietChartController.pickFile,
                      child: const Text("Pick Image")),
                  defaultSize,
                  // Diet Description MyTextField
                  MyTextField(
                    label: "Diet Description",
                    hint: "Diet Description",
                    maxLines: 5,
                    minLines: 3,
                    maxLength: 5005,
                    labelNeeded: false,
                    textInputType: TextInputType.multiline,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    textEditingController:
                        dietChartController.dietDescriptionController,
                  ),
                  defaultSize,
                  MultiSelectDialogField(
                    buttonText: const Text("Select weeks"),
                    items: weeksList.map((e) => MultiSelectItem(e, e)).toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      dietChartController.weeksList = values;
                    },
                  ),
                  defaultSize,
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropDownWidget(
                            hint: "Select diet type",
                            menuItems: dietTypesList
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (value) {
                              if (value == "Veg") {
                                dietChartController.dietType = DietType.veg;
                              } else {
                                dietChartController.dietType = DietType.nonVeg;
                              }
                            },
                            errorMessage: "Please select diet type"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomDropDownWidget(
                            hint: "Select slot title",
                            menuItems: dietTitlesList
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (value) {
                              dietChartController.slotTitleController.text =
                                  value ?? "";
                            },
                            errorMessage: "Please select slot title"),
                      ),
                      Expanded(
                        child: CustomDropDownWidget(
                            hint: "is contain diary products?",
                            menuItems: ["Yes", "No"]
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            initialValue: "No",
                            onChanged: (value) {
                              if (value == "yes") {
                                dietChartController.isDiaryProduct = true;
                              } else {
                                dietChartController.isDiaryProduct = false;
                              }
                            },
                            errorMessage: "Please select slot title"),
                      ),
                    ],
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
    if (dietChartController.xFile == null) {
      Utility.toast("please select image");
    } else if (dietChartController.dietDescriptionController.text.isEmpty) {
      Utility.toast("Enter description");
    } else if (dietChartController.dietType == null) {
      Utility.toast("Enter diet type");
    } else if (dietChartController.slotTitleController.text.isEmpty) {
      Utility.toast("Enter slot title");
    } else {
      Utility.showAlertDialogger(
          context: context,
          yes: () {
            Get.back();
            dietChartController.addNewDiet();
          });
    }
    // bool status = _formKey.currentState?.saveAndValidate() ?? false;
    // if (status) {

    // }
  }
}
