// import 'dart:io';
// import 'dart:typed_data';

import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/screens/intro_screen.dart';
import 'package:drfootapp/splash_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/constants.dart';
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
// import 'package:flutter/foundation.dart'
//     show consolidateHttpClientResponseBytes, kIsWeb;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  static DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss aaa');
  static DateFormat formatterOnlyDate = DateFormat('yyyy-MM-dd');

  static showAlertDialogger({
    required BuildContext context,
    required Function() yes,
    required Function() no,
    String title = "Confirm",
    String content = "Do you want to proceed?",
  }) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: no,
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
      DateTime? lastDate}) async {
    selectedDate ??= DateTime.now();
    lastDate ??= DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
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

  // For Future need

  // interNetCheck() async {
  //   bool result = await InternetConnectionChecker().hasConnection;
  //   if (result == true) {
  //     logger("interNet is connected");
  //   } else {
  //     ConnectionCheck(BuildContext context) {
  //       AlertDialog alertDialog = AlertDialogger(
  //         title: Text("Connection error"),
  //         content: Text("Please check the internet Connection"),
  //         actions: [ElevatedButton(onPressed: () {}, child: Text("Ok"))],
  //       );
  //       return showDialogger(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return alertDialog;
  //         },
  //       );
  //     }}

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

  // CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////

  // static navigateBasedOnRole(BuildContext context,
  //     {bool signInAnonymously = false}) async {
  //   Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (builder) => const DashBoardScreen()),
  //       (route) => false);
  // }

  static String numberConvertToEnglish(int number) {
    var formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol:
          '', // if you want to add currency symbol then pass that in this else leave it empty.
    ).format(number);
    return formattedNumber.toString();
  }
}

// CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////

// bool checkUserLoginOrNot(BuildContext context) {
//   if (loginUserModel == null) {
//     Utility.toast("Please login");
//     // Navigator.push(
//     //     context, MaterialPageRoute(builder: (context) => LoginPage()));
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => NewLoginScreen()));
//     return false;
//   }
//   return true;
// }

// CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////

// shareImageOrText(BuildContext context, PostModel postModel,
//     {Uint8List? uint8list}) async {
//   var status = await Permission.storage.status;
//   if (!status.isGranted) {
//     await Permission.storage.request();
//   }
//   String title = await getSharingMatter(postModel);
//   if (uint8list != null) {
//     await Share.file(title, "amlog.png", uint8list, 'image/png', text: title);
//   } else if (postModel.imageList.isNotEmpty) {
//     var request = await HttpClient().getUrl(Uri.parse(postModel.imageList[0]));
//     var response = await request.close();
//     Uint8List bytes = await consolidateHttpClientResponseBytes(response);
//     await Share.file(title, "amlog.jpg", bytes, 'image/jpg', text: title);
//   } else {
//     Share.text(title, title, "text/*");
//   }
// }

// CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////

// Future<String> getSharingMatter(PostModel postModel) async {
//   String productUrl = await DynamicsService().generateLink(postModel);
//   String title = '''
// Hello, I found your product on Place Of Sales app very interesting. I have made an enquiry there, can you please tell me more details on:
// The price of the product: ${postModel.price}\n
// Here’s the link of our product on PlaceOfSales: $productUrl\n
// Share link: $downloadAppLink\n
// Awaiting your reply\n''';
//   return title;
// }

// CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////

// sendSMS(UserModel userModel, String message) async {
//   // String msg = Uri.encodeFull(message); // To encode url
//   String msg = message.replaceAll(" ", "+");
//   String url =
//       "http://sms.unik5.com/v3/api.php?username=ajayvja&apikey=31a2a167ded2a2018565&mobile=${userModel.mobileNumber}&senderid=AJYCHE&message=$msg";
//   http.Response response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     Utility.toast("We have sent OTP to your number.");
//   } else {
//     Utility.toast("Failed to send OTP.");
//   }
// }

covertInr(int number) {
  final indianRupeesFormat = NumberFormat.currency(
    name: "INR",
    locale: 'en_IN',
    decimalDigits: 0, // change it to get decimal places
    symbol: '₹',
  );
  return indianRupeesFormat.format(number);
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

// CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////

// Widget callWhatsAppLayout(BuildContext context, String contactNumber) {
//   return Container(
//     height: 40,
//     decoration: const BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(16),
//           bottomLeft: Radius.circular(16),
//           topRight: Radius.circular(16),
//           bottomRight: Radius.circular(16)),
//     ),
//     child: Row(
//       children: [
//         Expanded(
//           flex: 5,
//           child: Container(
//               width: MediaQuery.of(context).size.width / 2.5,
//               decoration: const BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(16),
//                   bottomLeft: Radius.circular(16),
//                 ),
//               ),
//               child: TextButton.icon(
//                   onPressed: () async {
//                     if (checkUserLoginOrNot(context)) {
//                       final Uri launchUri = Uri(
//                         scheme: 'tel',
//                         path: contactNumber,
//                       );

//                       await launchUrl(launchUri);
//                     }
//                   },
//                   icon: const Icon(
//                     Icons.call_sharp,
//                     color: Colors.white,
//                   ),
//                   label: const Text(
//                     "Call",
//                     style: TextStyle(color: Colors.white),
//                   ))),
//         ),
//         Expanded(
//           flex: 5,
//           child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(16),
//                     bottomRight: Radius.circular(16)),
//               ),
//               width: MediaQuery.of(context).size.width / 2.5,
//               child: TextButton.icon(
//                   onPressed: () async {
//                     if (checkUserLoginOrNot(context)) {
//                       launchUrl(
//                           Uri.parse(
//                               'https://wa.me/91$contactNumber?text="i seen your shop in placeofsales of app."'),
//                           mode: LaunchMode.externalApplication);
//                     }
//                   },
//                   icon: const Icon(
//                     FontAwesomeIcons.whatsapp,
//                     color: Colors.white,
//                   ),
//                   label: const Text(
//                     "Whatsapp",
//                     style: TextStyle(color: Colors.white),
//                   ))),
//         ),
//       ],
//     ),
//   );
// }

// CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////

// Widget thisUserPosts(String userid, String header,
//     {bool disableScroll = true}) {
//   return PaginateFirestore(
//     itemsPerPage: 10,
//     shrinkWrap: true,
//     physics: disableScroll
//         ? const NeverScrollableScrollPhysics()
//         : const AlwaysScrollableScrollPhysics(),
//     onEmpty: const EmptyStateWidget(
//       message: "No Posts",
//       bottomMargin: 0,
//     ),
//     header: header.isNotEmpty
//         ? SliverToBoxAdapter(
//             child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               header,
//               maxLines: 1,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ))
//         : null,
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         childAspectRatio: 0.78, crossAxisCount: 2),
//     itemBuilder: (context, documentSnapshots, index) {
//       final data = documentSnapshots[index].data() as Map;
//       PostModel postModel = PostModel(data);
//       return GridPostItem(
//         postModel,
//         hideMorePosts: true,
//       );
//     },
//     query: postsCollectionReference
//         .where('userId', isEqualTo: userid)
//         .orderBy("timestamp", descending: true),
//     itemBuilderType: PaginateBuilderType.gridView,
//     isLive: false,
//   );
// }

// checkAuthTypeAndAskMobileNumber(BuildContext context) {
//   if ((loginUserModel!.typeAuth == 1 ||
//           loginUserModel!.typeAuth == 2 ||
//           loginUserModel!.typeAuth == 3) &&
//       loginUserModel!.socialAuthMobileNumber.isEmpty) {
//     Utility.toast("You need to verify your mobile number posting..");
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (builder) => const VerifyMobileNumberScreen()));
//     return false;
//   }
//   return true;
// }

// Future<String> getPriceMatter(PostModel postModel) async {
//   String productUrl = await DynamicsService().generateLink(postModel);
//   String title = '''
// Hello ${postModel.contactName}, I found your product ${postModel.title} on Place Of Sales app very interesting. can you please tell me price :
// Here’s the link of our product on PlaceOfSales: $productUrl\n
// Awaiting your reply\n''';
//   return title;
// }

// void sendGetPriceMessage(BuildContext context, PostModel postModel) async {
//   if (checkUserLoginOrNot(context)) {
//     String text = await getPriceMatter(postModel);
//     String phoneNumber = "91${postModel.contactNumber}";
//     launchUrl(Uri.parse('https://wa.me/$phoneNumber?text=$text'),
//         mode: LaunchMode.externalApplication);
//   }
// }

// CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////

// Widget getPriceWidget(BuildContext context, PostModel postModel,
//     {double width = 100}) {
//   return InkWell(
//     onTap: () {
//       sendGetPriceMessage(context, postModel);
//     },
//     child: Container(
//       width: width,
//       height: 35,
//       alignment: Alignment.center,
//       padding: const EdgeInsets.fromLTRB(8, 0, 4, 0),
//       decoration: const BoxDecoration(
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(10),
//             bottom: Radius.circular(10),
//           ),
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF3366FF),
//               Color(0xFF00CCFF),
//             ],
//             begin: FractionalOffset(0.0, 0.0),
//             end: FractionalOffset(1.0, 0.0),
//             stops: [0.0, 1.0],
//             tileMode: TileMode.clamp,
//           ),
//           color: Colors.black),
//       child: const Text(
//         "Get Price >",
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   );
// }

// CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////

// Widget reportWidget(BuildContext context, {bool doPop = false}) {
//   return TextButton.icon(
//     onPressed: () {
//       if (doPop) Navigator.pop(context);
//       Navigator.push(context,
//           MaterialPageRoute(builder: (builder) => const ReportScreen()));
//     },
//     label: const Text(
//       "Report",
//       style: TextStyle(
//         color: Colors.red,
//       ),
//     ),
//     icon: const Icon(
//       Icons.report_sharp,
//       color: Colors.red,
//     ),
//   );
// }

// CODE FOR FIREBASE DATABASE SO FOR THE FUTURE USE COMMENTED THIS CODE////
// Future<void> openUrl(String url) async {
//   if (!url.contains("http")) {
//     url = "https://$url";
//   }
//   await launchUrl(
//     Uri.parse(url),
//     mode: LaunchMode.externalApplication,
//   );
// }

// double getShopAverageRating(ShopModel shopModel) {
//   try {
//     return (shopModel.review / shopModel.noOfReviews).toPrecision(1);
//   } catch (e) {
//     return 0.0;
//   }
// }

extension StringExtension on String {
  String toCapitalize() {
    try {
      if (isEmpty) return this;
      return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    } catch (e) {
      return this;
    }
  }
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

bool isAdmin() {
  return kIsWeb;
}

// PaymentStatus status = PaymentStatus.pending;
//   String statusString = enumToString(status);
//   print(statusString); // Output: pending

//   PaymentStatus retrievedStatus = stringToEnum(statusString, PaymentStatus.values);
//   print(retrievedStatus); // Output: PaymentStatus.pending

// Convert enum to string
String enumToString<T>(T enumValue) {
  return enumValue.toString().split('.').last;
}

// Convert string to enum
T? stringToEnum<T>(String value, List<T> values) {
  return values.firstWhere((v) => enumToString(v) == value);
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
  String content = "Do you want to Delete Address?",
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
