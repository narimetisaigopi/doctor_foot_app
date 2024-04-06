import 'package:drfootapp/admin/admin_panel.dart';
import 'package:drfootapp/controllers/coupon_code_controller.dart';
import 'package:drfootapp/models/coupon_code_model.dart';
import 'package:drfootapp/utils/constants/firebase_constatns.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class CreateCouponCode extends StatefulWidget {
  final bool isAdmin;
  final CouponCodeModel couponCodeModel;
  const CreateCouponCode({
    super.key,
    required this.couponCodeModel,
    this.isAdmin = false,
  });

  @override
  State<CreateCouponCode> createState() => _CreateCouponCodeState();
}

class _CreateCouponCodeState extends State<CreateCouponCode> {
  final CouponCodeController _couponCodeController =
      Get.put(CouponCodeController());
  @override
  void initState() {
    if (widget.isAdmin) {
      _couponCodeController.couponNameController.text =
          widget.couponCodeModel.couponCode;

      _couponCodeController.couponMaxDiscountController.text =
          widget.couponCodeModel.maxDiscount.toString();

      _couponCodeController.couponDescriptionController.text =
          widget.couponCodeModel.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              widget.isAdmin
                  ? Align(
                      alignment: Alignment.topRight,
                      child: TextButton.icon(
                        onPressed: () {
                          Utility.showAlertDialog(
                              content: "Do you want to Delete Coupon Code",
                              context: context,
                              yes: () async {
                                await couponCodesCollectionReference
                                    .doc(widget.couponCodeModel.docId)
                                    .delete();
                                Utility.toast("Coupon Code Deleted",
                                    backgroundColor: Colors.red);
                                Get.back();
                              },
                              no: () {
                                Navigator.pop(context);
                              });
                        },
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                        label: const Text(
                          "Delete Coupon",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              MyTextField(
                  label: "Coupon name",
                  leadingIcon: const Icon(Icons.discount_outlined),
                  hint: "Coupon name",
                  textEditingController:
                      _couponCodeController.couponNameController,
                  onPress: () {}),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  label: "Coupon Discount",
                  maxLength: 3,
                  textInputType: TextInputType.number,
                  leadingIcon: const Icon(Icons.percent),
                  hint: "Coupon Discount",
                  textEditingController:
                      _couponCodeController.couponMaxDiscountController,
                  onPress: () {}),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  label: "Coupon Description",
                  maxLength: 3,
                  leadingIcon: const Icon(Icons.description),
                  hint: "Coupon Description",
                  textEditingController:
                      _couponCodeController.couponDescriptionController,
                  onPress: () {}),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                buttonName: widget.isAdmin ? "Update Coupon" : "Create Coupon",
                onPress: () async {
                  await createCouponCode();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  createCouponCode() async {
    if (_couponCodeController.couponNameController.text.isNotEmpty &&
        _couponCodeController.couponMaxDiscountController.text.isNotEmpty &&
        _couponCodeController.couponDescriptionController.text.isNotEmpty) {
      int discount =
          int.parse(_couponCodeController.couponMaxDiscountController.text);
      if (discount < 100 && discount > 0) {
        CouponCodeModel codeModel = await _couponCodeController
            .checkCouponCode(_couponCodeController.couponNameController.text);
        if (codeModel.couponCode.isEmpty) {
          CouponCodeModel couponCodeModel = CouponCodeModel();
          var docId = couponCodesCollectionReference.doc().id;
          couponCodeModel.couponCode =
              _couponCodeController.couponNameController.text;
          couponCodeModel.uids = [];
          couponCodeModel.docId = docId;
          couponCodeModel.description =
              _couponCodeController.couponDescriptionController.text;
          // couponCodeModel.expireDate =
          //     _couponCodeController.couponExpireDateController.text;
          couponCodeModel.maxDiscount = discount;
          await couponCodesCollectionReference
              .doc(docId)
              .set(couponCodeModel.toMap());

          Get.offUntil(
                  MaterialPageRoute(builder: (context) => const AdminPanel()),
                  (route) => false)!
              .then((value) {
            Navigator.pop(context);
          });
        } else {
          Utility.toast("Coupon Already Exists");
        }
      } else {
        Utility.toast("invalid coupon code");
      }
    }
  }
}
