import 'package:drfootapp/models/skin_and_nail_model.dart';
import 'package:drfootapp/screens/check_your_feet/check_your_feet_widget.dart';
import 'package:drfootapp/screens/check_your_feet/check_your_feet_detail_screen.dart';
import 'package:drfootapp/static_data/check_your_feet_data/skin&nail/corns.dart';
import 'package:drfootapp/static_data/check_your_feet_data/skin&nail/folliculitis.dart';
import 'package:drfootapp/static_data/check_your_feet_data/skin&nail/ingrown_toe_nails.dart';
import 'package:drfootapp/static_data/check_your_feet_data/skin&nail/planter_warts.dart';
import 'package:drfootapp/static_data/check_your_feet_data/skin&nail/toe_nail_fungus.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkinAndNailScreen extends StatefulWidget {
  const SkinAndNailScreen({super.key});

  @override
  State<SkinAndNailScreen> createState() => _SkinAndNailScreenState();
}

class _SkinAndNailScreenState extends State<SkinAndNailScreen> {
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
                      "Skin & Nail",
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
                    childAspectRatio: 2.5 / 2.9,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: skinAndNailList.length,
                  itemBuilder: (context, index) {
                    final skinAndNailItem = skinAndNailList[index];
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => CheckYourFeetDetailScreen(
                                  checkYourFeetDataModel: IngrownToeNails
                                      .checkYourFeetDataModelList,
                                ));
                            break;
                          case 1:
                            Get.to(() => CheckYourFeetDetailScreen(
                                  checkYourFeetDataModel:
                                      Corns.checkYourFeetDataModelList,
                                ));
                            break;
                          case 2:
                            Get.to(() => CheckYourFeetDetailScreen(
                                  checkYourFeetDataModel:
                                      PlanterWarts.checkYourFeetDataModelList,
                                ));
                            break;
                          case 3:
                            Get.to(() => CheckYourFeetDetailScreen(
                                  checkYourFeetDataModel:
                                      ToeNailFungus.checkYourFeetDataModelList,
                                ));
                            break;
                          case 4:
                            Get.to(() => CheckYourFeetDetailScreen(
                                  checkYourFeetDataModel:
                                      Folliculitis.checkYourFeetDataModelList,
                                ));
                            break;
                          default:
                            break;
                        }
                      },
                      child: CheckYourFeetWidget(
                        image: skinAndNailItem.image,
                        title: skinAndNailItem.serviceNames,
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
