import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersNurseScreen extends StatefulWidget {
  const OrdersNurseScreen({super.key});

  @override
  State<OrdersNurseScreen> createState() => _OrdersNurseScreenState();
}

class _OrdersNurseScreenState extends State<OrdersNurseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.whiteBgColor,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        title: const Text(
          "01 Order",
          style: TextStyle(
              color: AppColors.whiteBgColor,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ).tr(),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.more_vert,
            color: AppColors.whiteBgColor,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 1,
                      child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteBgColor,
                                          borderRadius: BorderRadius.circular(8)),
                                      child: const Padding(
                                        padding: EdgeInsets.fromLTRB(6, 40, 6, 40),
                                        child: Icon(
                                          Icons.person_add_alt_1,
                                          color: AppColors.primaryBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                   Expanded(
                            flex: 1,
                            child: Container(
                              height: 100,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryBlue,
                                borderRadius:
                                    BorderRadiusDirectional.horizontal(
                                        end: Radius.circular(14)),
                              ),
                            ),
                          )
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.whiteBgColor,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            AssetsConstants.michell_ross,
                                          ),
                                          const SizedBox(width: 8),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Michel Tross",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black1,
                                                ),
                                              ),
                                              Text(
                                                "Order ID : 565654",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black1,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "10.00am",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                                const SizedBox(height: 8),
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.call,
                                        size: 30,
                                        color: AppColors.primaryBlue,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Contact info",
                                            style: TextStyle(
                                              color: AppColors.black1,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            " 7095649714",
                                            style: TextStyle(
                                              color: AppColors.black1,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        size: 30,
                                        color: AppColors.primaryBlue,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Location",
                                            style: TextStyle(
                                              color: AppColors.black1,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Text(
                                            "16-6-54, Venkateswarapuram, Balavil Nagar, Rama....(2.16 Km)",
                                            style: TextStyle(
                                              color: AppColors.black1,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.visible,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color: AppColors.grey,
                                                    ),
                                                  ),
                                                  child: Image.asset(
                                                    height: 186,
                                                    width: double.infinity,
                                                    AssetsConstants
                                                        .michell_ross,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 6,
                                                left: 0,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: CustomButton(
                                                    buttonName: "Start",
                                                    onPress: () {},
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
