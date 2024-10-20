import 'package:drfootapp/models/ulcer_monitor_models/ulcer_monitoring_record_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UlcerMonitoringRecordWidget extends StatelessWidget {
  final UlcerMonitoringRecordModel ulcerMonitoringRecordModel;
  const UlcerMonitoringRecordWidget(
      {super.key, required this.ulcerMonitoringRecordModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('MMMM - yyyy')
              .format(ulcerMonitoringRecordModel.timestamp.toDate()),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.black2,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 148,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Icon(
                          Icons.personal_injury,
                          size: 30,
                          color: AppColors.bgColor,
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              getDate(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textWhiteColor),
                            ),
                            const Text(
                              "Ulcer",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textWhiteColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteBgColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(8),
                    ),
                    border: Border.all(
                      color: AppColors.grey,
                      width: 1,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 18, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ulcer Monitor ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Scheduled at 09:00am \nAttending doctor srinu, MD ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )),
                        Expanded(flex: 2, child: Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getDate() {
    DateTime date = ulcerMonitoringRecordModel.timestamp
        .toDate(); // Example date: 24th January 2024
    String day = DateFormat('d').format(date); // Get day as a number
    String suffix =
        Utility.getDaySuffix(int.parse(day)); // Get suffix for the day
    String formattedDate = DateFormat('MMMM d').format(date) +
        suffix +
        DateFormat(', yyyy').format(date);

    return formattedDate;
  }
}
