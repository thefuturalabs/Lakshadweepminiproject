// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/animation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';
// import 'package:miniproject/UI/models/m.dart';
// import 'package:miniproject/UI/score/score.dart';
//
//
// class queController extends GetxController with SingleGetTickerProviderMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   Animation<double> get animation => this._animation;
//   late PageController _pageController;
//   PageController get pageController => this._pageController;
//
//   List data = [];
//
//   getData()async{
//     var ref = await FirebaseFirestore.instance.collection("questions").get();
//     return ref.docs;
//   }
//
//   List<Question> _questions = sample_data
//       .map(
//         (question) => Question(
//         id: question['id'],
//         question: question['question'],
//         options: question['options'],
//         answer: question['answer_index']),
//   )
//       .toList();
//   List<Question> get questions => this._questions;
//
//   bool _isAnswer = false;
//   bool get isAnswer => _isAnswer;
//   set isAnswer(bool value) {
//     _isAnswer = value;
//     update();
//   }
//
//   late int _correctanser;
//   int get correctanswer => _correctanser;
//   set correctanswer(int value) {
//     _correctanser = value;
//     update();
//   }
//
//   late int _selectedans;
//   int get selectedans => this._selectedans;
//
//   RxInt _Questionsnumber = 1.obs;
//   RxInt get Questionnumber => this._Questionsnumber;
//
//   late int _numbofcorrect;
//   int get numberofcorrect => this._numbofcorrect;
//
//   queController() {
//     _correctanser = 0;
//   }
//
//   @override
//   void onInit({int durationSeconds = 10}) {
//     _animationController =
//         AnimationController(duration: Duration(seconds: durationSeconds), vsync: this);
//     _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
//       ..addListener(() {
//         update();
//       });
//     _animationController.forward().whenComplete(nextquestion);
//     _pageController = PageController();
//     super.onInit();
//   }
//
//   @override
//   void onClose() {
//     _animationController.dispose();
//     _pageController.dispose();
//     super.onClose();
//   }
//
//   void checkAns(Question question, int selectedIndex) {
//     isAnswer = true;
//     correctanswer = question.answer;
//     _selectedans = selectedIndex;
//     if (_correctanser == _selectedans) _numbofcorrect++;
//     _animationController.stop();
//     update();
//
//     Future.delayed(Duration(seconds: 3), () {
//       nextquestion();
//     });
//   }
//
//   void nextquestion() {
//      if (_Questionsnumber.value != questions.length) {
//       _isAnswer = false;
//
//       _pageController.nextPage(duration: Duration(microseconds: 150), curve: Curves.ease);
//
//       _animationController.reset();
//       _animationController.forward().whenComplete(nextquestion);
//     }
//     else{
//       Get.to(Scoree());
//     }
//   }
//
//   void updatetheNumber(int index) {
//     _Questionsnumber.value += 1;
//   }
//   void addQuestion(String text, List<String> list, int parse) {}
// }
//


import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:miniproject/UI/models/m.dart';
import 'package:miniproject/UI/score/score.dart';

class queController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  Animation<double> get animation => this._animation;
  late PageController _pageController;
  PageController get pageController => this._pageController;

  List data = [];

  getData() async {
    var ref = await FirebaseFirestore.instance.collection("questions").get();
    return ref.docs;
  }

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
        id: question['id'],
        question: question['question'],
        options: question['options'],
        answer: question['answer_index']),
  )
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswer = false;
  bool get isAnswer => _isAnswer;
  set isAnswer(bool value) {
    _isAnswer = value;
    update();
  }

  late int _correctanser;
  int get correctanswer => _correctanser;
  set correctanswer(int value) {
    _correctanser = value;
    update();
  }

  late int _selectedans;
  int get selectedans => this._selectedans;

  RxInt _Questionsnumber = 1.obs;
  RxInt get Questionnumber => this._Questionsnumber;

  int _numbofcorrect = 0; // Initialize _numbofcorrect here
  int get numberofcorrect => this._numbofcorrect;

  queController() {
    _correctanser = 0;
  }

  @override
  void onInit({int durationSeconds = 10}) {
    _animationController = AnimationController(
        duration: Duration(seconds: durationSeconds), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(nextquestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }

  void checkAns(Question question, int selectedIndex) {
    isAnswer = true;
    correctanswer = question.answer;
    _selectedans = selectedIndex;
    if (_correctanser == _selectedans) _numbofcorrect++;
    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3), () {
      nextquestion();
    });
  }

  void nextquestion() {
    if (_Questionsnumber.value != questions.length) {
      _isAnswer = false;

      _pageController.nextPage(
          duration: Duration(microseconds: 150), curve: Curves.ease);

      _animationController.reset();
      _animationController.forward().whenComplete(nextquestion);
    } else {
      Get.to(Scoree());
    }
  }

  void updatetheNumber(int index) {
    _Questionsnumber.value += 1;
  }

  void addQuestion(String text, List<String> list, int parse) {}
}















// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:miniproject/UI/models/m.dart';
// import 'package:miniproject/UI/score/score.dart';
//
// class queController extends GetxController with SingleGetTickerProviderMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   Animation<double> get animation => this._animation;
//
//   late PageController _pageController;
//   PageController get pageController => this._pageController;
//
//   late Future<List<Question>> _questionsFuture;
//
//   List<Question> _questions = [];
//
//   Future<List<Question>> fetchQuestions() async {
//     var ref = await FirebaseFirestore.instance.collection("questions").get();
//     return ref.docs.map((doc) => Question.fromMap(doc.data())).toList();
//   }
//
//   @override
//   void onInit({int durationSeconds = 10}) {
//     _animationController =
//         AnimationController(duration: Duration(seconds: durationSeconds), vsync: this);
//     _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
//       ..addListener(() {
//         update();
//       });
//     _animationController.forward().whenComplete(nextquestion);
//     _pageController = PageController();
//     _questionsFuture = fetchQuestions();
//     super.onInit();
//   }
//
//   @override
//   void onClose() {
//     _animationController.dispose();
//     _pageController.dispose();
//     super.onClose();
//   }
//
//   void checkAns(Question question, int selectedIndex) {
//     // Your implementation
//   }
//
//   void nextquestion() {
//     // Your implementation
//   }
//
//   void updatetheNumber(int index) {
//     // Your implementation
//   }
//
//   void addQuestion(String text, List<String> list, int parse) {
//     // Your implementation
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<Question>>(
//         future: _questionsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             _questions = snapshot.data!;
//             return buildQuizUI();
//           }
//         },
//       ),
//     );
//   }
//
//   Widget buildQuizUI() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Expanded(
//           child: PageView.builder(
//             controller: _pageController,
//             itemCount: _questions.length,
//             itemBuilder: (context, index) {
//               Question question = _questions[index];
//               return buildQuestionCard(question);
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildQuestionCard(Question question) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           question.question,
//           style: TextStyle(fontSize: 20),
//         ),
//         SizedBox(height: 20),
//         ...List.generate(
//           question.options.length,
//               (index) => RadioListTile(
//             title: Text(question.options[index]),
//             value: index,
//             groupValue: _selectedans,
//             onChanged: (_) => checkAns(question, index),
//           ),
//         ),
//       ],
//     );
//   }
// }
