// import 'package:drfootapp/controllers/authentication_controller.dart';

// import 'package:drfootapp/utils/constants/app_colors.dart';
// import 'package:drfootapp/utils/constants/string_constants.dart';
// import 'package:drfootapp/utils/utility.dart';
// import 'package:drfootapp/utils/widgets/custom_button.dart';
// import 'package:drfootapp/utils/widgets/my_textfield.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';

// class DetailsNurseScreen extends StatefulWidget {
//   const DetailsNurseScreen({super.key});

//   @override
//   State<DetailsNurseScreen> createState() => _DetailsNurseScreenState();
// }

// class _DetailsNurseScreenState extends State<DetailsNurseScreen> {
//   final AuthenticationController _authenticationController =
//       Get.put(AuthenticationController());
//   final _formKey = GlobalKey<FormBuilderState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColors.primaryBlue,
//           centerTitle: true,
//           title: Text(
//             'Signup',
//             selectionColor: AppColors.bgColorAppointment,
//           ),
//         ),
//         backgroundColor: AppColors.textWhiteColor,
//         body: GetBuilder<AuthenticationController>(
//             builder: (authenticationController) {
//           return Container(
//             padding: const EdgeInsets.all(16),
//             child: FormBuilder(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'MNC-Nursing',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10,),
//                   //  DetailNurse(),

//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.collegeTextFieldLabel,
//                       hint: Strings.collegeTextFieldHint,
//                       textEditingController:
//                           _authenticationController.collegeController,
//                     ),

//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.yearTextFieldLabel,
//                       hint: Strings.yearTextFieldHint,
//                       textEditingController:
//                           _authenticationController.yearofCompletionController,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     //    Padding(
//                     //   padding: const EdgeInsets.symmetric(horizontal: 4),
//                     //   child: Align(
//                     //     alignment: Alignment.topLeft,
//                     //     child: const Text(
//                     //       Strings.degree,
//                     //       style: TextStyle(
//                     //           fontWeight: FontWeight.w500, fontSize: 18),
//                     //     ).tr(),
//                     //   ),
//                     // ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     Utility.choiceContainer(
//                     //       title: Strings.male,
//                     //       isSelected:
//                     //           _authenticationController.selectedGenderIndex ==
//                     //               0,
//                     //       onTap: () {
//                     //         setState(() {
//                     //           _authenticationController.selectedGenderIndex = 0;
//                     //           _authenticationController.genderController.text =
//                     //               Strings.male;
//                     //         });
//                     //       },
//                     //     ),
//                     //     Utility.choiceContainer(
//                     //       title: Strings.female,
//                     //       isSelected:
//                     //           _authenticationController.selectedGenderIndex ==
//                     //               1,
//                     //       onTap: () {
//                     //         setState(() {
//                     //           _authenticationController.selectedGenderIndex = 1;
//                     //           _authenticationController.genderController.text =
//                     //               Strings.female;
//                     //         });
//                     //       },
//                     //     ),
//                     //     Utility.choiceContainer(
//                     //       title: Strings.others,
//                     //       isSelected:
//                     //           _authenticationController.selectedGenderIndex ==
//                     //               2,
//                     //       onTap: () {
//                     //         setState(() {
//                     //           _authenticationController.selectedGenderIndex = 2;
//                     //           _authenticationController.genderController.text =
//                     //               Strings.others;
//                     //         });
//                     //       },
//                     //     ),
//                     //   ],
//                     // ),

//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.DegreeCertiTextFieldLabel,
//                       hint: Strings.DegreeCertiTextFieldHint,
//                       textEditingController:
//                           _authenticationController.DegreeCertiController,
//                       suffixIcon: Icon(Icons.upload),
//                     ),

//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Divider(
//                       color: AppColors.bottomSheetBackgroundColor,
//                       thickness: 1,
//                      // endIndent: 0.2,
                      
//                     ),
//                     Text(
//                       'BSC-Nursing',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10,),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.collegeTextFieldLabel,
//                       hint: Strings.collegeTextFieldHint,
//                       textEditingController:
//                           _authenticationController.collegeController,
//                     ),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.DegreeCertiTextFieldLabel,
//                       hint: Strings.DegreeCertiTextFieldHint,
//                       textEditingController:
//                           _authenticationController.DegreeCertiController,
//                       suffixIcon: Icon(Icons.upload),
//                     ),

//                     const SizedBox(
//                       height: 20,
//                     ),
//                    const Divider(
//                       color: AppColors.bottomSheetBackgroundColor,
//                       thickness: 1,
//                       endIndent: 0.2,
                      
//                     ),
//                     Text(
//                       'GNM - General Nursing and Midwie',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10,),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.collegeTextFieldLabel,
//                       hint: Strings.collegeTextFieldHint,
//                       textEditingController:
//                           _authenticationController.collegeController,
//                     ),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.DegreeCertiTextFieldLabel,
//                       hint: Strings.DegreeCertiTextFieldHint,
//                       textEditingController:
//                           _authenticationController.DegreeCertiController,
//                       suffixIcon: Icon(Icons.upload),
//                     ),

//                     const SizedBox(
//                       height: 20,
//                     ),
//                     authenticationController.isLoading
//                         ? const CircularProgressIndicator()
//                         : CustomButton(
//                             buttonName: "signUpText",
//                             onPress: validate,
//                           ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }));
//   }

//   validate() {
//     Utility().closeKeyboard();
//     bool status = _formKey.currentState?.saveAndValidate() ?? false;
//     if (status) {
//       if (_authenticationController.selectedGenderIndex == -1) {
//         Utility.toast("Please select gender");
//       } else {
//         Utility.showAlertDialogger(
//             context: context,
//             yes: () {
//               Get.back();
//               _authenticationController.signUpFirebaseValidation(context);
//             },
//             no: () {
//               Get.back();
//             });
//       }
//     }
//   }
// }

import 'package:flutter/material.dart';

class DetailNurse extends StatefulWidget {
  const DetailNurse({super.key});

  @override
  State<DetailNurse> createState() => _DetailNurseState();
}

class _DetailNurseState extends State<DetailNurse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('data'),
    );
  }
}