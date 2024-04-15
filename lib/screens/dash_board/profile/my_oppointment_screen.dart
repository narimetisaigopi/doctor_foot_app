import 'package:drfootapp/controllers/home_dressing_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class MyOppointmentScreen extends StatefulWidget {
  const MyOppointmentScreen({super.key});

  @override
  State<MyOppointmentScreen> createState() => _MyOppointmentScreenState();
}

class _MyOppointmentScreenState extends State<MyOppointmentScreen> {
  final HomeDressingController homeDressingController =
      Get.put(HomeDressingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("My Appointments"),
        ),
        body: const SingleChildScrollView(
            child: Column(children: [
          // Expanded(
          //   child: ListView.builder(
          //       itemCount: homeDressingServicesList.length,
          //       itemBuilder: (context, index) {
          //         final homeDressingServices = homeDressingServicesList[index];
          //         return Container(
          //           margin:
          //               const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          //           child: HomeDressingServiceWidget(
          //             homeDressingModel: homeDressingServices,
          //             onPress: () {
          //               print(homeDressingController
          //                   .homeDressingServicesAddedList.length);
          //               homeDressingController.addOrRemoveFromList(
          //                 homeDressingModel: homeDressingServices,
          //               );
          //             },
          //           ),
          //         );
          //       }),
          // ),
        ])));
  }
}
