// ignore_for_file: library_private_types_in_public_api

import 'package:drfootapp/controllers/risk_factor_controller.dart';
import 'package:drfootapp/models/risk_factor_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RiskFactorHome extends StatefulWidget {
  const RiskFactorHome({super.key});

  @override
  _RiskFactorHomeState createState() => _RiskFactorHomeState();
}

class _RiskFactorHomeState extends State<RiskFactorHome> {
  final PageController _pageController = PageController();
  final RiskFactorController _riskFactorController =
      Get.put(RiskFactorController());

  @override
  void initState() {
    super.initState();
    _riskFactorController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: GetBuilder<RiskFactorController>(builder: (context) {
        return PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: _riskFactorController.riskFactorsModelsList.length,
          itemBuilder: (context, index) {
            return buildRiskFactorItem(
                _riskFactorController.riskFactorsModelsList[index]);
          },
        );
      }),
    );
  }

  Widget buildRiskFactorItem(RiskFactorModel riskFactorModel) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                    _pageController.animateToPage(
                      _pageController.page!.toInt() - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: const Icon(Icons.arrow_back)),
            ],
          ),
          const SizedBox(height: 10),

          Visibility(
            maintainState: true,
            visible: riskFactorModel.image.isNotEmpty,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.riskCheckBg,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomImage(
                    path: riskFactorModel.image,
                    height: 104,
                    width: 104,
                  ),
                )),
          ),
          //   const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              riskFactorModel.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ).tr(),
          ),
          const SizedBox(height: 10),
          // if (riskFactorModel.description.isNotEmpty)
          Visibility(
            //  maintainSize: true,
            maintainState: true,
            visible: true,
            child: Text(
              riskFactorModel.description,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.primaryBlue,
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: riskFactorModel.options.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    riskFactorModel.type == "gridHorizontal" ? 3 : 2,
                childAspectRatio: riskFactorModel.type == "grid"
                    ? 1.8 / 1.6
                    : riskFactorModel.type == "gridHorizontal"
                        ? 2.5 / 2.5
                        : 2.5,
              ),
              itemBuilder: (context, index) {
                return buildGridViewItem(
                    riskFactorModel, riskFactorModel.options[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridViewItem(
    RiskFactorModel riskFactorModel,
    RiskFactorOptionModel riskFactorOptionModel,
  ) {
    bool isSelected = riskFactorModel.selectedOption != null &&
        riskFactorModel.selectedOption!.title == riskFactorOptionModel.title;
    return riskFactorOptionModel.image.isEmpty
        ? InkWell(
            onTap: () {
              _riskFactorController.updateSelectedOption(
                  riskFactorModel, riskFactorOptionModel);
              _pageController.animateToPage(
                _pageController.page!.toInt() + 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryBlue
                        : AppColors.secondaryButton,
                    borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      riskFactorOptionModel.title,
                      style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    if (riskFactorOptionModel.subTitle.isNotEmpty)
                      Text(
                        riskFactorOptionModel.subTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                  ],
                )),
          )
        : InkWell(
            onTap: () {
              _riskFactorController.updateSelectedOption(
                  riskFactorModel, riskFactorOptionModel);
              _pageController.animateToPage(
                _pageController.page!.toInt() + 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                        height: 159,
                        width: 163,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.grey2,
                            width: 1,
                          ),
                        ),
                        child: Image.asset(
                          riskFactorOptionModel.image,
                          fit: BoxFit.contain,
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      riskFactorOptionModel.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
