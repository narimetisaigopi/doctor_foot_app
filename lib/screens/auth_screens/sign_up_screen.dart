import 'package:doctor_foot_app/controllers/authentication_controller.dart';
import 'package:doctor_foot_app/screens/auth_screens/otp_screen.dart';
import 'package:doctor_foot_app/screens/auth_screens/sign_in_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:doctor_foot_app/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  int selectedContainerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 30, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  "SignUpStarted",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ).tr(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                label: Strings.userNameTextFieldLabel,
                hint: Strings.userNameTextFieldHint,
                textEditingController:
                    _authenticationController.userNameController),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              label: Strings.dateOfBirthTextFieldLabel,
              hint: Strings.dateOfBirthTextFieldHint,
              textEditingController:
                  _authenticationController.dateOfBirthController,
              iconNeeded: true,
              trailingIcon: const Icon(
                Icons.date_range_outlined,
                color: AppColors.primary,
              ),
              onPress: () async {
                var date = await Utility.showMyDatePicker(context);
                setState(() {
                  _authenticationController.dateOfBirthController.text =
                      date.toString();
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  "gender",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              label: Strings.mobileTextFieldLabel,
              hint: Strings.mobileTextFieldHint,
              textEditingController:
                  _authenticationController.dateOfBirthController,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              buttonName: "signUpText",
              onPress: () {
                Utility.myBottomSheet(context, widget: const OtpScreen());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Utility.myBottomSheet(context, widget: const SignInScreen());
                },
                child: RichText(
                  text: TextSpan(
                    text: Strings.alreadyHaveAccount,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
                    children: const [
                      TextSpan(
                          text: Strings.signInText,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
