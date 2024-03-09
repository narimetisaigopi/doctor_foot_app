import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(left: 16, top: 78, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 24,
                        ),
                        SizedBox(
                          width: 05,
                        ),
                        SizedBox(
                          height: 50,
                          width: 133,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    Strings.kpbColonyText,
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(Icons.expand_more)
                                ],
                              ),
                              Text(
                                Strings.venkataNagarText,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            size: 32,
                          ),
                          color: AppColors.searchButtonColor,
                          onPressed: () {},
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            size: 32,
                          ),
                          color: AppColors.notificationsButtonColor,
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              );
  }
}