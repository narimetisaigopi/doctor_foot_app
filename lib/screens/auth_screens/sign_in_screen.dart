import 'package:doctor_foot_app/controllers/authentication_controller.dart';
import 'package:doctor_foot_app/screens/auth_screens/otp_screen.dart';
import 'package:doctor_foot_app/screens/auth_screens/sign_up_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
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
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  Strings.getStartedSignIn,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                leadingIcon: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    '+91 | ',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
                  ),
                ),
                hint: _focusNode.hasFocus ? "8888888888" : 'Mobile Number',
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
                    Utility.myBottomSheet(context,
                        widget: const SignUpScreen());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: Strings.dontHaveAccount,
                      style: TextStyle(color: Colors.grey.shade500),
                      children: const [
                        TextSpan(
                            text: Strings.signUpText,
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
                  buttonName: Strings.sendOtpText,
                  onPress: () {
                    Utility.myBottomSheet(context, widget: const OtpScreen());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
