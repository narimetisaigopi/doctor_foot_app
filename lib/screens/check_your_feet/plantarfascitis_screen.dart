import 'package:drfootapp/screens/consult_your_doctor/foot_screening_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlantarFascitisScreen extends StatefulWidget {
  const PlantarFascitisScreen({super.key});

  @override
  State<PlantarFascitisScreen> createState() => _PlantarFascitisScreenState();
}

class _PlantarFascitisScreenState extends State<PlantarFascitisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Check your feet",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 86,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(24)),
                          border: Border.all(
                            color: AppColors.grey,
                          )),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 4),
                        child: Center(
                          child: CustomImage(
                            path: AssetsConstants.planter,
                            height: 192,
                            width: 262,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      "Plantar Fasciitis:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackBold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Plantar fasciitis is one of the most common conditions causing heel pain. It involves inflammation of the plantar fascia — a tough, fibrous band of tissue that runs along the sole of the foot. The plantar fascia attaches to the heel bone and to the base of the toes. It helps support the arch of the foot and has an important role in normal foot mechanics during walking.Tension or stress in the plantar fascia increases when you place weight on the foot, such as withstanding. The tension also increases when you push off on the ball of the foot and toes. Both of these motions occur during normal walking or running. With overuse or in time, the fascia loses some of its elasticity or resilience and can become irritated with routine daily activities.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBlackColor,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              color: AppColors.whiteBgColor,
              child: Center(
                child: CustomButton(
                  bgColor: AppColors.primaryBlue,
                  buttonName: "Book appointment",
                  textColor: AppColors.whiteBgColor,
                  onPress: () {
                    Get.to(() => const FootScreeningScreen());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
