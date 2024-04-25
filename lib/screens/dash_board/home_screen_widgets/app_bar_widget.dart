import 'package:drfootapp/controllers/location_controller.dart';
import 'package:drfootapp/screens/notifications/notification_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/riskfactors/risk_factor_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  LocationController locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return Padding(
        padding: const EdgeInsets.only(left: 16, top: 78, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 24,
                ),
                const SizedBox(
                  width: 05,
                ),
                SizedBox(
                  // height: 60,
                  // width: 133,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            locationController.currentPlacemark != null
                                ? "${locationController.currentPlacemark!.locality}"
                                : "Not available",
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Icon(Icons.expand_more)
                        ],
                      ),
                      Text(
                        locationController.currentPlacemark != null
                            ? "${locationController.currentPlacemark!.street}"
                            : "Not available",
                      ).tr()
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 32,
                  ),
                  color: AppColors.searchButtonColor,
                  onPressed: () {
                    Get.to(const NotificationsScreen());
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    size: 32,
                  ),
                  color: AppColors.notificationsButtonColor,
                  onPressed: () {
                    Get.to(const RiskFactorScreen());
                  },
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
