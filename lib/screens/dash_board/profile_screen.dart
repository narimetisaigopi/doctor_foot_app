import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/screens/dash_board/prifile_details/custom_listtile_widget.dart';
import 'package:drfootapp/screens/dash_board/profile/contact_us_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/appointments/my_appointments_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/faqs_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/edit_profile_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/payments_and_refunds_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/records_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/service_bookings/my_service_bookings_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  Divider customDivider = const Divider(
    color: AppColors.deviderColor,
    thickness: 1,
  );
  final double circleRadius = 124.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
        builder: (authenticationController) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.whiteBgColor,
          ),
          actions: [
            PopupMenuButton(
              icon: const Icon(
                Icons.settings,
                color: AppColors.whiteBgColor,
                size: 22,
              ),
              itemBuilder: (ctx) => [
                _buildPopupMenuItem(
                  'FAQ’s',
                  AppColors.black1,
                  () {
                    Get.to(() => const FAQsScreen());
                  },
                ),
                _buildPopupMenuItem(
                  'Logout',
                  AppColors.black1,
                  () {
                    Utility.logout(context);
                  },
                ),
              ],
            )
          ],
          backgroundColor: AppColors.primaryBlue,
          title: const Text(
            "profile",
            style: TextStyle(
                color: AppColors.whiteBgColor,
                fontSize: 17,
                fontWeight: FontWeight.w700),
          ).tr(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                color: AppColors.secondary,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.92,
                color: AppColors.secondary,
                child: Stack(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: circleRadius / 2.0,
                          ),
                          child: Container(
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(56),
                              ),
                              color: AppColors.primaryBlue,
                            ),
                            width: double.infinity,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: circleRadius / 2,
                                ),
                                Text(
                                  loginUserModel.userName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: AppColors.whiteBgColor),
                                ),
                                Text(
                                  'Reg. No: ${loginUserModel.mobileNumber}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.whiteBgColor),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteBgColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          CustomListTileWidget(
                                            text: "myProfile",
                                            leadingIcon: AssetsConstants.user_profile,
                                            onPressed: () {
                                              Get.to(() =>
                                                  const EditProfileScreen());
                                            },
                                          ),
                                          CustomListTileWidget(
                                              text: "appointment",
                                              leadingIcon: AssetsConstants.my_oppoinments,
                                              onPressed: () {
                                                Get.to(() =>
                                                    const MyAppointmentsScreen());
                                              }),
                                          CustomListTileWidget(
                                              text: "service",
                                              leadingIcon: AssetsConstants.booked_services,
                                              onPressed: () {
                                                Get.to(
                                                    const MyServiceBookingsScreen());
                                              }),
                                          CustomListTileWidget(
                                              text: "payments",
                                              leadingIcon: AssetsConstants.payments_refndes,
                                              onPressed: () {
                                                Get.to(
                                                    const PaymentsAndRefundScreen());
                                              }),
                                          CustomListTileWidget(
                                              text: "Records",
                                              leadingIcon:
                                                  AssetsConstants.records_icon,
                                              onPressed: () {
                                                Get.to(const RecordsScreen());
                                              }),
                                          CustomListTileWidget(
                                              text: "contactus",
                                              leadingIcon: AssetsConstants.contact_us_icon,
                                              onPressed: () {
                                                Get.to(const ContactUsScreen());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColors.primary,
                          child: CircleAvatar(
                            radius: 58,
                            child: CustomNetworkImageWidget(
                              height: double.infinity,
                              width: double.infinity,
                              path: loginUserModel.profilePic,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
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
