import 'package:drfootapp/controllers/nurse/nurse_auth_controller.dart';
import 'package:drfootapp/screens/nurse/auth_screens/nurse_education_details_signup_screen.dart';
import 'package:drfootapp/utils/widgets/custom_circular_loader.dart';
import 'package:drfootapp/utils/widgets/custom_drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class NurseSignUpScreen extends StatefulWidget {
  const NurseSignUpScreen({super.key});

  @override
  State<NurseSignUpScreen> createState() => _NurseSignUpScreenState();
}

class _NurseSignUpScreenState extends State<NurseSignUpScreen> {
  final NurseAuthController _nurseAuthController =
      Get.put(NurseAuthController());
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _nurseAuthController.clearSignUpFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: GetBuilder<NurseAuthController>(
        builder: (nurseAuthController) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "SignUpStarted",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ).tr(),
                    ),
                    MyTextField(
                      labelNeeded: true,
                      label: Strings.userNameTextFieldLabel,
                      hint: Strings.userNameTextFieldHint,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9-_]')),
                      ],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(3),
                        FormBuilderValidators.maxLength(30),
                      ]),
                      textEditingController:
                          _nurseAuthController.userNameController,
                    ),
                    MyTextField(
                      labelNeeded: true,
                      label: Strings.ageTextFieldLabel,
                      hint: Strings.ageTextFieldHint,
                      maxLength: 2,
                      textInputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(18,
                            errorText: "Age must be at least 18"),
                        FormBuilderValidators.max(70,
                            errorText: "Age cannot exceed 70"),
                      ]),
                      textEditingController: _nurseAuthController.ageController,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        Strings.gender,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ).tr(),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Utility.choiceContainer(
                          title: Strings.male,
                          isSelected:
                              _nurseAuthController.selectedGenderIndex == 0,
                          onTap: () {
                            setState(() {
                              _nurseAuthController.selectedGenderIndex = 0;
                              _nurseAuthController.genderController.text =
                                  Strings.male;
                            });
                          },
                        ),
                        Utility.choiceContainer(
                          title: Strings.female,
                          isSelected:
                              _nurseAuthController.selectedGenderIndex == 1,
                          onTap: () {
                            setState(() {
                              _nurseAuthController.selectedGenderIndex = 1;
                              _nurseAuthController.genderController.text =
                                  Strings.female;
                            });
                          },
                        ),
                        Utility.choiceContainer(
                          title: Strings.others,
                          isSelected:
                              _nurseAuthController.selectedGenderIndex == 2,
                          onTap: () {
                            setState(() {
                              _nurseAuthController.selectedGenderIndex = 2;
                              _nurseAuthController.genderController.text =
                                  Strings.others;
                            });
                          },
                        ),
                      ],
                    ),
                    MyTextField(
                      labelNeeded: true,
                      label: Strings.city,
                      hint: Strings.cityTextFieldHint,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                      ],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(3),
                        FormBuilderValidators.maxLength(30),
                      ]),
                      textEditingController:
                          _nurseAuthController.cityController,
                    ),
                    MyTextField(
                      labelNeeded: true,
                      label: Strings.mobileTextFieldLabel,
                      hint: Strings.mobileTextFieldHint,
                      textInputType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.equalLength(10,
                            errorText: "Mobile must be 10 digits"),
                      ]),
                      textEditingController:
                          _nurseAuthController.mobileNumberController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CustomDropDownWidget(
                        hint: "Select Degree",
                        menuItems: Strings.nursingList
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        initialValue:
                            _nurseAuthController.degreeController.text,
                        onChanged: (value) {
                          _nurseAuthController.degreeController.text =
                              value ?? "";
                        },
                        errorMessage: "Please select a degree",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _nurseAuthController.isLoading
                        ? const CustomCircularLoader()
                        : CustomButton(
                            buttonName: "signUpText",
                            onPress: validate,
                          )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void validate() {
    Utility().closeKeyboard();
    bool status = _formKey.currentState?.saveAndValidate() ?? false;
    if (!status) {
      Utility.toast("Please fill all required fields correctly");
      return;
    }
    if (_nurseAuthController.selectedGenderIndex == -1) {
      Utility.toast("Please select gender");
      return;
    }
    if (_nurseAuthController.degreeController.text.isEmpty) {
      Utility.toast("Please select a degree");
      return;
    }

    Utility.showAlertDialogger(
      context: context,
      yes: () async {
        Get.back();
        // if (await _nurseAuthController.signUp()) {
        Get.to(() => const NurseEducationDetailsSignupScreen());
        // }
      },
      no: () {
        Get.back();
      },
    );
  }
}
