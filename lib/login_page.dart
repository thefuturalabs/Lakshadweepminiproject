import 'package:chat_app/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final String userName = "";
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    addName({required String name}) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('userName', name);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                onChanged: (value) {},
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  addName(name: nameController.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ));
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
