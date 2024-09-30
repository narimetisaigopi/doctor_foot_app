import 'package:drfootapp/models/foot_deformities_model.dart';
import 'package:drfootapp/screens/check_your_feet/foot_pain_achilles_screen.dart';
import 'package:drfootapp/screens/check_your_feet/foot_pain_metarsalgia_screen.dart';
import 'package:drfootapp/screens/check_your_feet/foot_pain_plantarfascitis_screen.dart';
import 'package:drfootapp/screens/check_your_feet/select_region_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootPainnScreen extends StatefulWidget {
  const FootPainnScreen({super.key});

  @override
  State<FootPainnScreen> createState() => _FootPainnScreenState();
}

class _FootPainnScreenState extends State<FootPainnScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 22, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: AppColors.black1,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Select the region of \n  your foot pain",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black2,
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
                    childAspectRatio: 3 / 4,
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: footPainList.length,
                  itemBuilder: (context, index) {
                    final footDeformitiesItem = footDeformitiesList[index];
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.back();
                            Utility.myBottomSheet(context,
                                heightFactor: 0.6,
                                widget: const FootPainMetarsalgiaScreen());
                            break;
                          case 1:
                            Get.back();
                            Utility.myBottomSheet(context,
                                heightFactor: 0.6,
                                widget: const FootPainPlantarFascitisScreen());
                            break;
                          case 2:
                            Get.back();
                            Utility.myBottomSheet(context,
                                heightFactor: 0.6,
                                widget: const FootPainAchillesScreen());
                            break;

                          default:
                            break;
                        }
                      },
                      child: SelectRegionWidget(
                        image: footDeformitiesItem.image,
                        title: footDeformitiesItem.serviceNames,
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  width: 180,
                  buttonName: "No",
                  isBoxShadow: false,
                  bgColor: AppColors.secondaryButton,
                  border: false,
                ),
                CustomButton(
                  width: 180,
                  buttonName: "Confirm",
                  isBoxShadow: false,
                  bgColor: AppColors.secondaryButton,
                  border: false,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
