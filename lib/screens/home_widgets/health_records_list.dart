import 'package:drfootapp/screens/home_widgets/health_record_widget.dart';
import 'package:drfootapp/screens/home_widgets/models/Health_record_model.dart';
import 'package:flutter/material.dart';

class HealthRecordsList extends StatefulWidget {
  const HealthRecordsList({super.key});

  @override
  State<HealthRecordsList> createState() => _HealthRecordsListState();
}

class _HealthRecordsListState extends State<HealthRecordsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.24,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),

              // physics: const NeverScrollableScrollPhysics(),
              itemCount: healthRecordsList.length,
              itemBuilder: (context, index) {
                final checkYourFeetItem = healthRecordsList[index];
                return InkWell(
                  onTap: () {
                    switch (index) {}
                  },
                  child: HealthRecordWidget(
                    image: checkYourFeetItem.image,
                    title: checkYourFeetItem.serviceNames,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
