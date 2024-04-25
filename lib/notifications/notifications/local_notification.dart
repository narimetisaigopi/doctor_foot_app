import 'dart:developer';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  Future<void> initNotification() async {
    // Android initialization
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // ios initialization
    final DarwinInitializationSettings initializationSettingsIOS =
        const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    // the initialization settings are initialized after they are setted
    await FlutterLocalNotificationsPlugin().initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: onSelectNotification,
        onDidReceiveNotificationResponse: onSelectNotification);
  }

  static onSelectNotification(NotificationResponse notificationResponse) async {
    parsePayloadAndGo(notificationResponse.payload!);
  }

  static parsePayloadAndGo(String payload) {
    try {
      log("parsePayloadAndGo payload $payload");
      RegExp regex = RegExp(r'redirectUrl: ([^,]+)');

      Match? match = regex.firstMatch(payload);
      if (match != null) {
        String result = match.group(1)!;
        log(result);
        openUrl(result);
      } else {
        log('No match found');
      }
    } catch (e, stack) {
      logger("parsePayloadAndGo exp ${e.toString()}");
      logger("parsePayloadAndGo stack ${stack.toString()}");
    }
  }
}
