import 'package:drfootapp/notifications/notifications/listen_push_notifications.dart';
import 'package:drfootapp/splash_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  if (!kIsWeb) {
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
    await listenPushNotifications();
  }
  
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale("te"),
      Locale("hi"),
      Locale("en"),
    ],
    path: "assets/translation",
    fallbackLocale: const Locale("en"),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey, // set property
      title: appName,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      home: const SplashScreen(),
    );
  }
}
