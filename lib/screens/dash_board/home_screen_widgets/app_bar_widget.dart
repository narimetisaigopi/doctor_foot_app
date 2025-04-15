import 'package:drfootapp/controllers/location_controller.dart';
import 'package:drfootapp/screens/auth_screens/location_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/search_screen.dart';
import 'package:drfootapp/screens/notifications/notification_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
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
      return Container(
        color: AppColors.primaryBlue,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 24, right: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 24,
                    color: AppColors.whiteBgDietColor,
                  ),
                  const SizedBox(
                    width: 05,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Text(
                          locationController.getCurrentLatlng() != null
                              ? "${locationController.getAddressFromLatlng(locationController.getCurrentLatlng())}"
                              : "Not available",
                          style: const TextStyle(
                            color: AppColors.whiteBgDietColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const LocationScreen());
                          },
                          child: const Icon(
                            Icons.expand_more,
                            color: AppColors.whiteBgDietColor,
                          ),
                        )
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
                      color: AppColors.searchIconColor,
                    ),
                    onPressed: () {
                      Get.to(() => const SearchScreen());
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: AppColors.whiteBgDietColor,
                      size: 32,
                    ),
                    onPressed: () {
                      Get.to(() => const NotificationsScreen());
                    },
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
