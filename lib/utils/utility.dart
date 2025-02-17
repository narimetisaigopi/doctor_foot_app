import 'package:drfootapp/app_config.dart';
import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/screens/intro_screen.dart';
import 'package:drfootapp/splash_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/sp_helper.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_circular_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants/assets_constants.dart';
import 'widgets/custom_image.dart';

class Utility {
  static DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss aaa');
  static DateFormat formatterOnlyDate = DateFormat('yyyy-MM-dd');

  static showAlertDialogger({
    required BuildContext context,
    required Function() yes,
    Function()? no,
    String title = "Confirm",
    String content = "Do you want to proceed?",
  }) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: no ??
                () {
                  Get.back();
                },
            child: const Text(
              "No",
              style: TextStyle(color: Colors.black),
            )),
        TextButton(
            onPressed: yes,
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.red),
            ))
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // static Future<bool?> redAlertDialog({
  //   required BuildContext context,
  //   String title = "",
  //   String subTitle = "",
  //   required Widget image,
  //   bool isButtonType = false,
  //   VoidCallback? upload,
  //   VoidCallback? no,
  //   VoidCallback? yes,
  //   required String buttonName,
  //   required Color buttonBg,
  //   Color textColor = AppColors.redColor,
  // }) {
  //   return Alert(
  //     context: context,
  //     content: Column(
  //       children: [
  //         Text(
  //           title,
  //           style: const TextStyle(
  //             color: AppColors.cancelColor,
  //             fontSize: 20,
  //           ),
  //         ),
  //         Text(
  //           subTitle,
  //           style: const TextStyle(
  //             color: AppColors.black2,
  //             fontSize: 16,
  //             fontWeight: FontWeight.w500,
  //           ),
  //           textAlign: TextAlign.center,
  //         ),
  //         image,
  //       ],
  //     ),
  //     buttons: [
  //       isButtonType
  //           ? DialogButton(
  //               onPressed: upload,
  //               color: buttonBg,
  //               child: Text(
  //                 buttonName,
  //                 style: TextStyle(
  //                   color: textColor,
  //                   fontSize: 20,
  //                 ),
  //               ),
  //             )
  //           : DialogButton(
  //               onPressed: no,
  //               color: buttonBg,
  //               child: Text(
  //                 buttonName,
  //                 style: TextStyle(
  //                   color: textColor,
  //                   fontSize: 20,
  //                 ),
  //               ),
  //             ),
  //       DialogButton(
  //         onPressed: yes,
  //         color: AppColors.primaryBlue,
  //         child: Text(
  //           buttonName,
  //           style: TextStyle(
  //             color: textColor,
  //             fontSize: 20,
  //           ),
  //         ),
  //       )
  //     ],
  //   ).show();
  // }

  static myBottomSheet(BuildContext context,
      {required Widget widget, double heightFactor = 0.5}) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColors.bottomSheetBackgroundColor,
        isDismissible: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter stateSetter) {
              return FractionallySizedBox(
                heightFactor: heightFactor,
                child: widget,
              );
            },
          );
        });
  }

  static Widget customDivider() {
    return Divider(
      height: 10,
      color: Colors.grey.shade300,
    );
  }

  static Widget customChoiceChip({
    required String title,
    required bool isSelected,
    required Function(String) onTap,
    bool sizeNeeded = false,
    double horizontal = 10,
    double vertical = 5,
    double? width,
    required IconData iconData,
  }) {
    return InkWell(
      onTap: () {
        onTap(title);
      },
      child: Container(
        width: width,
        height: 35,
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryBlue : Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.grey,
              width: 1,
            )),
        child: Row(
          children: [
            Icon(iconData, color: isSelected ? Colors.white : Colors.grey),
            const SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  static Widget choiceContainer({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    bool sizeNeeded = false,
    double horizontal = 30,
    double vertical = 10,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : AppColors.whiteBgColor,
          border: Border.all(color: AppColors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////

  static logout(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Logout"),
      content: const Text("Do you want to logout from the app?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("No")),
        TextButton(
            onPressed: () async {
              Utility.toast("Thanks for using app");
              logoutFunction(context);
            },
            child: const Text("Yes"))
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static logoutFunction(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await Get.put(AuthenticationController())
          .getCurrentUserDocRef()
          .update({"deviceToken": null});
      await SPHelper().clear();
      Get.offAll(() => const SplashScreen());
    } catch (e) {
      logger(e);
    } finally {
      Get.offAll(() => const SplashScreen());
    }
  }

  static Future<String?> showMyDatePicker(BuildContext context,
      {bool returnOnlyDate = true,
      DateTime? selectedDate,
      DateTime? firstDate,
      DateTime? lastDate}) async {
    selectedDate ??= DateTime.now();
    lastDate ??= DateTime.now();
    firstDate ??= DateTime(1950);
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: firstDate,
        lastDate: lastDate);
    if (picked != null && picked != selectedDate) {
      return returnOnlyDate
          ? formatterOnlyDate.format(picked)
          : DateTime.now().toString();
    }

    return "";
  }

  static checkUserUserTypeAndNavigate() {
    if (FirebaseAuth.instance.currentUser != null) {
      Get.offUntil(
          MaterialPageRoute(builder: (builder) => const DashBoardScreen()),
          (route) => false);
    } else {
      Get.offUntil(MaterialPageRoute(builder: (builder) => const IntroScreen()),
          (route) => false);
    }
  }

  static toast(String message,
      {Color textColor = Colors.white, Color backgroundColor = Colors.black}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 16.0);
  }

  static Widget dropDown({
    @required BuildContext? context,
    String title = "",
    List list = const [],
    String selectedOne = "",
    @required Function(String?)? onChanged,
  }) {
    return Row(
      children: [
        title.isNotEmpty
            ? Expanded(
                flex: 4,
                child: Text(title, style: const TextStyle(color: Colors.white)))
            : Container(),
        Expanded(
          flex: 6,
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                  onTap: () {
                    if (context != null) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                  },
                  hint: Text(
                    selectedOne,
                    style: const TextStyle(color: Colors.white),
                  ),
                  isExpanded: true,
                  onChanged: (str) => onChanged!(str as String),
                  items: list
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList()),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  static Widget arrangeDataLabels(
      BuildContext context, String title, String value) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Text(
                "$title ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  static String numberConvertToEnglish(int number) {
    var formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol:
          '', // if you want to add currency symbol then pass that in this else leave it empty.
    ).format(number);
    return formattedNumber.toString();
  }

  Widget policyWidget(BuildContext context, Color color) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "By creating this post, you are accepting our",
            style: TextStyle(color: color),
            children: [
              TextSpan(
                text: "\nUser generated Content Policy",
                style: const TextStyle(color: Colors.green),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    policyDialogger(context);
                  },
              )
            ]));
  }

  policyDialogger(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User generated content policy'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    '- PlaceOfSales follows all security elements as per user generated content policy which are globally accepted.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '- The content you publish will be secure and confidential.'),
                SizedBox(
                  height: 10,
                ),
                Text('- User privacy is our utmost prioritized policy'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '- Any information regarding user identification is not allowed to publish and we request you to follow our policy'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '- We do not accept any derogatory, sexually explicit, abusive, racist content to publish '),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '- PII - We require Phone Number as Personal identification for signing into app and we secure your information according to our privacy policy'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '- We do not share your information to any third party services'),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget customDropDownItem(
      String hint, List<String> valuesList, Function(String) onChanged) {
    return SizedBox(
      width: double.infinity,
      child: InputDecorator(
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            )),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(12),
            isExpanded: true,
            iconSize: 24,
            isDense: true,
            hint: Text(hint),
            onChanged: (String? newValue) {
              onChanged(newValue!);
            },
            items: valuesList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
// CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////

// List<String> getCategories(CategoriesType categoriesType) {
//   List<String> data = [];
//   if (categoriesType == CategoriesType.feed) {
//     data = feedCategoriesMap.keys.toList();
//   } else if (categoriesType == CategoriesType.handloom) {
//     data = handloomCategoriesMap.keys.toList();
//   }
//   return data;
// }

// List<String> getSubCategories(
//     CategoriesType categoriesType, String selectedCategory) {
//   List<String> data = [];
//   if (categoriesType == CategoriesType.feed) {
//     if (feedCategoriesMap[selectedCategory] != null) {
//       data = feedCategoriesMap[selectedCategory].toList();
//     }
//   } else if (categoriesType == CategoriesType.handloom) {
//     if (handloomCategoriesMap[selectedCategory] != null) {
//       data = handloomCategoriesMap[selectedCategory].toList();
//     }
//   }
//   return data;
// }

  void makeAndAlertDialogger(
    BuildContext context, {
    String title = "",
    String description = "",
    String rightText = "",
    Function()? rightOnFunction,
    String leftText = "",
    Function()? leftOnFunction,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          title: title.isNotEmpty ? Text(title) : null,
          content: description.isNotEmpty
              ? SingleChildScrollView(child: Text(description))
              : null,
          actions: <Widget>[
            if (leftText.isNotEmpty)
              TextButton(
                  onPressed: () {
                    leftOnFunction!.call();
                  },
                  child: Text(leftText)),
            if (rightText.isNotEmpty)
              TextButton(
                  onPressed: () {
                    rightOnFunction!.call();
                  },
                  child: Text(rightText)),
          ],
        );
      },
    );
  }

  closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Widget payableData({
    String title = "title",
    String value = "value",
    TextStyle style = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    TextStyle valueStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style,
        ),
        Text(
          value,
          style: valueStyle,
        ),
      ],
    );
  }

  showLoader(BuildContext context) {
    Loader.show(context,
        isSafeAreaOverlay: false,
        isBottomBarOverlay: false,
        overlayFromBottom: 80,
        overlayColor: Colors.black26,
        progressIndicator: const CustomCircularLoader(),
        themeData: Theme.of(context).copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.green)));
  }

  hideLoader(BuildContext context) {
    Loader.hide();
  }

  String maskMobileNumber(String mobileNumber) {
    if (mobileNumber.length == 10) {
      String maskedNumber = 'xxxxxx${mobileNumber.substring(6)}';
      return maskedNumber;
    } else {
      return 'Invalid mobile number';
    }
  }

  static bool isAdmin() {
    return kIsWeb;
  }

// Convert enum to string
  static String enumToString<T>(T enumValue) {
    String result = "";
    try {
      // Get the last part of the enum and split it at each uppercase letter
      result = enumValue.toString().split('.').last;

      // Add space before each capital letter and convert to title case
      result = result.replaceAllMapped(
          RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}');

      // Capitalize the first letter of the result
      return result
          .trim()
          .split(' ')
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(' ');
    } catch (e) {
      return result;
    }
  }

// Convert string to enum
  static T? stringToEnum<T>(String value, List<T> values) {
    return values.firstWhere((v) => Utility.enumToString(v) == value);
  }

  getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null ? user.uid : "";
  }

  showAlertDialog({
    required BuildContext context,
    required Function() yesCallback,
    required Function() noCallback,
    String title = "Confirm",
    String content = "Do you want to proceed?",
  }) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              yesCallback.call();
            },
            child: const Text("Yes")),
        TextButton(
            onPressed: () {
              noCallback.call();
            },
            child: const Text("No"))
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showConfirmationBottomSheet({
    required BuildContext context,
    String title = "'Are you sure you want to perform this action?'",
    String confirmButtonText = "Yes",
    String cancelButtonText = "No",
    Function()? onConfirm,
    Function()? onCancel,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: CustomButton(
                      onPress: onConfirm,
                      buttonName: confirmButtonText,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: CustomButton(
                      onPress: () {
                        Get.back();
                      },
                      buttonName: cancelButtonText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String formatDate(DateTime inputDate) {
    String formattedDate = DateFormat('EEEE/d/MMM/yyyy').format(inputDate);
    return formattedDate;
  }

  String formatTime(DateTime dateTime) {
    String period = DateFormat('a').format(dateTime); // 'AM' or 'PM'
    String formattedTime = DateFormat('h:mm').format(dateTime); // '3:00'
    // Determine the period of the day
    String periodOfDay = 'Morning';
    if (dateTime.hour >= 12 && dateTime.hour < 17) {
      periodOfDay = 'Afternoon';
    } else if (dateTime.hour >= 17) {
      periodOfDay = 'Evening';
    }
    return '$periodOfDay - $formattedTime $period';
  }

  Future<void> openUrl(String url) async {
    print("openUrl $url");
    if (!url.contains("http")) {
      url = "https://$url";
    }
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  String toIndianFormat(dynamic value) {
    final indianRupeesFormat = NumberFormat.currency(
      name: "INR",
      locale: 'en_IN',
      decimalDigits: 0, // change it to get decimal places
      symbol: '₹ ',
    );
    return indianRupeesFormat.format(value);
  }

  static String getFileNameFromUrl(String url) {
    // Parse the URL
    Uri uri = Uri.parse(url);
    // Extract the path and split it to get the filename
    String path = uri.path;
    String fileName = path.split('/').last;
    return fileName;
  }

  static String convertTimeStamp(DateTime dateTime) {
    // 05-08-2024
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(dateTime); // Formatting the date
    return formattedDate;
  }

  static String convertToMonthEnglishFormat(String date) {
    // Aug 05,2024
    String formattedDate = DateFormat('MMM dd, yyyy')
        .format(DateTime.parse(date)); // Formatting the date
    return formattedDate;
  }

  static bool isAppointmentCancelled(AppointmentStatus appointmentStatus) {
    bool isCancelled = appointmentStatus == AppointmentStatus.cancelled;
    return isCancelled;
  }

  static String getCurrentWeekDayName() {
    // Get the current date
    DateTime now = DateTime.now();
    // Use DateFormat to get the full weekday name
    String weekDay =
        DateFormat('EEEE').format(now); // e.g., "Monday", "Tuesday"
    return weekDay;
  }

  static String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static int getAppointmentTodayId() {
    String today = DateFormat('yyyyMMdd').format(DateTime.now());
    return int.parse(today);
  }

  static double getAverageRating(dynamic reviewCount, dynamic totalRating) {
    if (reviewCount == 0 || totalRating == 0) {
      return 0;
    }
    double normalizedTotalRating = (totalRating / (reviewCount * 5)) * 5;
    normalizedTotalRating = normalizedTotalRating.toPrecision(1);
    return normalizedTotalRating;
  }

  static goToHome() {
    Get.offAll(() => const DashBoardScreen());
  }

  static Future<bool?> stateAlertDialog(
      {required BuildContext context,
      required Function() onDone,
      String title = "",
      String description = "",
      String buttonText = "",
      String image = AssetsConstants.appointment_cancel,
      Color color = AppColors.cancelColor}) {
    return Alert(
      context: context,
      closeIcon: Container(),
      content: Column(
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          if (description.isNotEmpty)
            Text(
              description,
              style: const TextStyle(
                color: AppColors.black2,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          CustomImage(
            path: image,
            height: 169,
            width: 223,
            fit: BoxFit.contain,
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: onDone,
          color: color,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: AppColors.whiteBgColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ).show();
  }
}

bool isUserApp() => AppConfig.shared.flavor == Flavor.user;
bool isPartnerApp() => AppConfig.shared.flavor == Flavor.partner;
bool isAdminApp() => AppConfig.shared.flavor == Flavor.admin;
