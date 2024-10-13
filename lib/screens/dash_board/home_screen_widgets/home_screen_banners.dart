import 'package:drfootapp/controllers/banners_controller.dart';
import 'package:drfootapp/models/banner_model.dart';
import 'package:drfootapp/utils/widgets/banner_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeScreenBanners extends StatefulWidget {
  const HomeScreenBanners({super.key});

  @override
  State<HomeScreenBanners> createState() => _HomeScreenBannersState();
}

class _HomeScreenBannersState extends State<HomeScreenBanners> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannersController>(builder: (bannersController) {
      return SizedBox(
        height: 180,
        width: double.infinity,
        child: PageView.builder(
            controller: bannersController.bannersPageController,
            scrollDirection: Axis.horizontal,
            itemCount: bannersController.bannersList.length,
            itemBuilder: (context, index) {
              final BannerModel bannerModel =
                  bannersController.bannersList[index];
              return BannerWidget(
                bannerModel: bannerModel,
                count: bannersController.bannersList.length,
              );
            }),
      );
    });
  }
}
