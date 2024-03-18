// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:doctor_foot_app/controllers/home_dressing_controller.dart';
import 'package:doctor_foot_app/models/home_dressing/home_dressing_model.dart';
import 'package:doctor_foot_app/screens/home_dressing_services/home_dressing_payment.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/widgets/home_dressing_service_widget.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeDressingServices extends StatefulWidget {
  const HomeDressingServices({super.key});

  @override
  State<HomeDressingServices> createState() => _HomeDressingServicesState();
}

class _HomeDressingServicesState extends State<HomeDressingServices> {
  bool isAdded = false;
  final HomeDressingController homeDressingController =
      Get.put(HomeDressingController());
  HomeDressingModel homeDressingModel = HomeDressingModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Home Dressing Services",
          style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primary,
            )),
      ),
      body: GetBuilder<HomeDressingController>(builder: (context) {
        return Column(
          children: [
            const SvgImageWidget(
              path: AssetsConstants.home_dressing_cover_img,
              height: 200,
              width: double.infinity,
            ),
            Expanded(
              child: ListView.builder(
                  //  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeDressingServicesList.length,
                  itemBuilder: (context, index) {
                    final homeDressingServices =
                        homeDressingServicesList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Column(
                        children: [
                          HomeDressingServiceWidget(
                            homeDressingModel: homeDressingServices,
                            onPress: () {
                              homeDressingController.addOrRemoveFromList(
                                  homeDressingServices, isAdded);
                            },
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        );
      }),
      floatingActionButton: isAdded
          ? FloatingActionButton.extended(
              extendedPadding: const EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: AppColors.primary,
              onPressed: () {
                //  Get.to(() => const HomeDressingPayment());
              },
              label: SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: "Added | Rs.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                        children: [
                          TextSpan(
                            text: "800",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(() => HomeDressingPayment(
                            onPress: () {},
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white10,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: const Text(
                          "Make Payment",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
          : const SizedBox.shrink(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
