import 'package:drfootapp/screens/consult_your_doctor/foot_screening_screen.dart';
import 'package:drfootapp/screens/foot_screening_services/models/foot_screening_model.dart';
import 'package:drfootapp/screens/foot_screening_services/widgets/foot_screening_service_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootScreeningServices extends StatefulWidget {
  const FootScreeningServices({super.key});

  @override
  State<FootScreeningServices> createState() => _FootScreeningServicesState();
}

class _FootScreeningServicesState extends State<FootScreeningServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: AppColors.primaryBlue,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                const Expanded(
                  child: Text(
                    "Foot Screening Services",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 2.0),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3.8 / 4.8,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: footScreeningServicesList.length,
                  itemBuilder: (context, index) {
                    final dressingServicesItem =
                        footScreeningServicesList[index];
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => const FootScreeningScreen());
                            break;
                          case 1:
                            Get.to(() => const FootScreeningScreen());
                            break;
                          case 2:
                            Get.to(() => const FootScreeningScreen());
                            break;
                          case 3:
                            Get.to(() => const FootScreeningScreen());
                            break;
                          default:
                            break;
                        }
                      },
                      child: FootScreeningServiceWidget(
                        image: dressingServicesItem.image,
                        title: dressingServicesItem.serviceNames,
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
