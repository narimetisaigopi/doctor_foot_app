import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
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
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 24,
              ),
              const SizedBox(
                width: 05,
              ),
              SizedBox(
                // height: 60,
                // width: 133,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "kpbColonyText",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ).tr(),
                        const Icon(Icons.expand_more)
                      ],
                    ),
                    const Text(
                      "venkataNagarText",
                    ).tr()
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
