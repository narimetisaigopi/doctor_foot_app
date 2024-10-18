import 'package:drfootapp/models/homeScreenModels/home_services_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/dressing_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/foot_services_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootServiceHome extends StatefulWidget {
  const FootServiceHome({super.key});

  @override
  State<FootServiceHome> createState() => _FootServiceHomeState();
}

class _FootServiceHomeState extends State<FootServiceHome> {
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
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Foot Services",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 2.0),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 4 / 4,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25,
                  ),
                  itemCount: footServicesList.length,
                  itemBuilder: (context, index) {
                    final footServicesItem = footServicesList[index];
                    return InkWell(
                      onTap: () {
                        Get.back();
                        switch (index) {
                          case 0:
                            Utility.myBottomSheet(context,
                                heightFactor: 0.7,
                                widget: const DressingScreen());
                            break;
                          case 1:
                            // Get.to(() => const HomeFootServicesScreen(
                            //       footServices:
                            //           FootServices.nailTrimmingService,
                            //     ));
                            break;
                          case 2:
                            // Get.to(() => const HomeFootServicesScreen(
                            //       footServices: FootServices.footCleaning,
                            //     ));
                            break;
                          case 3:
                            // Get.to(() => const HomeFootServicesScreen(
                            //       footServices: FootServices.footware,
                            //     ));
                            break;
                          default:
                            break;
                        }
                      },
                      child: FootServicesWidget(
                        image: footServicesItem.image,
                        title: footServicesItem.serviceNames,
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
