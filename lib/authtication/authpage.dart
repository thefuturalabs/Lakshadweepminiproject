import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/login&siginup/login/login.dart';
import 'package:newproject/screen/upload_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user login
          if (snapshot.hasData) {
            return const UploadScreen();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
