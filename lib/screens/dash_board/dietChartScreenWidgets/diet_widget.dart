import 'package:drfootapp/models/dietChartModels/diet_chart_model.dart';
import 'package:drfootapp/screens/dash_board/treatement/ulcer/how_to_upload_ulcer_image_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            content: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 22),
                      child: Text(
                        "How To Upload Ulcer Picture",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.black1,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
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
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                const HowToUploadUlcerImageWidget(
                  image: AssetsConstants.how_to_upload_1,
                  index: 1,
                  descriptiontext:
                      'Image should be taken from the front which should revile the entire ulcer wound along with entire foot as shown in the example image. ',
                ),
              ],
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8, right: 6),
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryBlue,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                decoration: const BoxDecoration(color: AppColors.whiteBgColor),
                child: Column(
                  children: [
                    CustomNetworkImageWidget(
                      path: widget.dietChartModel.dietImage,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      widget.dietChartModel.dietDescription,
                      style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black2),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(7),
                  ),
                ),
                child: Center(
                  child: Text(
                    "${widget.dietChartModel.slotTitle}\n(${widget.dietChartModel.slotTiming})",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
