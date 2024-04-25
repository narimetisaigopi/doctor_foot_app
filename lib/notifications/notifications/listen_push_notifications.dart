import 'dart:convert';
import 'dart:io';

import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'local_notification.dart';
import 'package:http/http.dart' as http;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await setupFlutterNotifications();
  parseAndProcessRemoteMessages(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;
bool isFlutterLocalNotificationsInitialized = false;
Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }

  NotificationService().initNotification();

  // Declaration of variables
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  if (Platform.isIOS)
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

  if (Platform.isIOS) {
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await firebaseMessaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;

  String image = message.data['image'] ?? "";

  BigPictureStyleInformation? bigPictureStyleInformation;
  if (image.isNotEmpty) {
    final http.Response response = await http.get(Uri.parse(image));
    bigPictureStyleInformation = BigPictureStyleInformation(
        ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(response.bodyBytes)));
  }

  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            styleInformation: bigPictureStyleInformation,
            importance: Importance.max,
            color: AppColors.primary,
            playSound: true,
            icon: '@mipmap/ic_stat_ic_notification',
          ),
        ),
        payload: message.data.toString());
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future listenPushNotifications() async {
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }

  FirebaseMessaging.instance
      .getInitialMessage()
      .then((value) => parseAndProcessRemoteMessages(value));

  FirebaseMessaging.onMessage.listen((event) {
    parseAndProcessRemoteMessages(event);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
}

parseAndProcessRemoteMessages(RemoteMessage? remoteMessage) {
  print("parseAndProcessRemoteMessages called.");
  if (remoteMessage != null) {
    print(
        "parseAndProcessRemoteMessages remoteMessage.data ${remoteMessage.data}");
    // NotificationModel notificationModel =
    //     NotificationModel.fromMap(remoteMessage.data);
    // navigateBaseOnNotificationType(notificationModel);
    showFlutterNotification(remoteMessage);
    print("parseAndProcessRemoteMessages new push notification $remoteMessage");
  }
}
