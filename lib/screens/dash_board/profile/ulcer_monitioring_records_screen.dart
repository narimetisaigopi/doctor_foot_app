import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/ulcer_monitor_models/ulcer_monitoring_record_model.dart';
import 'package:drfootapp/screens/dash_board/profile/ulcer_monitoring_record_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/widgets/custom_appbar.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

class UlcerMonitoringRecordsScreen extends StatefulWidget {
  const UlcerMonitoringRecordsScreen({super.key});

  @override
  State<UlcerMonitoringRecordsScreen> createState() =>
      _UlcerMonitoringRecordsScreenState();
}

class _UlcerMonitoringRecordsScreenState
    extends State<UlcerMonitoringRecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: const CustomAppbar(title: "Records"),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 22),
        child: FirestorePagination(
          shrinkWrap: false,
          query: getQuery(),
          viewType: ViewType.list,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          onEmpty: const Center(child: EmptyState()),
          itemBuilder: (context, documentSnapshots, index) {
            UlcerMonitoringRecordModel ulcerMonitoringRecordModel =
                UlcerMonitoringRecordModel.fromJson(
                    documentSnapshots[index].data() as Map);
            return UlcerMonitoringRecordWidget(
              ulcerMonitoringRecordModel: ulcerMonitoringRecordModel,
            );
          },
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     margin: const EdgeInsets.only(left: 16, right: 16, top: 22),
      //     child: const Column(
      //       children: [
      //         RecordWidget(),
      //         SizedBox(
      //           height: 22,
      //         ),
      //         RecordWidget(),
      //         SizedBox(
      //           height: 22,
      //         ),
      //         RecordWidget(),
      //         SizedBox(
      //           height: 22,
      //         ),
      //         RecordWidget(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Query getQuery() {
    Query query =
        ulcerMonitoringRecordsCollectionReference.orderBy("timestamp");
    return query;
  }
}
