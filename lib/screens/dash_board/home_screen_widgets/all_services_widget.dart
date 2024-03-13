import 'package:doctor_foot_app/models/homeScreenModels/service_model.dart';
import 'package:doctor_foot_app/screens/dash_board/home_screen_widgets/service_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllServicesWidget extends StatefulWidget {
  const AllServicesWidget({super.key});

  @override
  State<AllServicesWidget> createState() => _AllServicesWidgetState();
}

class _AllServicesWidgetState extends State<AllServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      height: MediaQuery.of(context).size.height * 0.56,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondary),
          color: AppColors.textWhiteColor,
          borderRadius: BorderRadius.circular(16)),
      child: Container(
        margin: const EdgeInsets.only(
          left: 14,
          top: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              Strings.serviceText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 2.0),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4 / 5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12),
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                    final servicesItem = servicesList[index];
                    return ServiceWidget(
                      image: servicesItem.image!,
                      name: servicesItem.seiviceNames!,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
