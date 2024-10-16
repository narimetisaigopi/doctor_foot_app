// import 'package:drfootapp/models/appointment_models/appointment_model.dart';
// import 'package:drfootapp/utils/constants/app_colors.dart';
// import 'package:drfootapp/utils/constants/assets_constants.dart';
// import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// class AppointemntViewDetailsPage extends StatefulWidget {
//   final AppointmentModel appointmentModel;
//   const AppointemntViewDetailsPage({super.key, required this.appointmentModel});

//   @override
//   State<AppointemntViewDetailsPage> createState() =>
//       _AppointemntViewDetailsPageState();
// }

// class _AppointemntViewDetailsPageState
//     extends State<AppointemntViewDetailsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondary,
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           "Appointments",
//           style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: AppColors.primary),
//         ).tr(),
//       ),
//       body: Column(
//         children: [
//           const SvgImageWidget(
//             height: 180,
//             width: double.infinity,
//             path: AssetsConstants.diabetes_image,
//           ),
//           body(),
//         ],
//       ),
//     );
//   }

//   Widget body() {
//     return Padding(
//       padding: EdgeInsets.only(left: 16, right: 16, top: 18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Hospital Name",
//             style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.blackBold),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           const Divider(),
//           const Text(
//             "No 249/A,Addagutta Society, street, 11, Pragathi Nagar Rd,...",
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.grey),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const Divider(),
//           Text(
//             // "Booked on ${Utility().formatDate(widget.appointmentModel.appointmentTimestamp!.toDate())} \n${Utility().formatTime(widget.appointmentModel.appointmentTimestamp!.toDate())}",
//             "Booked on ${widget.appointmentModel.appointmentDate} \n${widget.appointmentModel.appointmentTime}",
//             style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.grey2),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const Divider(),
//           Text(
//             "Appointment Id #${widget.appointmentModel.appointmentId}",
//             style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.grey2),
//           ),
//         ],
//       ),
//     );
//   }
// }
