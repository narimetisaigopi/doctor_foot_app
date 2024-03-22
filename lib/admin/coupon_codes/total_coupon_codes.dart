import 'package:doctor_foot_app/models/coupon_code_model.dart';
import 'package:doctor_foot_app/models/home_dressing/c_model.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/firebase_constatns.dart';
import 'package:doctor_foot_app/utils/widgets/my_switch.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

class AllCoupons extends StatefulWidget {
  const AllCoupons({super.key});

  @override
  State<AllCoupons> createState() => _AllCouponsState();
}

class _AllCouponsState extends State<AllCoupons> {
  var docId = couponCodesCollectionReference.doc().id;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("All Coupon Codes"),
      //   centerTitle: true,
      // ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FirestorePagination(
          onEmpty: const Center(
            child: Text("No couponCode found"),
          ),
          viewType: ViewType.list,
          bottomLoader: const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
          query: couponCodesCollectionReference.where('isExpired',
              isEqualTo: false),
          itemBuilder: (context, documentSnapshots, index) {
            CouponCodeModel couponCodeModel = CouponCodeModel.fromJson(
                documentSnapshots.data() as Map<String, dynamic>);

            return Container(
              width: double.infinity,
              height: 80,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: AppColors.whiteBgColor,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.discount,
                        size: 40,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            couponCodeModel.couponCode,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          Text(
                            "discount  :${couponCodeModel.maxDiscount}%",
                          ),
                        ],
                      ),
                    ],
                  ),
                  MySwitch(couponCodeModel: couponCodeModel),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
