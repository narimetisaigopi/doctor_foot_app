import 'package:drfootapp/admin/diet/create_diet_chart_screen.dart';
import 'package:drfootapp/models/dietChartModels/diet_chart_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'diet_details_layout.dart';

class DietWidget extends StatefulWidget {
  final DietChartModel dietChartModel;

  const DietWidget({super.key, required this.dietChartModel});

  @override
  State<DietWidget> createState() => _DietWidgetState();
}

class _DietWidgetState extends State<DietWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
            title: "",
            content: DietDetailsLayout(
              dietChartModel: widget.dietChartModel,
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8, right: 6),
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryBlue.withOpacity(0.2),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: CustomNetworkImageWidget(
                path: widget.dietChartModel.image,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(7))),
                child: Text(
                  "${widget.dietChartModel.slotTitle}\n(${dietTimeMapping[widget.dietChartModel.slotTitle]})",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondary),
                ),
              ),
            ),
            if (Utility.isAdmin() && kIsWeb)
              InkWell(
                  onTap: () {
                    Get.to(() => CreateDietChartScreen(
                          dietChartModel: widget.dietChartModel,
                        ));
                  },
                  child: const Text("Edit"))
          ],
        ),
      ),
    );
  }
}
