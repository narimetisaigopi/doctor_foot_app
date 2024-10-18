import 'package:drfootapp/screens/home_widgets/health_record_widget.dart';
import 'package:drfootapp/screens/home_widgets/models/health_record_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:drfootapp/screens/records/health_record_screen.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthRecordsList extends StatefulWidget {
  const HealthRecordsList({super.key});

  @override
  State<HealthRecordsList> createState() => _HealthRecordsListState();
}

class _HealthRecordsListState extends State<HealthRecordsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: const Text(
            "HEALTH RECORDS",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textBackThickColor,
            ),
          ).tr(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.28,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 3.6 / 4.8),
                itemCount: healthRecordsList.length,
                itemBuilder: (context, index) {
                  final healthRecordsItem = healthRecordsList[index];
                  return InkWell(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Get.to(() => const HealthRecordScreen());
                          break;
                        case 1:
                          Get.to(() => const HealthRecordScreen());
                          break;
                        case 2:
                          Get.to(() => const HealthRecordScreen());
                          break;
                      }
                    },
                    child: HealthRecordWidget(
                      image: healthRecordsItem.image,
                      title: healthRecordsItem.serviceNames,
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
