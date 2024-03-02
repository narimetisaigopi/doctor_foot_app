import 'package:doctor_foot_app/controllers/authentication_controller.dart';
import 'package:doctor_foot_app/screens/auth_screens/otp_screen.dart';
import 'package:doctor_foot_app/screens/auth_screens/sign_up_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:doctor_foot_app/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        //padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Let’s get started! Enter your mobile number',
                style: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              //iconNeeded: true,
              leadingIcon: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  '+91 | ',
                  style: TextStyle(
                      //  fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                      fontSize: 18),
                ),
              ),
              hint: 'Mobile Number',
              textEditingController:
                  _authenticationController.mobileNumberController,
              labelNeeded: false,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Get.to(() => const SignUpScreen());
                },
                child: RichText(
                  text: TextSpan(
                    text: 'If you don’t have a account ! ',
                    style: TextStyle(color: Colors.grey.shade500),
                    children: const [
                      TextSpan(
                          text: ' SignUp',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                btnName: 'SignUp',
                onPress: () {
                  // Navigator.pop(context);
                  Utility.myBottomSheet(context, const OtpScreen());
                  // Get.to(() => OtpScreen());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
