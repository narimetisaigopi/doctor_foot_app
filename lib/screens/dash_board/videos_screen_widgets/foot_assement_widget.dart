import 'package:drfootapp/models/videosModels/foot_assessment_model.dart';
import 'package:drfootapp/screens/dash_board/videos_screen_widgets/faimage_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FootAssessmentWidget extends StatefulWidget {
  const FootAssessmentWidget({super.key});

  @override
  State<FootAssessmentWidget> createState() => _FootAssessmentWidgetState();
}

class _FootAssessmentWidgetState extends State<FootAssessmentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 12, top: 06, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "footAssessmentText",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBackThickColor),
              ).tr(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 144,
            width: double.infinity,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: videoScreenFaList.length,
                itemBuilder: (context, index) {
                  final videoscreenFaItem = videoScreenFaList[index];
                  return FAImageWidget(
                    image: videoscreenFaItem.image,
                    onPressed: () {},
                  );
                }),
          ),
        ],
      ),
    );
  }
}
