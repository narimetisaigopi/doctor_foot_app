import 'package:drfootapp/controllers/home_dressing_controller.dart';
import 'package:drfootapp/models/home_dressing/home_dressing_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/firebase_constatns.dart';
import 'package:drfootapp/utils/widgets/home_dressing_service_widget.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SvgImageWidget(
              path: AssetsConstants.home_dressing_cover_img,
              height: 200,
              width: double.infinity,
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: FirestorePagination(
                  query: homeDressingServicesCollectionReference,
                  itemBuilder: (context, documentSnapshots, index) {
                    HomeDressingModel homeDressingModel =
                        HomeDressingModel.fromJson(
                            documentSnapshots.data() as Map<String, dynamic>);

                    return HomeDressingServiceWidget(
                      homeDressingModel: homeDressingModel,
                      onPress: () {
                        print(homeDressingController
                            .homeDressingServicesAddedList.length);
                        homeDressingController.addOrRemoveFromList(
                          homeDressingModel: homeDressingModel,
                        );
                      },
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
