import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/screens/auth_screens/otp_screen.dart';
import 'package:drfootapp/screens/auth_screens/sign_up_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../utils/widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FocusNode _focusNode = FocusNode();
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
        builder: (authenticationController) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Let’s get started!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black2,
                    ),
                  ).tr(),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    leadingIcon: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        '+91 | ',
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 18),
                      ),
                    ),
                    hint: _focusNode.hasFocus
                        ? Strings.mobileTextFieldFocusHint
                        : Strings.mobileTextFieldLabel,
                    textEditingController:
                        _authenticationController.mobileNumberController,
                    labelNeeded: false,
                    maxLength: 10,
                    textInputType: TextInputType.phone,
                    onSubmited: (value) {
                      validate();
                    },
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxLength(10),
                        FormBuilderValidators.minLength(10),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: authenticationController.isLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            buttonName: "sendOtpText",
                            onPress: () {
                              Utility.myBottomSheet(
                                context,
                                heightFactor: 0.5,
                                widget: const OtpScreen(),
                              );
                            },
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Get.back();
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
                                  color: AppColors.primaryBlue,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  validate() {
    closeKeyboard();
    _authenticationController.isSignUp = false;
    bool status = _formKey.currentState?.saveAndValidate() ?? false;
    if (status) {
      _authenticationController.signInFirebaseValidation(context);
    }
  }
}
