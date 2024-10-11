import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/admin/create_foot_service.dart';
import 'package:drfootapp/controllers/foot_services_controller.dart';
import 'package:drfootapp/models/home_dressing/foot_service_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/widgets/foot_service_widget.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminViewFootServices extends StatefulWidget {
  const AdminViewFootServices({super.key});

  @override
  State<AdminViewFootServices> createState() => _AdminViewFootServicesState();
}

class _AdminViewFootServicesState extends State<AdminViewFootServices> {
  FootServiceController homeDressingController =
      Get.put(FootServiceController());

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
    return GetBuilder<FootServiceController>(builder: (footServiceController) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => CreateFootService(
                    homeDressingModel: FootServiceModel(),
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
                    FootServiceModel footServiceModel =
                        FootServiceModel.fromJson(
                            documentSnapshots[index]
                            .data() as Map<String, dynamic>);
                    return InkWell(
                      onTap: () {
                        Get.to(() => CreateFootService(
                              isUpdate: true,
                              homeDressingModel: footServiceModel,
                            ));
                      },
                      child: FootServiceWidget(
                        footServiceModel: footServiceModel,
                        onPress: () {
                          footServiceController.addOrRemoveFromList(
                            footServiceModel: footServiceModel,
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
    Query query = footServicesCollectionReference
        .where("footService", isEqualTo: selectedFootServiceTab)
        .where("isActive", isEqualTo: true);
    if (selectedDressingServiceTab != -1) {
      query = footServicesCollectionReference
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
