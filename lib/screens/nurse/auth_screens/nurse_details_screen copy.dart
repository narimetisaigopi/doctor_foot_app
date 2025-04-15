// import 'package:drfootapp/controllers/nurse/nurse_auth_controller.dart';
// import 'package:drfootapp/screens/nurse/nurse_dash_board_screen.dart';
// import 'package:drfootapp/utils/constants/app_colors.dart';
// import 'package:drfootapp/utils/constants/string_constants.dart';
// import 'package:drfootapp/utils/utility.dart';
// import 'package:drfootapp/utils/widgets/custom_button.dart';
// import 'package:drfootapp/utils/widgets/my_textfield.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';

// import 'package:get/get.dart';

// class NurseDetailsScreen extends StatefulWidget {
//   const NurseDetailsScreen({super.key});

//   @override
//   State<NurseDetailsScreen> createState() => _NurseDetailsScreenState();
// }

// class _NurseDetailsScreenState extends State<NurseDetailsScreen> {
//   final NurseAuthController _nurseAuthController =
//       Get.put(NurseAuthController());
//   final _formKey = GlobalKey<FormBuilderState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: InkWell(
//             onTap: () {
//               Get.back();
//             },
//             child: const Icon(
//               Icons.arrow_back_outlined,
//               color: AppColors.whiteBgColor,
//             ),
//           ),
//           backgroundColor: AppColors.primaryBlue,
//           title: const Text(
//             "Signup",
//             style: TextStyle(
//               color: AppColors.whiteBgColor,
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//           ).tr(),
//           centerTitle: true,
//         ),
//         backgroundColor: AppColors.bgColor,
//         body: GetBuilder<NurseAuthController>(builder: (nurseAuthController) {
//           return FormBuilder(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'MNC-Nursing',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.black1,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.collegeTextFieldLabel,
//                       hint: Strings.collegeTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.collegeUnisersityController,
//                     ),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.yearTextFieldLabel,
//                       hint: Strings.yearTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.yearofCompletionController,
//                     ),
//                     const SizedBox(height: 6),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: const Text(
//                           Strings.WorkExp,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500, fontSize: 18),
//                         ).tr(),
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: AppColors.grey,
//                               )),
//                           child: const IntrinsicHeight(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 22, right: 22),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "0",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 20,
//                                       color: AppColors.black2,
//                                     ),
//                                   ),
//                                   SizedBox(width: 12),
//                                   Column(
//                                     children: [
//                                       Icon(Icons.arrow_drop_up, size: 22),
//                                       Icon(Icons.arrow_drop_down, size: 22),
//                                     ],
//                                   ),
//                                   VerticalDivider(),
//                                   Text(
//                                     "Years",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16,
//                                       color: AppColors.blackBold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: AppColors.grey,
//                               )),
//                           child: const IntrinsicHeight(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 22, right: 22),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "0",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 20,
//                                       color: AppColors.black2,
//                                     ),
//                                   ),
//                                   SizedBox(width: 12),
//                                   Column(
//                                     children: [
//                                       Icon(Icons.arrow_drop_up, size: 22),
//                                       Icon(Icons.arrow_drop_down, size: 22),
//                                     ],
//                                   ),
//                                   VerticalDivider(),
//                                   Text(
//                                     "Months",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16,
//                                       color: AppColors.blackBold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 6),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.DegreeCertiTextFieldLabel,
//                       hint: Strings.DegreeCertiTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.degreeCertiController,
//                       suffixIcon: const Icon(Icons.upload),
//                     ),

//                     const SizedBox(height: 20),
//                     const Divider(
//                       color: AppColors.bottomSheetBackgroundColor,
//                       thickness: 1,
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       'BSC-Nursing',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.black1,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.collegeTextFieldLabel,
//                       hint: Strings.collegeTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.collegeUnisersityController,
//                     ),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.yearTextFieldLabel,
//                       hint: Strings.yearTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.yearofCompletionController,
//                     ),
//                     const SizedBox(height: 6),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: const Text(
//                           Strings.WorkExp,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500, fontSize: 18),
//                         ).tr(),
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: AppColors.grey,
//                               )),
//                           child: const IntrinsicHeight(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 22, right: 22),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "0",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 20,
//                                       color: AppColors.black2,
//                                     ),
//                                   ),
//                                   SizedBox(width: 12),
//                                   Column(
//                                     children: [
//                                       Icon(Icons.arrow_drop_up, size: 22),
//                                       Icon(Icons.arrow_drop_down, size: 22),
//                                     ],
//                                   ),
//                                   VerticalDivider(),
//                                   Text(
//                                     "Years",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16,
//                                       color: AppColors.blackBold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: AppColors.grey,
//                               )),
//                           child: const IntrinsicHeight(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 22, right: 22),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "0",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 20,
//                                       color: AppColors.black2,
//                                     ),
//                                   ),
//                                   SizedBox(width: 12),
//                                   Column(
//                                     children: [
//                                       Icon(Icons.arrow_drop_up, size: 22),
//                                       Icon(Icons.arrow_drop_down, size: 22),
//                                     ],
//                                   ),
//                                   VerticalDivider(),
//                                   Text(
//                                     "Months",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16,
//                                       color: AppColors.blackBold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 6),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.DegreeCertiTextFieldLabel,
//                       hint: Strings.DegreeCertiTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.degreeCertiController,
//                       suffixIcon: const Icon(Icons.upload),
//                     ),

//                     const SizedBox(height: 20),
//                     const Divider(
//                       color: AppColors.bottomSheetBackgroundColor,
//                       thickness: 1,
//                       endIndent: 0.2,
//                     ),
//                     const Text(
//                       'GNM - General Nursing and Midwie',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.black1,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.collegeTextFieldLabel,
//                       hint: Strings.collegeTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.collegeUnisersityController,
//                     ),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.yearTextFieldLabel,
//                       hint: Strings.yearTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.yearofCompletionController,
//                     ),
//                     const SizedBox(height: 6),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: const Text(
//                           Strings.WorkExp,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500, fontSize: 18),
//                         ).tr(),
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: AppColors.grey,
//                               )),
//                           child: const IntrinsicHeight(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 22, right: 22),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "0",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 20,
//                                       color: AppColors.black2,
//                                     ),
//                                   ),
//                                   SizedBox(width: 12),
//                                   Column(
//                                     children: [
//                                       Icon(Icons.arrow_drop_up, size: 22),
//                                       Icon(Icons.arrow_drop_down, size: 22),
//                                     ],
//                                   ),
//                                   VerticalDivider(),
//                                   Text(
//                                     "Years",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16,
//                                       color: AppColors.blackBold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: AppColors.grey,
//                               )),
//                           child: const IntrinsicHeight(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 22, right: 22),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "0",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 20,
//                                       color: AppColors.black2,
//                                     ),
//                                   ),
//                                   SizedBox(width: 12),
//                                   Column(
//                                     children: [
//                                       Icon(Icons.arrow_drop_up, size: 22),
//                                       Icon(Icons.arrow_drop_down, size: 22),
//                                     ],
//                                   ),
//                                   VerticalDivider(),
//                                   Text(
//                                     "Months",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16,
//                                       color: AppColors.blackBold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 6),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.DegreeCertiTextFieldLabel,
//                       hint: Strings.DegreeCertiTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.degreeCertiController,
//                       suffixIcon: const Icon(Icons.upload),
//                     ),

//                     const SizedBox(height: 20),

//                     const Divider(
//                       color: AppColors.bottomSheetBackgroundColor,
//                       thickness: 1,
//                       endIndent: 0.2,
//                     ),
//                     const Text(
//                       'ANM - Auxiliary Nurse and Midwife',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.black1,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.collegeTextFieldLabel,
//                       hint: Strings.collegeTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.collegeUnisersityController,
//                     ),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.yearTextFieldLabel,
//                       hint: Strings.yearTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.yearofCompletionController,
//                     ),
//                     const SizedBox(height: 6),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: const Text(
//                           Strings.WorkExp,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500, fontSize: 18),
//                         ).tr(),
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: AppColors.grey,
//                               )),
//                           child: const IntrinsicHeight(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 22, right: 22),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "0",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 20,
//                                       color: AppColors.black2,
//                                     ),
//                                   ),
//                                   SizedBox(width: 12),
//                                   Column(
//                                     children: [
//                                       Icon(Icons.arrow_drop_up, size: 22),
//                                       Icon(Icons.arrow_drop_down, size: 22),
//                                     ],
//                                   ),
//                                   VerticalDivider(),
//                                   Text(
//                                     "Years",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16,
//                                       color: AppColors.blackBold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: AppColors.grey,
//                               )),
//                           child: const IntrinsicHeight(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 22, right: 22),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "0",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 20,
//                                       color: AppColors.black2,
//                                     ),
//                                   ),
//                                   SizedBox(width: 12),
//                                   Column(
//                                     children: [
//                                       Icon(Icons.arrow_drop_up, size: 22),
//                                       Icon(Icons.arrow_drop_down, size: 22),
//                                     ],
//                                   ),
//                                   VerticalDivider(),
//                                   Text(
//                                     "Months",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16,
//                                       color: AppColors.blackBold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 6),
//                     MyTextField(
//                       labelNeeded: true,
//                       label: Strings.DegreeCertiTextFieldLabel,
//                       hint: Strings.DegreeCertiTextFieldHint,
//                       textEditingController:
//                           _nurseAuthController.degreeCertiController,
//                       suffixIcon: const Icon(Icons.upload),
//                     ),

//                     const SizedBox(height: 20),

//                     // authenticationController.isLoading
//                     //     ? const CircularProgressIndicator()
//                     CustomButton(
//                       buttonName: "Next",
//                       onPress: () {
//                         Get.to(() => const NurseDashBoardScreen());
//                       },
//                     ),
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
//       if (_nurseAuthController.selectedGenderIndex == -1) {
//         Utility.toast("Please select gender");
//       } else {
//         Utility.showAlertDialogger(
//             context: context,
//             yes: () {
//               Get.back();
//               // _nurseAuthController.signUpFirebaseValidation(context);
//             },
//             no: () {
//               Get.back();
//             });
//       }
//     }
//   }
// }
