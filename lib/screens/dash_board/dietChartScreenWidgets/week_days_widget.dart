import 'package:drfootapp/controllers/diet_chart_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeekDaysWidget extends StatefulWidget {
  const WeekDaysWidget({super.key});

  @override
  State<WeekDaysWidget> createState() => _WeekDaysWidgetState();
}

class _WeekDaysWidgetState extends State<WeekDaysWidget> {
  DietChartController dietChartController = Get.put(DietChartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DietChartController>(builder: (dietChartController) {
      return ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: weeksList.length,
          itemBuilder: (context, index) {
            final weekDaysItem = weeksList[index];
            return InkWell(
                onTap: () {
                  dietChartController.selectWeek(weekDaysItem);
                },
                child: weekContainer(weekDaysItem,
                    dietChartController.selectedDietWeek == weekDaysItem));
          });
    });
  }

  Widget weekContainer(String text, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : AppColors.whiteBgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.grey4,
            width: 1,
          )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? AppColors.whiteBgColor : AppColors.grey,
            fontWeight: FontWeight.w700,
          ),
        ).tr()),
      ),
    );
  }
}
