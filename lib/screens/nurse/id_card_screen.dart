import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class IdCardScreen extends StatefulWidget {
  const IdCardScreen({super.key});

  @override
  State<IdCardScreen> createState() => _IdCardScreenState();
}

class _IdCardScreenState extends State<IdCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: CustomAppbar(
        title: "ID Card",
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.whiteBgColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.live_help_rounded,
                        color: AppColors.whiteBgColor,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Help',
                        style: TextStyle(
                          color: AppColors.whiteBgColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.grey,
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryBlue,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                AssetsConstants.dr_foot_text,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.whiteBgColor,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 250, top: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.successColor,
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 6),
                                        Icon(
                                          Icons.done_outline,
                                          color: AppColors.whiteBgColor,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'Verified',
                                          style: TextStyle(
                                            color: AppColors.whiteBgColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Padding(
                                padding: EdgeInsets.only(left: 22, bottom: 8),
                                child: Column(
                                  children: [
                                    Text(
                                      'Partner Name',
                                      style: TextStyle(
                                        color: AppColors.blackBold,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Locality | Hyderabad',
                                      style: TextStyle(
                                        color: AppColors.grey5,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 22, bottom: 8, top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'MOBILE NUMBER',
                                      style: TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      '+91 8686868686',
                                      style: TextStyle(
                                        color: AppColors.blackBold,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 12),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'ID Number',
                                                style: TextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                '512630445',
                                                style: TextStyle(
                                                  color: AppColors.blackBold,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(12,6,12,6),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.share,
                                                ),
                                                SizedBox(width: 6),
                                                Text(
                                                  'Share',
                                                  style: TextStyle(
                                                    color: AppColors.blackBold,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 32,
                  left: 32,
                  child: Container(
                    height: 105,
                    width: 105,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        AssetsConstants.delivery_boy_image,
                      ),
                      fit: BoxFit.fill,
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
