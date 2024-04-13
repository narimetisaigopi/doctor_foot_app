import 'package:drfootapp/screens/auth_screens/sign_in_screen.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user logged in
          if (snapshot.hasData) {
            return const DashBoardScreen();
          }
          // user not logged in
          else {
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
