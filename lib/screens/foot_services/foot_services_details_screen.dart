// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print
import 'package:drfootapp/controllers/doctor_appointment_controller.dart';
import 'package:drfootapp/screens/foot_services/foor_service_widget.dart';
import 'package:drfootapp/models/foot_service_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootServiceDetailsScreen extends StatefulWidget {
  final FootServiceDetailModel nurseServiceDetailModel;

  const FootServiceDetailsScreen({
    super.key,
    required this.nurseServiceDetailModel,
  });

  @override
  State<FootServiceDetailsScreen> createState() =>
      _FootServiceDetailsScreenState();
}

class _FootServiceDetailsScreenState extends State<FootServiceDetailsScreen> {
  bool isAdded = false;
  final DoctorAppointmentController homeDressingController =
      Get.put(DoctorAppointmentController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorAppointmentController>(
        builder: (homeDressingController) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.textWhiteColor,
          title: const Text(
            "Check your feet",
            style: TextStyle(
              color: AppColors.primary,
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
              color: AppColors.black1,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.whiteBgColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nurseServiceDetailModel.title,
                        style: const TextStyle(
                          color: AppColors.black1,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomImage(
                        height: 180,
                        width: double.infinity,
                        path: widget.nurseServiceDetailModel.image,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.nurseServiceDetailModel.description,
                        style: const TextStyle(
                          color: AppColors.black1,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: AppColors.secondary,
                thickness: 6,
              ),
              Container(
                decoration: BoxDecoration(color: AppColors.whiteBgColor),
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Available Services ",
                      style: TextStyle(
                        color: AppColors.black1,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.nurseServiceDetailModel
                            .nurseServiceModelList.length,
                        itemBuilder: (context, index) {
                          final FootServiceModel nurseServiceModel =
                              widget.nurseServiceDetailModel
                                  .nurseServiceModelList[index];
                          return FootServiceWidget(
                            nurseServiceModel: nurseServiceModel,
                          );
                        })
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        //floatingActionButton: bottobBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }

  // Widget bottobBar() {
  //   return homeDressingController.selectedFootServiceModel.docId.isNotEmpty
  //       ? FloatingActionButton.extended(
  //           extendedPadding: const EdgeInsets.symmetric(horizontal: 10),
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //           backgroundColor: AppColors.primaryBlue,
  //           onPressed: () {
  //             //  Get.to(() => const HomeDressingPayment());
  //           },
  //           label: SizedBox(
  //             width: 350,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 RichText(
  //                   text: TextSpan(
  //                     text: "Added | Rs.",
  //                     style: const TextStyle(
  //                         fontWeight: FontWeight.w400, fontSize: 16),
  //                     children: [
  //                       TextSpan(
  //                         text: "${homeDressingController.finalAmount}",
  //                         style: const TextStyle(
  //                             fontWeight: FontWeight.w700, fontSize: 16),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //                 InkWell(
  //                   onTap: () {
  //                     // Get.to(() => const HomeFootPayment());
  //                   },
  //                   child: Container(
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(6),
  //                       color: Colors.white10,
  //                     ),
  //                     padding: const EdgeInsets.symmetric(
  //                         horizontal: 20, vertical: 8),
  //                     child: const Text(
  //                       "Pay now",
  //                       style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w700,
  //                           color: Colors.white),
  //                     ).tr(),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ))
  //       : const SizedBox.shrink();
  // }

  // String getTitle() {
  //   String title = Strings.dressingServicesText;
  //   if (widget.footServices == FootServices.dressingService) {
  //     title =
  //         "${Strings.dressingServicesText} - ${Utility.enumToString(widget.dressingServices)}";
  //   } else if (widget.footServices == FootServices.nailTrimmingService) {
  //     title = Strings.nailTrimmingText;
  //   } else if (widget.footServices == FootServices.footCleaning) {
  //     title = Strings.footCleansingText;
  //   } else if (widget.footServices == FootServices.footware) {
  //     title = Strings.footwearText;
  //   }
  //   return title;
  // }

  // Query getQuery() {
  //   Query query = footServicesCollectionReference
  //       .where("footService", isEqualTo: widget.footServices.index)
  //       .where("isActive", isEqualTo: true);
  //   if (widget.dressingServices != null) {
  //     query = footServicesCollectionReference
  //         .where("footService", isEqualTo: widget.footServices.index)
  //         .where("dressingService", isEqualTo: widget.dressingServices!.index)
  //         .where("isActive", isEqualTo: true);
  //   }
  //   return query;
  // }
}
