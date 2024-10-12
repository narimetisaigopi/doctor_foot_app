import 'dart:convert';
import 'package:drfootapp/utils/enums.dart';
import 'package:http/http.dart' as http;

import 'dart:core';


class NotificationCenter {
  String title, message, toUserId;
  NotificationType notificationType;
  String orderId;
  String? userId;
  String? vendorId;
  bool useCurrentUserName;

  NotificationCenter(
      {required this.title,
      required this.message,
      required this.toUserId,
      required this.notificationType,
      required this.orderId,
      this.userId,
      this.useCurrentUserName = false,
      this.vendorId});

  sendTopicPushNotification({String imageUrl = ""}) async {
    print("sendPushNotification");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "key="
    };
    var body = {
      "to": "/topics/all",
      "notification": {
        "title": title,
        "body": message,
        "image": imageUrl,
        "icon": "icon",
        "sound": "default"
      },
      "data": {
        "title": title,
        "body": message,
        "image": imageUrl,
        "redirectUrl": orderId,
      }
    };
    var url = Uri.parse("https://fcm.googleapis.com/fcm/send");
    http.Response response =
        await http.post(url, headers: headers, body: jsonEncode(body));
  }
}
