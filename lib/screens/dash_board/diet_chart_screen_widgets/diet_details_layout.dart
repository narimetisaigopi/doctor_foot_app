import 'package:drfootapp/models/dietChartModels/diet_chart_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietDetailsLayout extends StatelessWidget {
  final DietChartModel dietChartModel;

  const DietDetailsLayout({super.key, required this.dietChartModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.close,
              color: AppColors.primaryBlue,
              size: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          "${dietChartModel.slotTitle} (${dietTimeMapping[dietChartModel.slotTitle]})",
          style: const TextStyle(
              fontSize: 18,
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.bold),
        ),
        CustomNetworkImageWidget(
          path: dietChartModel.image,
          fit: BoxFit.contain,
          height: 130,
          width: 130,
        ),
        Text(
          dietChartModel.description,
          style: const TextStyle(
              fontSize: 18,
              color: AppColors.black1,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
