import 'package:drfootapp/controllers/appointment_booking_controller.dart';
import 'package:drfootapp/models/homeScreenModels/service_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/search_location_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/dressing_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/service_widget.dart';
import 'package:drfootapp/screens/foot_screening_services/foot_screening_services.dart';
import 'package:drfootapp/screens/foot_services/foot_services_details_screen.dart';
import 'package:drfootapp/static_data/foot_cleansing/foot_cleansing.dart';
import 'package:drfootapp/static_data/nail_trimming/nail_trimming.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OurServicesWidget extends StatefulWidget {
  const OurServicesWidget({super.key});

  @override
  State<OurServicesWidget> createState() => _OurServicesWidgetState();
}

class _OurServicesWidgetState extends State<OurServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.25,
      width: double.infinity,
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
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ).tr(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
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
                            Get.put(AppointmentBookingController())
                                    .appointmentType =
                                AppointmentType.consultYourDoctor;
                            Get.to(() => const SearchLocationScreen());
                            break;
                          case 1:
                            Get.put(AppointmentBookingController())
                                    .appointmentType =
                                AppointmentType.onlineConsultation;
                            Get.to(() => const SearchLocationScreen());
                            break;
                          case 2:
                            Get.put(AppointmentBookingController())
                                    .appointmentType =
                                AppointmentType.footScreeningService;
                            Utility.myBottomSheet(context,
                                heightFactor: 0.8,
                                widget: const FootScreeningServices());
                            break;

                          case 3:
                            Utility.myBottomSheet(context,
                                heightFactor: 0.8,
                                widget: const DressingScreen());
                            break;
                          case 4:
                            Get.to(() => HomeFootServicesDetailsScreen(
                                  nurseServiceDetailModel:
                                      FootCleansing.nurseServiceDetailModel,
                                ));
                            break;
                          case 5:
                            Get.to(() => HomeFootServicesDetailsScreen(
                                  nurseServiceDetailModel:
                                      NailTrimming.nurseServiceDetailModel,
                                ));
                            break;
                          case 6:
                            // Get.to(() => const HomeFootServicesScreen(
                            //       footServices: FootServices.footware,
                            //     ));
                            break;
                          default:
                            break;
                        }
                      },
                      child: ServiceWidget(
                          image: servicesItem.image,
                          name: servicesItem.serviceNames),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
