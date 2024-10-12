import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/screens/auth_screens/sign_in_screen.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  final _formKey = GlobalKey<FormBuilderState>();
  int selectedContainerIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.textWhiteColor,
        body: GetBuilder<AuthenticationController>(
            builder: (authenticationController) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: FormBuilder(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "SignUpStarted",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ).tr(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                        label: Strings.userNameTextFieldLabel,
                        hint: Strings.userNameTextFieldHint,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(3),
                          FormBuilderValidators.maxLength(30),
                        ]),
                        textEditingController:
                            _authenticationController.userNameController),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                      label: Strings.dateOfBirthTextFieldLabel,
                      hint: Strings.dateOfBirthTextFieldHint,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.date(),
                      ]),
                      textEditingController:
                          _authenticationController.dateOfBirthController,
                      iconNeeded: true,
                      suffixIcon: InkWell(
                        onTap: () async {
                          Utility().closeKeyboard();
                          var date = await Utility.showMyDatePicker(context,
                              lastDate: DateTime.now());
                          setState(() {
                            _authenticationController.dateOfBirthController.text =
                                date.toString();
                          });
                        },
                        child: const Icon(
                          Icons.date_range_outlined,
                          color: AppColors.black1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          Strings.gender,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ).tr(),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // MyTextField(
                    //   label: Strings.mobileTextFieldLabel,
                    //   hint: Strings.mobileTextFieldHint,
                    //   maxLength: 10,
                    //   validator: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(),
                    //     FormBuilderValidators.maxLength(10),
                    //     FormBuilderValidators.minLength(10),
                    //   ]),
                    //   textInputType: TextInputType.phone,
                    //   textEditingController:
                    //       _authenticationController.mobileNumberController,
                    //   onSubmited: (value) {
                    //     validate();
                    //   },
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    authenticationController.isLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            buttonName: "signUpText",
                            // onPres: validate,
                            onPress: () {
                              Get.to(const DashBoardScreen());
                            },
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          Utility.myBottomSheet(
                            context,
                            heightFactor: 0.45,
                            widget: const SignInScreen(),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: Strings.alreadyHaveAccount,
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 18),
                            children: const [
                              TextSpan(
                                  text: Strings.signInText,
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
          );
        }));
  }

  validate() {
    Utility().closeKeyboard();
    bool status = _formKey.currentState?.saveAndValidate() ?? false;
    if (status) {
      if (selectedContainerIndex == -1) {
        Utility.toast("Please select gender");
      } else {}
    }
  }
}
