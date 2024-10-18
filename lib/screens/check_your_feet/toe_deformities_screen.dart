import 'package:drfootapp/models/toe_deformities_model.dart';
import 'package:drfootapp/screens/check_your_feet/check_your_feet_widget.dart';
import 'package:drfootapp/screens/check_your_feet/claw_toe_screen.dart';
import 'package:drfootapp/screens/check_your_feet/hammer_toe_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToeDeformitiesScreen extends StatefulWidget {
  const ToeDeformitiesScreen({super.key});

  @override
  State<ToeDeformitiesScreen> createState() => _ToeDeformitiesScreenState();
}

class _ToeDeformitiesScreenState extends State<ToeDeformitiesScreen> {
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
                      "Toe Deformities",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackBold,
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
                    childAspectRatio: 3 / 4.3,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: toeDeformitiesList.length,
                  itemBuilder: (context, index) {
                    final toeDeformitiesItem = toeDeformitiesList[index];
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => const HammerToeScreen());
                            break;
                          case 1:
                            Get.back();
                            Get.to(() => const ClawToeScreen());
                            break;
                          default:
                            break;
                        }
                      },
                      child: CheckYourFeetWidget(
                        image: toeDeformitiesItem.image,
                        title: toeDeformitiesItem.serviceNames,
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
