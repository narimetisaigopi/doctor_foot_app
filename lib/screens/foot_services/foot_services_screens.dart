// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/foot_services_controller.dart';
import 'package:drfootapp/models/home_dressing/foot_service_model.dart';
import 'package:drfootapp/screens/foot_services/foot_payment.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:drfootapp/utils/widgets/foot_service_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeFootServicesScreen extends StatefulWidget {
  final FootServices footServices;
  final DressingServices? dressingServices;
  const HomeFootServicesScreen(
      {super.key, required this.footServices, this.dressingServices});

  @override
  State<HomeFootServicesScreen> createState() => _HomeFootServicesScreenState();
}

class _HomeFootServicesScreenState extends State<HomeFootServicesScreen> {
  bool isAdded = false;
  final FootServiceController homeDressingController =
      Get.put(FootServiceController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FootServiceController>(builder: (homeDressingController) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryBlue,
          title: Text(
            getTitle(),
            style: const TextStyle(
              color: AppColors.whiteBgColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ).tr(),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.whiteBgColor,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.whiteBgColor,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dressing At Home :",
                      style: TextStyle(
                        color: AppColors.black1,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12),
                    CustomImage(
                      height: 180,
                      width: 352,
                      path: AssetsConstants.dressing_at_home_image,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Dressing at home is a services where we provide our user to remedy themselves at home by following the instructions & information provided by experts.  ",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Column(
                children: [
                  Text(
                    "Available Services ",
                    style: TextStyle(
                      color: AppColors.black1,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            
          ],
        ),
        floatingActionButton: bottobBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }

  Widget bottobBar() {
    return homeDressingController.selectedFootServiceModel.docId.isNotEmpty
        ? FloatingActionButton.extended(
            extendedPadding: const EdgeInsets.symmetric(horizontal: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: AppColors.primaryBlue,
            onPressed: () {
              //  Get.to(() => const HomeDressingPayment());
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
                    onTap: () {
                      Get.to(() => const HomeFootPayment());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white10,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: const Text(
                        "Pay now",
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
        : const SizedBox.shrink();
  }

  String getTitle() {
    String title = Strings.dressingServicesText;
    if (widget.footServices == FootServices.dressingService) {
      title =
          "${Strings.dressingServicesText} - ${Utility.enumToString(widget.dressingServices)}";
    } else if (widget.footServices == FootServices.nailTrimmingService) {
      title = Strings.nailTrimmingText;
    } else if (widget.footServices == FootServices.footCleaning) {
      title = Strings.footCleansingText;
    } else if (widget.footServices == FootServices.footware) {
      title = Strings.footwearText;
    }
    return title;
  }

  Query getQuery() {
    Query query = footServicesCollectionReference
        .where("footService", isEqualTo: widget.footServices.index)
        .where("isActive", isEqualTo: true);
    if (widget.dressingServices != null) {
      query = footServicesCollectionReference
          .where("footService", isEqualTo: widget.footServices.index)
          .where("dressingService", isEqualTo: widget.dressingServices!.index)
          .where("isActive", isEqualTo: true);
    }
    return query;
  }
}
