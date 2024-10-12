import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  int selectedContainerIndex = 0;

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  SizedBox isSize = const SizedBox(
    height: 10,
  );

  setDefault() {
    //email
    _authenticationController.userNameController.text =
        _authenticationController.loginUserModel.userName;
    //mobile
    _authenticationController.mobileNumberController.text =
        _authenticationController.loginUserModel.mobileNumber;
    //email
    _authenticationController.emailController.text =
        _authenticationController.loginUserModel.emailId;
    //dob
    _authenticationController.dateOfBirthController.text =
        _authenticationController.loginUserModel.dateOfBirth;
    //gender
    _authenticationController.genderController.text =
        _authenticationController.loginUserModel.gender;
    //blood
    _authenticationController.bloodGroupController.text =
        _authenticationController.loginUserModel.bloodgroup;
    //height
    _authenticationController.heightController.text =
        _authenticationController.loginUserModel.height;
    //weight
    _authenticationController.weightController.text =
        _authenticationController.loginUserModel.weight;
  }

  @override
  void initState() {
    super.initState();
    setDefault();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "myProfile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
        centerTitle: true,
      ),
      body: GetBuilder<AuthenticationController>(
          builder: (authenticationController) {
        return Column(
          children: [
            Expanded(
              flex: 85,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 22,
                        ),
                        SizedBox(
                          height: 160,
                          width: 160,
                          child: Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.expand,
                              children: [
                                Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteBgColor,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: const CustomImage(
                                        path: AssetsConstants.profile_image,
                                        height: double.infinity,
                                        width: double.infinity,
                                      )),
                                ),
                                Positioned(
                                    right: -8,
                                    bottom: 0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteBgColor,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        height: 46,
                                        width: 46,
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.camera_alt_rounded,
                                            color: AppColors.primaryBlue,
                                          ),
                                          onPressed: () {},
                                        )))
                                // Container(
                                //   decoration: BoxDecoration(
                                //     boxShadow: BoxShadow.,
                                //       color: AppColors.whiteBgColor,
                                //       borderRadius: BorderRadius.circular(100),
                                //       border:
                                //           Border.all(color: AppColors.secondary, width: 2)),
                                //   height: 160,
                                //   width: 160,
                                //   child: const SvgImageWidget(
                                //       path: AssetsConstants.profile_image),
                                // ),
                              ]),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        MyTextField(
                          enabled: false,
                          textInputType: TextInputType.text,
                          bgColor: AppColors.whiteBgColor,
                          hint: Strings.userNameTextFieldLabel,
                          textEditingController:
                              _authenticationController.userNameController,
                          editText: true,
                          edit: "",
                          label: Strings.userFullNameTextFieldLabel,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.grey2,
                                  )),
                              child: const Icon(
                                Icons.edit,
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                          iconNeeded: true,
                        ),
                        MyTextField(
                          textInputType: TextInputType.number,
                          borderRadius: 8,
                          enabled: false,
                          bgColor: AppColors.whiteBgColor,
                          hint: Strings.mobileTextFieldHint,
                          textEditingController:
                              _authenticationController.mobileNumberController,
                          label: Strings.mobileTextFieldLabel,
                          editText: true,
                          edit: "",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.maxLength(10),
                            FormBuilderValidators.minLength(10),
                          ]),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.grey2,
                                  )),
                              child: const Icon(
                                Icons.edit,
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                          iconNeeded: true,
                        ),
                        MyTextField(
                          borderRadius: 8,
                          bgColor: AppColors.whiteBgColor,
                          hint: Strings.emailTextFieldFocusHint,
                          textEditingController:
                              _authenticationController.emailController,
                          label: Strings.emailIdTextFieldFocusLabel,
                          editText: true,
                          edit: "",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.grey2,
                                  )),
                              child: const Icon(
                                Icons.edit,
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                          iconNeeded: true,
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
                              var date =
                                  await Utility.showMyDatePicker(context);
                              setState(() {
                                _authenticationController.dateOfBirthController
                                    .text = date.toString();
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.grey2,
                                    )),
                                child: const Icon(
                                  Icons.date_range_outlined,
                                  color: AppColors.grey2,
                                ),
                              ),
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.date(),
                          ]),
                        ),
                        isSize,
                        Align(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            Strings.gender,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ).tr(),
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
                                  _authenticationController
                                      .genderController.text = Strings.male;
                                });
                              },
                            ),
                            Utility.choiceContainer(
                              title: Strings.female,
                              isSelected: selectedContainerIndex == 1,
                              onTap: () {
                                setState(() {
                                  selectedContainerIndex = 1;
                                  _authenticationController
                                      .genderController.text = Strings.female;
                                });
                              },
                            ),
                            Utility.choiceContainer(
                              title: Strings.others,
                              isSelected: selectedContainerIndex == 2,
                              onTap: () {
                                setState(() {
                                  selectedContainerIndex = 2;
                                  _authenticationController
                                      .genderController.text = Strings.others;
                                });
                              },
                            ),
                          ],
                        ),
                        isSize,
                        MyTextField(
                          borderRadius: 8,
                          bgColor: AppColors.whiteBgColor,
                          hint: "Add blood group",
                          textEditingController:
                              _authenticationController.bloodGroupController,
                          label: Strings.bloodGroupText,
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                          iconNeeded: true,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        isSize,
                        Row(
                          children: [
                            Expanded(
                              child: MyTextField(
                                borderRadius: 8,
                                bgColor: AppColors.whiteBgColor,
                                textInputType: TextInputType.number,
                                hint: Strings.addHeightText,
                                textEditingController:
                                    _authenticationController.heightController,
                                label: Strings.heightText,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: AppColors.grey2,
                                        )),
                                    child: const Icon(
                                      Icons.edit,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ),
                                iconNeeded: true,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: MyTextField(
                                borderRadius: 8,
                                bgColor: AppColors.whiteBgColor,
                                textInputType: TextInputType.number,
                                hint: Strings.addWeightText,
                                textEditingController:
                                    _authenticationController.weightController,
                                label: Strings.weightText,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: AppColors.grey2,
                                        )),
                                    child: const Icon(
                                      Icons.edit,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ),
                                iconNeeded: true,
                              ),
                            ),
                          ],
                        ),
                        isSize,

                        // CustomButton(
                        //   isBoxShadow: false,
                        //   buttonName: "Save",
                        //   onPress: () {
                        //     if (_formKey.currentState!.validate()) {
                        //       return Fluttertoast.showToast(msg: "success");
                        //     } else {
                        //       return Fluttertoast.showToast(msg: "Failed");
                        //     }
                        //   },
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.whiteBgColor,
                ),
                child: Center(
                  child: authenticationController.isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          bgColor: AppColors.primaryBlue,
                          buttonName: "Done",
                          textColor: AppColors.whiteBgColor,
                          isBoxShadow: false,
                          onPress: () => validate(),
                        ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  validate() {
    Utility().closeKeyboard();
    bool status = _formKey.currentState!.saveAndValidate();
    // Utility.myBottomSheet(context, widget: const HomeScreen());
    // Get.to(() => const DashBoardScreen());
    if (status) {
      // _authenticationController.firebaseSendOTP(context);
    }
  }
}
