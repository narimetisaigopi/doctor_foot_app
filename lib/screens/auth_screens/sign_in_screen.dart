import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/screens/auth_screens/otp_screen.dart';
import 'package:drfootapp/screens/auth_screens/sign_up_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
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
  bool isLoading = false;

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "getStartedSignIn",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ).tr(),
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
                hint: _focusNode.hasFocus
                    ? Strings.mobileTextFieldFocusHint
                    : Strings.mobileTextFieldLabel,
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
                        widget: const SignUpScreen(), heightFactor: 0.7);
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
                  buttonName: "sendOtpText",
                  onPress: () {
                    validateForm();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  validateForm() {
    if (_authenticationController.mobileNumberController.text.isEmpty) {
      return Utility.toast("Enter Mobile Number", backgroundColor: Colors.red);
    } else {
      Utility.myBottomSheet(context, widget: const OtpScreen());
    }
  }
}
