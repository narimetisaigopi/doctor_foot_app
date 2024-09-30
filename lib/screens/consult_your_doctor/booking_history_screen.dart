import 'package:drfootapp/screens/consult_your_doctor/widgets/doctor_detail_widget.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/exp_widget.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({super.key});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
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
          "Booking  History",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Row(
              children: [
                Icon(
                  Icons.question_mark,
                  color: AppColors.whiteBgColor,
                  size: 16,
                ),
                Text(
                  "Help",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteBgColor,
                  ),
                )
              ],
            ),
            itemBuilder: (ctx) => [
              _buildPopupMenuItem(
                'Cancel Booking',
                AppColors.redColor,
                () {
                  customAlert(
                    title: ' Are sure you want to  \n  Cancel Booking ',
                    no: () {
                      Get.back();
                    },
                    yes: () {
                      customAlert(
                        title: 'Appointment Canceled',
                        no: () {},
                        yes: () {},
                      );
                    },
                  );
                },
              ),
              _buildPopupMenuItem(
                'Contact us',
                AppColors.black1,
                () {},
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 84,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      const Column(
                        children: <Widget>[
                          CustomImage(
                            height: 307,
                            width: double.infinity,
                            path: AssetsConstants.doctor_history,
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .3,
                          right: 20.0,
                          left: 20.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.whiteBgColor,
                              border: Border.all(
                                color: AppColors.grey,
                                width: 1,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "About the Doctor",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black2,
                                  ),
                                ).tr(),
                                const Text(
                                  "DR. Narendranadh Meda",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.blackBold,
                                  ),
                                ).tr(),
                                Row(
                                  children: [
                                    const Text(
                                      "Speaks ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ).tr(),
                                    const Text(
                                      "Telugu, Urdu & English",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryBlue,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      ExpWidget(
                                        image: AssetsConstants.patients,
                                        totolCount: "500+",
                                        title: "General",
                                      ),
                                      VerticalDivider(
                                        color: AppColors.grey,
                                        thickness: 1,
                                      ),
                                      ExpWidget(
                                        image: AssetsConstants.experience,
                                        totolCount: "7years+",
                                        title: "Experience",
                                      ),
                                      VerticalDivider(
                                        color: AppColors.grey,
                                        thickness: 1,
                                      ),
                                      ExpWidget(
                                        image: AssetsConstants.star_image,
                                        totolCount: "4.8",
                                        title: "Rating",
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const DoctorDetailWidget(),
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
                  buttonName: "Back to Home",
                  textColor: AppColors.whiteBgColor,
                  onPress: () {
                    Get.to(() => const DashBoardScreen());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      String title, Color color, Function()? onPress) {
    return PopupMenuItem(
      onTap: onPress,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      ),
    );
  }

  Future<bool?> customAlert({
    required String title,
    required VoidCallback no,
    required VoidCallback yes,
  }) {
    return Alert(
      context: context,
      type: AlertType.error,
      title: title,
      buttons: [
        DialogButton(
          onPressed: no,
          color: AppColors.redBgColor,
          child: const Text(
            "No",
            style: TextStyle(
              color: AppColors.redColor,
              fontSize: 20,
            ),
          ),
        ),
        DialogButton(
          onPressed: yes,
          color: AppColors.primaryBlue,
          child: const Text(
            "Yes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        )
      ],
    ).show();
  }
}
