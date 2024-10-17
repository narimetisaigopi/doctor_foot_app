import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  SizedBox isSize = const SizedBox(
    height: 10,
  );

  setDefault() {
    //email
    _authenticationController.userNameController.text = loginUserModel.userName;
    //mobile
    _authenticationController.mobileNumberController.text =
        loginUserModel.mobileNumber;
    //email
    _authenticationController.emailController.text = loginUserModel.emailId;
    //dob
    _authenticationController.dateOfBirthController.text =
        loginUserModel.dateOfBirth;
    //gender
    _authenticationController.genderController.text = loginUserModel.gender;
    //blood
    _authenticationController.bloodGroupController.text =
        loginUserModel.bloodgroup;
    //height
    _authenticationController.heightController.text = loginUserModel.height;
    //weight
    _authenticationController.weightController.text = loginUserModel.weight;
  }

  @override
  void initState() {
    super.initState();
    setDefault();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorAppointment,
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
                          height: 120,
                          width: 120,
                          child: Stack(clipBehavior: Clip.none, children: [
                            CustomNetworkImageWidget(
                              path: loginUserModel.profilePic,
                              height: double.infinity,
                              width: double.infinity,
                              isCircle: true,
                              radius: 100,
                            ),
                            Positioned(
                                right: -8,
                                bottom: 0,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteBgColor,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    height: 36,
                                    width: 36,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.camera_alt_rounded,
                                        size: 16,
                                        color: AppColors.primaryBlue,
                                      ),
                                      onPressed: () async {
                                        XFile? xFile = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                        if (xFile != null) {
                                          await Get.put(
                                                  FirebaseStorageController())
                                              .uploadImageToFirebase(
                                                  directoryName: storageProfile,
                                                  uploadFile: xFile);
                                        }
                                      },
                                    )))
                          ]),
                        ),
                        MyTextField(
                          enabled: false,
                          labelNeeded: true,
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
                          labelNeeded: true,
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
                          labelNeeded: true,
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
                          labelNeeded: true,
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Utility.choiceContainer(
                                title: Strings.male,
                                isSelected: _authenticationController
                                        .genderController.text ==
                                    Strings.male,
                                onTap: () {
                                  setState(() {
                                    _authenticationController
                                        .genderController.text = Strings.male;
                                  });
                                },
                              ),
                              Utility.choiceContainer(
                                title: Strings.female,
                                isSelected: _authenticationController
                                        .genderController.text ==
                                    Strings.female,
                                onTap: () {
                                  setState(() {
                                    _authenticationController
                                        .genderController.text = Strings.female;
                                  });
                                },
                              ),
                              Utility.choiceContainer(
                                title: Strings.others,
                                isSelected: _authenticationController
                                        .genderController.text ==
                                    Strings.others,
                                onTap: () {
                                  setState(() {
                                    _authenticationController
                                        .genderController.text = Strings.others;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        MyTextField(
                          borderRadius: 8,
                          labelNeeded: true,
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
                        Row(
                          children: [
                            Expanded(
                              child: MyTextField(
                                labelNeeded: true,
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
                                labelNeeded: true,
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
                        Container(
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
                                    onPress: validate,
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  validate() {
    Utility().closeKeyboard();
    bool status = _formKey.currentState!.saveAndValidate();
    if (status) {
      Utility().showAlertDialog(
          context: context,
          yesCallback: () {
            Get.back();
            _authenticationController.editProfile();
          },
          noCallback: () {
            Get.back();
          });
    }
  }
}
