import 'package:drfootapp/models/foot_deformities_model.dart';
import 'package:drfootapp/screens/check_your_feet/check_your_feet_detail_screen.dart';
import 'package:drfootapp/screens/check_your_feet/check_your_feet_widget.dart';
import 'package:drfootapp/static_data/check_your_feet_data/foot_deformities/bunions.dart';
import 'package:drfootapp/static_data/check_your_feet_data/foot_deformities/charcot_foot.dart';
import 'package:drfootapp/static_data/check_your_feet_data/foot_deformities/flat_feet.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootDeformitiesScreen extends StatefulWidget {
  const FootDeformitiesScreen({super.key});

  @override
  State<FootDeformitiesScreen> createState() => _FootDeformitiesScreenState();
}

class _FootDeformitiesScreenState extends State<FootDeformitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
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
                    color: AppColors.black1,
                  ),
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Foot Deformities",
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
              height: 22,
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 2.0),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 4.5,
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: footDeformitiesList.length,
                  itemBuilder: (context, index) {
                    final footDeformitiesItem = footDeformitiesList[index];
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => CheckYourFeetDetailScreen(
                                  checkYourFeetDataModel:
                                      FlatFeet.checkYourFeetDataModelList,
                                ));

                            break;
                          case 1:
                            Get.to(() => CheckYourFeetDetailScreen(
                                  checkYourFeetDataModel:
                                      Bunions.checkYourFeetDataModelList,
                                ));

                            break;
                          case 2:
                            Get.to(() => CheckYourFeetDetailScreen(
                                  checkYourFeetDataModel:
                                      CharcotFoot.checkYourFeetDataModelList,
                                ));
                            break;
                          default:
                            break;
                        }
                      },
                      child: CheckYourFeetWidget(
                        image: footDeformitiesItem.image,
                        title: footDeformitiesItem.serviceNames,
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
