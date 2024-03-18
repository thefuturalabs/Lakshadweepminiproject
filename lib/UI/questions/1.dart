import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miniproject/UI/controller/controller.dart';
import 'package:miniproject/UI/questions/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    queController _controller=Get.put(queController());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(onPressed: 
              _controller.nextquestion
            , child: Text("Skip"))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: body(),
      ),
    );
  }
}
