// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:drfootapp/admin/create_home_dressing_services.dart';
import 'package:drfootapp/controllers/home_dressing_controller.dart';
import 'package:drfootapp/models/home_dressing/home_dressing_model.dart';
import 'package:drfootapp/screens/home_dressing_services/home_dressing_payment.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/widgets/home_dressing_service_widget.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FootWearScreen extends StatefulWidget {
  final bool isAdmin;
  const FootWearScreen({super.key, this.isAdmin = false});

  @override
  State<FootWearScreen> createState() => _FootWearScreenState();
}

class _FootWearScreenState extends State<FootWearScreen> {
  bool isAdded = false;
  final HomeDressingController homeDressingController =
      Get.put(HomeDressingController());
  HomeDressingModel homeDressingModel = HomeDressingModel();

  @override
  void initState() {
    // homeDressingController.homeDressingServicesAddedList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeDressingController>(
        builder: (homeDressingController) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Diabetic Footwear",
            style: TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ).tr(),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primary,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              widget.isAdmin
                  ? const SizedBox.shrink()
                  : const SvgImageWidget(
                      path: AssetsConstants.home_dressing_cover_img,
                      height: 200,
                      width: double.infinity,
                    ),
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: FirestorePagination(
                    query: homeDressingServicesCollectionReference,
                    itemBuilder: (context, documentSnapshots, index) {
                      HomeDressingModel homeDressingModel =
                          HomeDressingModel.fromJson(
                              documentSnapshots.data() as Map<String, dynamic>);

                      return InkWell(
                        onTap: () {
                          logger("CreateHomeDressingServices");
                          widget.isAdmin
                              ? Get.to(() => CreateHomeDressingServices(
                                    homeDressingModel: homeDressingModel,
                                  ))
                              : null;
                        },
                        child: HomeDressingServiceWidget(
                          homeDressingModel: homeDressingModel,
                          onPress: () {
                            logger(homeDressingController
                                .homeDressingServicesAddedList.length);
                            homeDressingController.addOrRemoveFromList(
                              homeDressingModel: homeDressingModel,
                            );
                          },
                        ),
                      );
                    },
                  )),
                  Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: FirestorePagination(
                    query: homeDressingServicesCollectionReference,
                    itemBuilder: (context, documentSnapshots, index) {
                      HomeDressingModel homeDressingModel =
                          HomeDressingModel.fromJson(
                              documentSnapshots.data() as Map<String, dynamic>);

                      return InkWell(
                        onTap: () {
                          logger("CreateHomeDressingServices");
                          widget.isAdmin
                              ? Get.to(() => CreateHomeDressingServices(
                                    homeDressingModel: homeDressingModel,
                                  ))
                              : null;
                        },
                        child: HomeDressingServiceWidget(
                          homeDressingModel: homeDressingModel,
                          onPress: () {
                            logger(homeDressingController
                                .homeDressingServicesAddedList.length);
                            homeDressingController.addOrRemoveFromList(
                              homeDressingModel: homeDressingModel,
                            );
                          },
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
        floatingActionButton: homeDressingController
                .homeDressingServicesAddedList.isNotEmpty
            ? FloatingActionButton.extended(
                extendedPadding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: AppColors.primary,
                onPressed: () {
                   Get.to(() => const HomeDressingPayment());
                },
                label: SizedBox(
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Added | Rs.",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                          children: [
                            TextSpan(
                              text: "${homeDressingController.finalAmount}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.to(() => const HomeDressingPayment()),
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
                          ).tr(),
                        ),
                      ),
                    ],
                  ),
                ))
            : const SizedBox.shrink(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}
