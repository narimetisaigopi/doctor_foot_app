import 'package:drfootapp/models/dietChartModels/diet_chart_model.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';
import 'diet_widget.dart';

class DietPlanLayout extends StatefulWidget {
  final String title;
  final List<DietChartModel> dietChartModelList;
  const DietPlanLayout(
      {super.key, required this.title, required this.dietChartModelList});

  @override
  State<DietPlanLayout> createState() => _DietPlanLayoutState();
}

class _DietPlanLayoutState extends State<DietPlanLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 12, right: 12, bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getTitle(),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.dietChartModelList.length,
                itemBuilder: (context, index) {
                  final DietChartModel dietChartModel =
                      widget.dietChartModelList[index];
                  return InkWell(
                      onTap: () {},
                      child: DietWidget(
                        dietChartModel: dietChartModel,
                      ));
                }),
          ),
        ],
      ),
    );
  }

  getTitle() {
    String path = AssetsConstants.sun_morning;
    if (widget.title == Strings.morningText) {
      path = AssetsConstants.sun_morning;
    } else if (widget.title == Strings.afternoonText) {
      path = AssetsConstants.sun_afternoon;
    } else if (widget.title == Strings.eveningText) {
      path = AssetsConstants.sun_evening;
    } else if (widget.title == Strings.nightText) {
      path = AssetsConstants.sun_evening;
    }
    return Row(
      children: [
        SvgImageWidget(
          path: path,
          width: 22,
          height: 22,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          widget.title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        )
      ],
    );
  }
}
