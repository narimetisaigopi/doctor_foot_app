import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgImageWidget(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          path: AssetsConstants.diabetes_image,
        ),
        Positioned(
          bottom: 30,
          left: 29,
          right: 16,
          child: const Text(
            "rectImageText",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.secondary),
          ).tr(),
        )
      ],
    );
  }
}
