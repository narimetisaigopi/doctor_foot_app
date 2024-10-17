import 'package:drfootapp/screens/home_widgets/health_record_widget.dart';
import 'package:drfootapp/screens/home_widgets/models/health_record_model.dart';
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
    return SizedBox(
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
    );
  }
}
