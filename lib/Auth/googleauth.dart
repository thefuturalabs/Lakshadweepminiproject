// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:miniproject/UI/questions/1.dart';
// import '../constants.dart';
//
// class Authhh extends StatefulWidget {
//   const Authhh({Key? key}) : super(key: key);
//
//   @override
//   State<Authhh> createState() => _AuthhhState();
// }
//
// class _AuthhhState extends State<Authhh> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             "assets/images/p.jpeg",
//             fit: BoxFit.fill,
//             height: double.infinity,
//             width: double.infinity,
//             alignment: Alignment.center,
//           ),
//           SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 90),
//                   TextField(
//                     controller: emailController,
//                     style: TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: "Email",
//                       hintStyle: TextStyle(color: Colors.white),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(34),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextField(
//                     controller: passwordController,
//                     style: TextStyle(color: Colors.white),
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: "Password",
//                       hintStyle: TextStyle(color: Colors.white),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(34),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 50),
//                   isLoading
//                       ? CircularProgressIndicator()
//                       : InkWell(
//                     onTap: _signInWithEmailAndPassword,
//                     child: Container(
//                       alignment: Alignment.center,
//                       width: double.infinity,
//                       padding: EdgeInsets.all(kDefaultPadding * 0.76),
//                       decoration: BoxDecoration(
//                         gradient: kPrimaryGradient,
//                         borderRadius: BorderRadius.all(Radius.circular(12)),
//                       ),
//                       child: Text(
//                         "Login",
//                         style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _signInWithEmailAndPassword() async {
//     try {
//       setState(() {
//         isLoading = true;
//       });
//
//       String email = emailController.text.trim();
//       String password = passwordController.text;
//
//       if (email.isEmpty || password.isEmpty) {
//         // Handle empty email or password
//         print("Email and password cannot be empty");
//         return;
//       }
//
//       var userCredential = await _auth.signInAnonymously(
//       );
//       User? user = userCredential.user;
//
//       if (user != null) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => QuizScreen()),
//         );
//       } else {
//         print("Login failed");
//       }
//     } catch (e) {
//       print("Error logging in: $e");
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miniproject/UI/questions/1.dart';
import '../constants.dart';

class Authhh extends StatefulWidget {
  const Authhh({Key? key}) : super(key: key);

  @override
  State<Authhh> createState() => _AuthhhState();
}

class _AuthhhState extends State<Authhh> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/p.jpeg",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 90),
                  TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(34),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(34),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  isLoading
                      ? CircularProgressIndicator()
                      : InkWell(
                    onTap: _signInWithEmailAndPassword,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: EdgeInsets.all(kDefaultPadding * 0.76),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });

      String email = emailController.text.trim();
      String password = passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please enter both email and password"),
          ),
        );
        return;
      }

      var userCredential = await _auth.signInAnonymously();

      User? user = userCredential.user;

      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizScreen()),
        );
      } else {
        print("Login failed");
      }
    } catch (e) {
      print("Error logging in: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
