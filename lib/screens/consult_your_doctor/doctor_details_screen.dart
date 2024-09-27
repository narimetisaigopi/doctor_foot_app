import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/screens/consult_your_doctor/booking_summary_screen.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/choose_time.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/exp_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
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
            Get.back();
          },
        ),
        title: const Text(
          "Doctor Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 84,
            child: Container(
              color: AppColors.whiteBgColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: AppColors.whiteBgColor,
                      height: MediaQuery.of(context).size.height * 0.34,
                      width: double.infinity,
                      child: const Stack(
                        children: [
                          Center(
                            child: CustomImage(
                              path:
                                  AssetsConstants.doctor_profile_dotted_circle,
                              height: 228,
                              width: 206,
                            ),
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: Icon(
                                Icons.favorite_border,
                                color: AppColors.primaryBlue,
                              ))
                        ],
                      ),
                    ),

                    // const Stack(children: [
                    //   Positioned(
                    //       top: 6,
                    //       right: 6,
                    //       child: Icon(
                    //         Icons.favorite_border,
                    //       ))
                    // ]),
                    const SizedBox(height: 8),
                    const Text(
                      "DR. Narendranadh Meda",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black2,
                      ),
                    ).tr(),
                    const Text(
                      "General",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black2,
                      ),
                    ).tr(),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ExpWidget(
                          image: AssetsConstants.patients,
                          totolCount: "500+",
                          title: "General",
                          bgColor: AppColors.expBg,
                        ),
                        ExpWidget(
                          image: AssetsConstants.experience,
                          totolCount: "7years+",
                          title: "Experience",
                          bgColor: AppColors.expBg,
                        ),
                        ExpWidget(
                          image: AssetsConstants.star_image,
                          totolCount: "4.8",
                          title: "Rating",
                          bgColor: AppColors.expBg,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      color: AppColors.bggrey,
                      thickness: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 12, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "About",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ).tr(),
                          const SizedBox(height: 6),
                          const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ).tr(),
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.bggrey,
                      thickness: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Seleted Date",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ).tr(),
                          MyTextField(
                            // label: Strings.dateOfBirthTextFieldLabel,
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
                                closeKeyboard();
                                var date = await Utility.showMyDatePicker(
                                    context,
                                    lastDate: DateTime.now());
                                setState(() {
                                  _authenticationController
                                      .dateOfBirthController
                                      .text = date.toString();
                                });
                              },
                              child: const Icon(
                                Icons.edit_square,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Please choose the time:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ).tr(),
                          const SizedBox(height: 16),
                          const ChooseTime()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              color: AppColors.whiteBgColor,
              child: Center(
                child: CustomButton(
                  bgColor: AppColors.buttonBg,
                  buttonName: "Next",
                  textColor: AppColors.whiteBgColor,
                  onPress: () {
                    Get.to(
                      () => const BookingSummaryScreen(),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
