import 'package:doctor_foot_app/splash_screen.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDL2Th_cowV21x4ryJ1cdvobTD8rZF5E68",
          appId: "1:249366730872:android:aaf2ce3e5c146748b0f58d",
          messagingSenderId: "249366730872",
          projectId: "drfootapp-2a1c8",
          storageBucket: "gs://drfootapp-2a1c8.appspot.com"));
  await EasyLocalization.ensureInitialized();
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
      title: "Doctor Foot",
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
