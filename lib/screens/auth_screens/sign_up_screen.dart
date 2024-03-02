// ignore_for_file: unnecessary_statements

import 'package:doctor_foot_app/controllers/authentication_controller.dart';
import 'package:doctor_foot_app/screens/auth_screens/otp_screen.dart';
import 'package:doctor_foot_app/screens/auth_screens/sign_in_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:doctor_foot_app/utils/widgets/my_textfield.dart';
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
        // resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sign up & Let’s get started!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                label: 'User Name',
                hint: 'Enter your name here',
                textEditingController:
                    _authenticationController.userNameController),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              label: 'Date Of Birth',
              hint: 'DD/MM/YYYY',
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Gender',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Utility.choiceContainer(
                  title: 'Male',
                  isSelected: selectedContainerIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 0;
                      _authenticationController.genderController.text = 'Male';
                    });
                  },
                ),
                Utility.choiceContainer(
                  title: 'Female',
                  isSelected: selectedContainerIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 1;
                      _authenticationController.genderController.text =
                          'Female';
                    });
                  },
                ),
                Utility.choiceContainer(
                  title: 'Others',
                  isSelected: selectedContainerIndex == 2,
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 2;
                      _authenticationController.genderController.text =
                          'Others';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              label: 'Mobile Number',
              hint: 'Enter Mobile Number',
              textEditingController:
                  _authenticationController.dateOfBirthController,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              btnName: 'SignUp',
              onPress: () {
                Utility.myBottomSheet(context, const OtpScreen());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Utility.myBottomSheet(context, const SignInScreen());
                  //  Get.to(() => const SignInScreen());
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have a account ! ',
                    style: TextStyle(color: Colors.grey.shade500),
                    children: const [
                      TextSpan(
                          text: ' SignIn',
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
