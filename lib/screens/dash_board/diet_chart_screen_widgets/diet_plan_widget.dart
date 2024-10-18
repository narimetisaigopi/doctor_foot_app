// import 'package:drfootapp/models/dietChartModels/diet_chart_model.dart';
// import 'package:drfootapp/utils/constants/app_colors.dart';
// import 'package:drfootapp/utils/constants/assets_constants.dart';
// import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// class DietPlanWidget extends StatefulWidget {
//   final DietChartModel dietChartModel;
//   const DietPlanWidget({super.key, required this.dietChartModel});

//   @override
//   State<DietPlanWidget> createState() => _DietPlanWidgetState();
// }

// class _DietPlanWidgetState extends State<DietPlanWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 570,
//       width: double.infinity,
//       decoration: BoxDecoration(
//           border: Border.all(color: AppColors.whiteBgDietColor),
//           color: AppColors.textWhiteColor,
//           borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 12,
//           top: 22,
//           right: 12,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const SvgImageWidget(
//                   path: AssetsConstants.sun_evining,
//                   height: 22,
//                   width: 22,
//                 ),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 const Text(
//                   "eveningText",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//                 ).tr(),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
