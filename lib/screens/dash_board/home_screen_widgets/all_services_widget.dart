import 'package:drfootapp/models/homeScreenModels/service_model.dart';

import 'package:drfootapp/screens/dash_board/home_screen_widgets/service_widget.dart';
import 'package:drfootapp/screens/home_dressing_services/home_dressing_services.dart';
import 'package:drfootapp/screens/risk_factor_home.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      height: 515,
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
              "serviceText",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ).tr(),
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
                    mainAxisSpacing: 12,
                  ),
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                    final servicesItem = servicesList[index];
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => const HomeDressingServices());
                            break;
                          case 1:
                            Utility.myBottomSheet(context,
                                heightFactor: 0.7,
                                widget: const RiskFactorHome());
                            break;
                          default:
                            break;
                        }
                      },
                      child: ServiceWidget(
                        image: servicesItem.image,
                        name: servicesItem.serviceNames,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
