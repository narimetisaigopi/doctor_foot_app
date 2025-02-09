import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class NurseBookingOrdersScreen extends StatefulWidget {
  const NurseBookingOrdersScreen({super.key});

  @override
  State<NurseBookingOrdersScreen> createState() =>
      _NurseBookingOrdersScreenState();
}

class _NurseBookingOrdersScreenState extends State<NurseBookingOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: const CustomAppbar(
        title: "Bookings",
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.more_vert,
              color: AppColors.whiteBgColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.grey2,
                              ),
                              child: const Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 40, 20, 40),
                                    child: Icon(
                                      Icons.person,
                                      size: 30,
                                      color: AppColors.grey5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 110,
                              decoration: const BoxDecoration(
                                color: AppColors.greenColor,
                                borderRadius:
                                    BorderRadiusDirectional.horizontal(
                                        end: Radius.circular(14)),
                              ),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 8,
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteBgColor,
                              border: Border.all(
                                color: AppColors.grey2,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.pin_drop_outlined),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Location",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "10.00AM",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Divider(
                                  thickness: 2,
                                ),
                                const SizedBox(height: 8),
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.circle,
                                        size: 30,
                                        color: AppColors.successColor,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Michael toss",
                                            style: TextStyle(
                                              color: AppColors.black1,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "16-6-54, Venkateswarapuram, BalavilNagar, Ramamuthy",
                                            style: TextStyle(
                                              color: AppColors.black1,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.visible,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.circle,
                                        size: 30,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Contact info",
                                            style: TextStyle(
                                              color: AppColors.black1,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            " 7095649714",
                                            style: TextStyle(
                                              color: AppColors.black1,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 24),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Distance",
                                        style: TextStyle(
                                          color: AppColors.black1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("2.16 KM",
                                          style: TextStyle(
                                            color: AppColors.black1,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.cancel,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              70, 12, 70, 12),
                                          child: Text(
                                            "Accept",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
