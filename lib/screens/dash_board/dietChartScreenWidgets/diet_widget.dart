import 'package:drfootapp/models/dietChartModels/diet_chart_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/networl_image_widget.dart';
import 'package:flutter/material.dart';

class DietWidget extends StatefulWidget {
  final DietChartModel dietChartModel;

  const DietWidget({super.key, required this.dietChartModel});

  @override
  State<DietWidget> createState() => _DietWidgetState();
}

class _DietWidgetState extends State<DietWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  NetworkImageWidget(
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
                      top: Radius.circular(7), bottom: Radius.circular(7))),
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
    );
  }
}
