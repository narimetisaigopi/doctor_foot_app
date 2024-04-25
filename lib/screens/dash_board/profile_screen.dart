import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/screens/dash_board/prifile_details/custom_listtile_widget.dart';
import 'package:drfootapp/screens/dash_board/profile/address/my_addresses.dart';
import 'package:drfootapp/screens/dash_board/profile/contact_us_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/faqs_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/appointments/my_appointment_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/my_profile_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/payments_and_refunds_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/records_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/service_bookings/my_service_bookings_screen.dart';
import 'package:drfootapp/screens/translation_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';

import 'package:drfootapp/utils/widgets/custom_sizedBox_widget.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  Divider customDivider = const Divider(
    height: 16,
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
        builder: (authenticationController) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          title: const Text("profile").tr(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: AppColors.secondary, width: 2)),
                  height: 124,
                  width: 124,
                  child:
                      const SvgImageWidget(path: AssetsConstants.profile_image),
                ),
                const CustomSizedBox(
                  height: 08,
                ),
                Text(
                  authenticationController.loginUserModel.userName,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.arrowForwardBlackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ).tr(),
                if (authenticationController.loginUserModel.regNo.isNotEmpty)
                  Column(
                    children: [
                      const CustomSizedBox(
                        height: 08,
                      ),
                      Text(
                        authenticationController.loginUserModel.regNo,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.arrowForwardBlackColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                const CustomSizedBox(
                  height: 30,
                ),
                customDivider,
                CustomListTileWidget(
                    text: "myProfile",
                    leadingIcon: Icons.person,
                    onPressed: () {
                      Get.to(() => const MyProfileScreen());
                    }),
                customDivider,
                CustomListTileWidget(
                    text: "Addresses",
                    leadingIcon: Icons.person,
                    onPressed: () {
                      Get.to(() => const MyAddresses());
                    }),
                customDivider,
                CustomListTileWidget(
                    text: "appointment",
                    leadingIcon: Icons.calendar_month,
                    onPressed: () {
                      Get.to(() => const MyAppointmentScreen());
                    }),
                customDivider,
                CustomListTileWidget(
                    text: "service",
                    leadingIcon: Icons.calendar_month,
                    onPressed: () {
                      Get.to(const MyServiceBookingsScreen());
                    }),
                customDivider,
                CustomListTileWidget(
                    text: "languages",
                    leadingIcon: Icons.translate,
                    onPressed: () {
                      Get.to(() => const TranslationScreen());
                    }),
                customDivider,
                CustomListTileWidget(
                    text: "payments",
                    leadingIcon: Icons.calendar_month,
                    onPressed: () {
                      Get.to(const PaymentsAndRefundScreen());
                    }),
                customDivider,
                CustomListTileWidget(
                    text: "Records",
                    leadingIcon: Icons.calendar_month,
                    onPressed: () {
                      Get.to(const RecordsScreen());
                    }),
                customDivider,
                CustomListTileWidget(
                    text: "contactus",
                    leadingIcon: Icons.call,
                    onPressed: () {
                      Get.to(const ContactUsScreen());
                    }),
                customDivider,
                CustomListTileWidget(
                    text: "FAQs",
                    leadingIcon: Icons.call,
                    onPressed: () {
                      Get.to(const FAQsScreen());
                    }),
                customDivider,
                CustomListTileWidget(
                    text: "logout",
                    leadingIcon: Icons.logout,
                    onPressed: () {
                      Utility.logout(context);
                    }),
                customDivider
              ],
            ),
          ),
        ),
      );
    });
  }
}
