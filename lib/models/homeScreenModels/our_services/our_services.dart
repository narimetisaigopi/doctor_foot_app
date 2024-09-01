import 'package:drfootapp/models/homeScreenModels/our_services/our_service_widget.dart';
import 'package:drfootapp/models/homeScreenModels/our_services/our_services_model.dart';
import 'package:drfootapp/models/homeScreenModels/service_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/book_appointement/appointment_booking_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/foot_service_home.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/service_widget.dart';
import 'package:drfootapp/screens/foot_services/foot_services_screens.dart';
import 'package:drfootapp/screens/risk_factor_home.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OurService extends StatefulWidget {
  const OurService({super.key});

  @override
  State<OurService> createState() => _OurServiceState();
}

class _OurServiceState extends State<OurService> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(left: 16, right: 16),
      height: 1010,
     // height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondary),
          color: AppColors.textWhiteColor,
         // color: AppColors.primary,
          borderRadius: BorderRadius.circular(2)
          ),
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
              "OUR SERVICES",
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
                  itemCount: OurservicesList.length,
                 //itemCount: 2,
                  itemBuilder: (context, index) {
                    final OurservicesItem = OurservicesList[index];
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => const HomeFootServicesScreen(
                                  footServices: FootServices.dressingService,
                                )
                                );
                            break;
                          // case 1:
                          //   Utility.myBottomSheet(context,
                          //       heightFactor: 0.7,
                          //       widget: const RiskFactorHome());
                          //   break;
                          //   case 2:
                          //   Get.to(() => const AppointmentBookingScreen());
                          //    break;
                          //     case 3:
                          //   Utility.myBottomSheet(context,
                          //       heightFactor: 0.7,
                          //       widget: const FootServiceHome());
                          //   break;
                          // default:
                          //   break;
                        }
                      },
                      child: OurServiceWidget(
                          image: OurservicesItem.image,
                          name: OurservicesItem.serviceNames),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}