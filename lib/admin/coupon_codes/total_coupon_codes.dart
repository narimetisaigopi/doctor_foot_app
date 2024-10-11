import 'package:drfootapp/admin/coupon_codes/create_coupon_code.dart';
import 'package:drfootapp/models/coupon_code_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widgets/my_switch.dart';

class TotalCouponCodes extends StatefulWidget {
  final bool isAdmins;
  const TotalCouponCodes({super.key, this.isAdmins = false});

  @override
  State<TotalCouponCodes> createState() => _TotalCouponCodesState();
}

class _TotalCouponCodesState extends State<TotalCouponCodes> {
  var docId = couponCodesCollectionReference.doc().id;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                documentSnapshots[index].data() as Map<String, dynamic>);

            return couponCodeWidget(couponCodeModel, () {
              widget.isAdmins
                  ? Get.to(() => CreateCouponCode(
                        couponCodeModel: couponCodeModel,
                        isAdmin: true,
                      ))
                  : null;
            });
          },
        ),
      ),
    );
  }

  Widget couponCodeWidget(CouponCodeModel couponCodeModel, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: AppColors.whiteBgColor,
            boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
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
                    Text(
                      couponCodeModel.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            MySwitch(couponCodeModel: couponCodeModel),
          ],
        ),
      ),
    );
  }
}
