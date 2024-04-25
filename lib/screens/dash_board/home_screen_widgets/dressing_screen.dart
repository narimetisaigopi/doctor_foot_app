import 'package:drfootapp/models/homeScreenModels/dressing_services_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/foot_services_widget.dart';
import 'package:drfootapp/screens/foot_services/foot_services_screens.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DressingScreen extends StatefulWidget {
  const DressingScreen({super.key});

  @override
  State<DressingScreen> createState() => _DressingScreenState();
}

class _DressingScreenState extends State<DressingScreen> {
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
                  child: Text(
                    "Dressing Services",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
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
                  itemCount: dressingServicesList.length,
                  itemBuilder: (context, index) {
                    final dressingServicesItem = dressingServicesList[index];
                    return InkWell(
                      onTap: () {
                        Get.back();
                        switch (index) {
                          case 0:
                            Get.to(() => const HomeFootServicesScreen(
                                  footServices: FootServices.dressingService,
                                  dressingServices: DressingServices.small,
                                ));
                            break;
                          case 1:
                            Get.to(() => const HomeFootServicesScreen(
                                  footServices: FootServices.dressingService,
                                  dressingServices: DressingServices.moderate,
                                ));
                            break;
                          case 2:
                            Get.to(() => const HomeFootServicesScreen(
                                  footServices: FootServices.dressingService,
                                  dressingServices: DressingServices.large,
                                ));
                            break;
                          case 3:
                            Get.to(() => const HomeFootServicesScreen(
                                  footServices: FootServices.dressingService,
                                  dressingServices: DressingServices.huge,
                                ));
                            break;
                          default:
                            break;
                        }
                      },
                      child: FootServicesWidget(
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
