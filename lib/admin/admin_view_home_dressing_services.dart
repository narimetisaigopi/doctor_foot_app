import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/admin/create_home_dressing_services.dart';
import 'package:drfootapp/controllers/home_dressing_controller.dart';
import 'package:drfootapp/models/home_dressing/home_dressing_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/widgets/home_dressing_service_widget.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminViewHomeDressingServices extends StatefulWidget {
  const AdminViewHomeDressingServices({super.key});

  @override
  State<AdminViewHomeDressingServices> createState() =>
      _AdminViewHomeDressingServicesState();
}

class _AdminViewHomeDressingServicesState
    extends State<AdminViewHomeDressingServices> {
  HomeDressingController homeDressingController =
      Get.put(HomeDressingController());

  int selectedFootServiceTab = FootServices.nailTrimmingService.index;
  int selectedDressingServiceTab = -1;

  String dateTime = DateTime.now().toString();

  updateListKey() {
    setState(() {
      dateTime = DateTime.now().toString();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeDressingController>(
        builder: (homeDressingController) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => CreateHomeDressingServices(
                    homeDressingModel: HomeDressingModel(),
                  ));
            },
            child: const Icon(Icons.add_outlined),
          ),
          body: Column(
            children: [
              Wrap(
                children: List<Widget>.generate(
                  FootServices.values.length,
                  (int idx) {
                    FootServices footServices = FootServices.values[idx];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ChoiceChip(
                          label: Text(footServices.name.toString()),
                          selected: selectedFootServiceTab == idx,
                          onSelected: (bool selected) {
                            updateListKey();
                            setState(() {
                              selectedDressingServiceTab = -1;
                              selectedFootServiceTab = footServices.index;
                            });
                          }),
                    );
                  },
                ).toList(),
              ),
              if (selectedFootServiceTab == FootServices.dressingService.index)
                Wrap(
                  children: List<Widget>.generate(
                    DressingServices.values.length,
                    (int idx) {
                      DressingServices dressingServices =
                          DressingServices.values[idx];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChoiceChip(
                            label: Text(dressingServices.name.toString()),
                            selected: selectedDressingServiceTab == idx,
                            onSelected: (bool selected) {
                              updateListKey();
                              setState(() {
                                selectedDressingServiceTab =
                                    dressingServices.index;
                              });
                            }),
                      );
                    },
                  ).toList(),
                ),
              Expanded(
                child: FirestorePagination(
                  key: Key(dateTime),
                  query: getQuery(),
                  itemBuilder: (context, documentSnapshots, index) {
                    HomeDressingModel homeDressingModel =
                        HomeDressingModel.fromJson(
                            documentSnapshots.data() as Map<String, dynamic>);
                    return InkWell(
                      onTap: () {
                        Get.to(() => CreateHomeDressingServices(
                              isUpdate: true,
                              homeDressingModel: homeDressingModel,
                            ));
                      },
                      child: HomeDressingServiceWidget(
                        homeDressingModel: homeDressingModel,
                        onPress: () {
                          homeDressingController.addOrRemoveFromList(
                            homeDressingModel: homeDressingModel,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ));
    });
  }

  Query getQuery() {
    print("selectedFootServiceTab $selectedFootServiceTab");
    print("selectedDressingServiceTab $selectedDressingServiceTab");
    Query query = homeDressingServicesCollectionReference
        .where("footService", isEqualTo: selectedFootServiceTab)
        .where("isActive", isEqualTo: true);
    if (selectedDressingServiceTab != -1) {
      query = homeDressingServicesCollectionReference
          .where("footService", isEqualTo: selectedFootServiceTab)
          .where("dressingService", isEqualTo: selectedDressingServiceTab)
          .where("isActive", isEqualTo: true);
    }
    return query;
  }

  Widget serviceWidget({
    Function()? onTap,
    String title = "View Home Dressing Service",
    IconData icon = Icons.medical_services,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 100,
              color: AppColors.primary,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
