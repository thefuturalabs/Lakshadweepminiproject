import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newproject/login&siginup/login/login.dart';
import 'package:newproject/login&siginup/siginup/siginup.dart';

class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  bool showLoginPage = true;

  //toogle
  void tooglepage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage();
      
    } else {
      return RegisterPage();
    }
  }
}
