import 'package:drfootapp/controllers/doctor_appointment_controller.dart';
import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/all_available_clinics_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_appbar.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckYourFeetDetailScreen extends StatefulWidget {
  final CheckYourFeetDataModel checkYourFeetDataModel;
  const CheckYourFeetDetailScreen({
    super.key,
    required this.checkYourFeetDataModel,
  });

  @override
  State<CheckYourFeetDetailScreen> createState() =>
      _CheckYourFeetDetailScreenState();
}

class _CheckYourFeetDetailScreenState extends State<CheckYourFeetDetailScreen> {
  @override
  void initState() {
    Get.put(DoctorAppointmentController()).selectedCheckYourFeetDataModel =
        widget.checkYourFeetDataModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      appBar: const CustomAppbar(title: "Check your feet"),
      body: Column(
        children: [
          Expanded(
            flex: 84,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImage(
                    height: 196,
                    width: double.infinity,
                    path: widget.checkYourFeetDataModel.image,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: widget.checkYourFeetDataModel.isPriceing
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.checkYourFeetDataModel.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackBold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.ratingBarColor,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        "${widget.checkYourFeetDataModel.averageRating}"
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.blackBold,
                                        ),
                                      ),
                                      Text(
                                        "(${widget.checkYourFeetDataModel.reviewCount})"
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.grey2,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.checkYourFeetDataModel.subTitle,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "₹${widget.checkYourFeetDataModel.actualPrice}/-"
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black2,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        "₹${widget.checkYourFeetDataModel.offerPrice}/-"
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.grey2,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                        : Container(),
                  ),
                  const Divider(
                    color: AppColors.secondary,
                    thickness: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        const Text(
                          "About ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackBold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(widget.checkYourFeetDataModel.about),
                        const SizedBox(
                          height: 22,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              color: AppColors.whiteBgColor,
              child: Center(
                child: CustomButton(
                  bgColor: AppColors.primaryBlue,
                  buttonName: "Book appointment",
                  textColor: AppColors.whiteBgColor,
                  onPress: () {
                    Get.to(() => const AllAvailableClinicsScreen());
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
