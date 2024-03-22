import 'package:doctor_foot_app/admin/admin_panel.dart';
import 'package:doctor_foot_app/firebase_options.dart';
import 'package:doctor_foot_app/splash_screen.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'firebase_options.dart';

import 'package:google_fonts/google_fonts.dart';

import 'admin/admin_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: kIsWeb ? const AdminLogin() : const SplashScreen());
  }
}
