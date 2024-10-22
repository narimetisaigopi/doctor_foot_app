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
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // Delay the scroll to ensure the widget is fully built before scrolling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedWeek();
    });
    super.initState();
  }

  void _scrollToSelectedWeek() {
    // Find the index of the initially selected week
    int selectedIndex = weeksList.indexOf(dietChartController.selectedDietWeek);

    // If selectedIndex is found (not -1), scroll to that index
    if (selectedIndex != -1) {
      // Scroll the list to the selected index
      scrollController.animateTo(
        selectedIndex *
            100.0, // Approximate width of each item (adjust if needed)
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DietChartController>(builder: (dietChartController) {
      return ListView.separated(
          controller: scrollController,
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
                  dietChartController.onWeekSelection(weekDaysItem);
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
            color: isSelected ? AppColors.primaryBlue : AppColors.grey,
            width: 1,
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? AppColors.whiteBgColor : AppColors.grey,
              fontWeight: FontWeight.w700,
            ),
          ).tr(),
        ),
      ),
    );
  }
}
