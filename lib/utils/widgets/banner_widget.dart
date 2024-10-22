import 'dart:ui';
import 'package:drfootapp/admin/banners/create_banner.dart';
import 'package:drfootapp/controllers/banners_controller.dart';
import 'package:drfootapp/models/banner_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  final BannerModel bannerModel;
  final int count;
  final bool isAdmin;
  const BannerWidget(
      {super.key,
      required this.bannerModel,
      this.count = 0,
      this.isAdmin = false});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CustomNetworkImageWidget(
              path: widget.bannerModel.image,
              height: 180,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 112),
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            widget.bannerModel.descrition.capitalizeFirst ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteBgColor,
                            ),
                            textAlign: TextAlign.center,
                          ).tr(),
                          const SizedBox(height: 8),
                          SmoothPageIndicator(
                            controller: Get.put(BannersController())
                                .bannersPageController,
                            count: widget.count,
                            effect: const ScrollingDotsEffect(
                              dotHeight: 08,
                              dotWidth: 08,
                              activeDotColor: AppColors.whiteBgColor,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (widget.isAdmin) adminLayout()
      ],
    );
  }

  Widget adminLayout() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Get.to(() => CreateBanner(
                    bannerModel: widget.bannerModel,
                  ));
            },
            icon: const CircleAvatar(child: Icon(Icons.edit_outlined))),
        SizedBox(
          width: 150,
          height: 50,
          child: Row(
            children: [
              const Text("Status"),
              Switch(
                  value: widget.bannerModel.isActive,
                  onChanged: (status) async {
                    await Get.put(BannersController())
                        .updateActiveStatus(widget.bannerModel, status);
                    widget.bannerModel.isActive = status;
                    setState(() {});
                  }),
            ],
          ),
        ),
        IconButton(
            onPressed: () async {
              Utility.showAlertDialogger(
                  context: context,
                  yes: () async {
                    Get.back();
                    await Get.put(BannersController())
                        .deleteBanner(widget.bannerModel);
                    setState(() {});
                  });
            },
            icon: const CircleAvatar(child: Icon(Icons.delete_outline))),
      ],
    );
  }
}
