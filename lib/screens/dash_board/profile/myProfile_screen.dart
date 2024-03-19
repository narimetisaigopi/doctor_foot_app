import 'package:doctor_foot_app/controllers/authentication_controller.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:doctor_foot_app/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
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
        leading: const Icon(Icons.arrow_back_ios,size: 18,color: AppColors.primary,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 22,
            ),
            MyTextField(
              borderRadius: 8,
              bgColor: AppColors.whiteBgColor,
              hint: Strings.userNameTextFieldLabel,
              textEditingController:
                  _authenticationController.userNameController,
              editText: true,
              edit: Strings.editText,
              label: Strings.userFullNameTextFieldLabel,
            ),
            MyTextField(
              borderRadius: 8,
              bgColor: AppColors.whiteBgColor,
              hint: Strings.mobileTextFieldHint,
              textEditingController:
                  _authenticationController.mobileNumberController,
              label: Strings.mobileTextFieldLabel,
              editText: true,
              edit: Strings.editText,
            ),
            MyTextField(
              borderRadius: 8,
              bgColor: AppColors.whiteBgColor,
              hint: Strings.emailTextFieldFocusHint,
              textEditingController: _authenticationController.emailController,
              label: Strings.emailIdTextFieldFocusLabel,
              editText: true,
              edit: Strings.editText,
            ),
            MyTextField(
              borderRadius: 8,
              bgColor: AppColors.whiteBgColor,
              label: Strings.dateOfBirthTextFieldLabel,
              hint: Strings.dateOfBirthTextFieldHint,
              textEditingController:
                  _authenticationController.dateOfBirthController,
              iconNeeded: true,
              trailingIcon: const Icon(
                Icons.date_range_outlined,
                color: AppColors.grey2,
              ),
              onPress: () async {
                var date = await Utility.showMyDatePicker(context);
                setState(() {
                  _authenticationController.dateOfBirthController.text =
                      date.toString();
                });
              },
            ),
            isSize,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  Strings.gender,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ).tr(),
              ),
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
              trailingIcon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.blackBold,
              ),
              iconNeeded: true,
            ),
            isSize,
            MyTextField(
              borderRadius: 8,
              bgColor: AppColors.whiteBgColor,
              hint: Strings.addHeightText,
              textEditingController: _authenticationController.heightController,
              label: Strings.heightText,
            ),
            isSize,
            MyTextField(
              borderRadius: 8,
              bgColor: AppColors.whiteBgColor,
              hint: Strings.addWeightText,
              textEditingController: _authenticationController.weightController,
              label: Strings.weightText,
            ),
            const SizedBox(
              height: 42,
            ),
            CustomButton(
              buttonName: "Save",
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
