import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newproject/login&siginup/login/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController conformpassController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  void CreateUserIn() async {
    try {
      if (passController.text == conformpassController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);
      } else {
        Fluttertoast.showToast(
          msg: "password dont match!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }

      Fluttertoast.showToast(
        msg: "Login successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.of(context).pop();
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Login failed: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 3),
                  spreadRadius: 2,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // TextFormField(
                      //   autofocus: false,
                      //   controller: nameController,
                      //   keyboardType: TextInputType.emailAddress,
                      //   decoration: InputDecoration(
                      //       hintText: "name",
                      //       prefixIcon: const Icon(Icons.person),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(15),
                      //       )),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'feild required';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autofocus: false,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'feild required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autofocus: false,
                        controller: passController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "pasword",
                            prefixIcon: const Icon(Icons.key),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'feild required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autofocus: false,
                        controller: conformpassController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "conform pasword",
                            prefixIcon: const Icon(Icons.key_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'feild required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black)),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {}
                              CreateUserIn();
                            },
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                      Row(
                        children: [
                          const Text('Already you have an account!! '),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
