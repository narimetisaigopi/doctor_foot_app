import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DoctorDetailWidget extends StatefulWidget {
  const DoctorDetailWidget({super.key});

  @override
  State<DoctorDetailWidget> createState() => _DoctorDetailWidgetState();
}

class _DoctorDetailWidgetState extends State<DoctorDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.whiteBgColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        color: AppColors.black2,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Date",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2,
                        ),
                      ).tr(),
                    ],
                  ),
                  const Text(
                    "Aug 05,2024",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black1,
                    ),
                  ).tr(),
                ],
              ),
              const Divider(
                color: AppColors.black1,
                thickness: 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.av_timer,
                        color: AppColors.black2,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Time",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2,
                        ),
                      ).tr(),
                    ],
                  ),
                  const Text(
                    "03:00PM - 03:30PM",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black1,
                    ),
                  ).tr(),
                ],
              ),
              const Divider(
                color: AppColors.black1,
                thickness: 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.black2,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2,
                        ),
                      ).tr(),
                    ],
                  ),
                  const Text(
                    "Secunderabad",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black1,
                    ),
                  ).tr(),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const CustomImage(
                  path: AssetsConstants.doctor_location_image,
                  width: double.infinity,
                  height: 152,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
