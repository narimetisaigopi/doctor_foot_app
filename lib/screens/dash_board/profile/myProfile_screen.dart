import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/drop_down_widget.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String bloodGroupValue = "";
  int selectedContainerIndex = 0;
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  SizedBox isSize = const SizedBox(
    height: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text(
          "myProfile",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ).tr(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 22,
                ),
                MyTextField(
                  textInputType: TextInputType.text,
                  borderRadius: 8,
                  bgColor: AppColors.whiteBgColor,
                  hint: Strings.userNameTextFieldLabel,
                  textEditingController:
                      _authenticationController.userNameController,
                  editText: true,
                  edit: Strings.editText,
                  label: Strings.userFullNameTextFieldLabel,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(3,
                        errorText: "name must be more than 3 char"),
                  ]),
                ),
                MyTextField(
                  textInputType: TextInputType.number,
                  borderRadius: 8,
                  bgColor: AppColors.whiteBgColor,
                  hint: Strings.mobileTextFieldHint,
                  textEditingController:
                      _authenticationController.mobileNumberController,
                  label: Strings.mobileTextFieldLabel,
                  editText: true,
                  edit: Strings.editText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6,
                        errorText: "number must be more than 6 char"),
                    FormBuilderValidators.maxLength(
                      10,
                    ),
                  ]),
                ),
                MyTextField(
                  borderRadius: 8,
                  bgColor: AppColors.whiteBgColor,
                  hint: Strings.emailTextFieldFocusHint,
                  textEditingController:
                      _authenticationController.emailController,
                  label: Strings.emailIdTextFieldFocusLabel,
                  editText: true,
                  edit: Strings.editText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(errorText: 'enter valid email'),
                  ]),
                ),
                MyTextField(
                  iconNeeded: true,
                  borderRadius: 8,
                  bgColor: AppColors.whiteBgColor,
                  label: Strings.dateOfBirthTextFieldLabel,
                  hint: Strings.dateOfBirthTextFieldHint,
                  textEditingController:
                      _authenticationController.dateOfBirthController,
                  suffixIcon: InkWell(
                    onTap: () async {
                      var date = await Utility.showMyDatePicker(context);
                      setState(() {
                        _authenticationController.dateOfBirthController.text =
                            date.toString();
                      });
                    },
                    child: const Icon(
                      Icons.date_range_outlined,
                      color: AppColors.grey2,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "please select dob"),
                    FormBuilderValidators.min(1),
                  ]),
                ),
                isSize,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      Strings.gender,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ).tr(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Utility.choiceContainer(
                      title: Strings.male,
                      isSelected: selectedContainerIndex == 0,
                      onTap: () {
                        setState(() {
                          selectedContainerIndex = 0;
                          _authenticationController.genderController.text =
                              Strings.male;
                        });
                      },
                    ),
                    Utility.choiceContainer(
                      title: Strings.female,
                      isSelected: selectedContainerIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedContainerIndex = 1;
                          _authenticationController.genderController.text =
                              Strings.female;
                        });
                      },
                    ),
                    Utility.choiceContainer(
                      title: Strings.others,
                      isSelected: selectedContainerIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedContainerIndex = 2;
                          _authenticationController.genderController.text =
                              Strings.others;
                        });
                      },
                    ),
                  ],
                ),
                isSize,
                MyTextField(
                  borderRadius: 8,
                  bgColor: AppColors.whiteBgColor,
                  hint: Strings.addBloodGroupText,
                  textEditingController:
                      _authenticationController.bloodGroupController,
                  label: Strings.bloodGroupText,
                  suffixIcon: const CustomDropDown(),
                  iconNeeded: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                isSize,
                MyTextField(
                  borderRadius: 8,
                  bgColor: AppColors.whiteBgColor,
                  textInputType: TextInputType.number,
                  hint: Strings.addHeightText,
                  textEditingController:
                      _authenticationController.heightController,
                  label: Strings.heightText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(1,
                        errorText: ' select height'),
                    FormBuilderValidators.maxLength(4,
                        errorText: 'reached more weight'),
                  ]),
                ),
                isSize,
                MyTextField(
                  borderRadius: 8,
                  bgColor: AppColors.whiteBgColor,
                  textInputType: TextInputType.number,
                  hint: Strings.addWeightText,
                  textEditingController:
                      _authenticationController.weightController,
                  label: Strings.weightText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(2,
                        errorText: 'please enter Weight'),
                  ]),
                ),
                const SizedBox(
                  height: 42,
                ),
                CustomButton(
                  isBoxShadow: false,
                  buttonName: "Save",
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      return Fluttertoast.showToast(msg: "success");
                    } else {
                      return Fluttertoast.showToast(msg: "Failed");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
