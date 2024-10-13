import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/admin/banners/create_banner.dart';
import 'package:drfootapp/models/banner_model.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/widgets/banner_widget.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAdminBannersScreen extends StatefulWidget {
  const AllAdminBannersScreen({super.key});

  @override
  State<AllAdminBannersScreen> createState() => _AllAdminBannersScreenState();
}

class _AllAdminBannersScreenState extends State<AllAdminBannersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_outlined),
          onPressed: () {
            Get.to(() => const CreateBanner());
          }),
      body: FirestorePagination(
        shrinkWrap: false,
        query: getQuery(),
        viewType: ViewType.list,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        onEmpty: const Center(child: EmptyState()),
        itemBuilder: (context, documentSnapshots, index) {
          BannerModel bannerModel =
              BannerModel.fromMap(documentSnapshots[index].data() as Map);
          return BannerWidget(
            bannerModel: bannerModel,
            isAdmin: true,
          );
        },
      ),
    );
  }

  Query getQuery() {
    Query query = bannersCollectionReference.orderBy("timestamp");
    return query;
  }
}
