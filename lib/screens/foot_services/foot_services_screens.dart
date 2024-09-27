// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/foot_services_controller.dart';
import 'package:drfootapp/models/home_dressing/foot_service_model.dart';
import 'package:drfootapp/screens/foot_services/foot_payment.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
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
          backgroundColor: AppColors.whiteBgColor,
          title: Text(
            getTitle(),
            style: const TextStyle(
              color: AppColors.primaryBlue,
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
              color: AppColors.primaryBlue,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FirestorePagination(
            query: getQuery(),
            limit: 10,
            onEmpty: const Center(child: Text("No Services")),
            itemBuilder: (context, documentSnapshots, index) {
              FootServiceModel homeDressingModel = FootServiceModel.fromJson(
                  documentSnapshots.data() as Map<String, dynamic>);
              return FootServiceWidget(
                footServiceModel: homeDressingModel,
                onPress: () {
                  homeDressingController.addOrRemoveFromList(
                    footServiceModel: homeDressingModel,
                  );
                },
              );
            },
          ),
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
          "${Strings.dressingServicesText} - ${enumToString(widget.dressingServices)}";
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
