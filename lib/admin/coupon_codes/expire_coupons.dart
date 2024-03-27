import 'package:drfootapp/models/coupon_code_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constatns.dart';
import 'package:drfootapp/utils/widgets/my_switch.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

class ExpireCoupons extends StatefulWidget {
  const ExpireCoupons({super.key});

  @override
  State<ExpireCoupons> createState() => _ExpireCouponsState();
}

class _ExpireCouponsState extends State<ExpireCoupons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FirestorePagination(
          onEmpty: const Center(
            child: Text("No Coupons found"),
          ),
          viewType: ViewType.list,
          bottomLoader: const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
          query: couponCodesCollectionReference.where('isExpired',
              isEqualTo: true),
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
                                fontWeight: FontWeight.bold, fontSize: 20),
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
