import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miniproject/UI/UI%20ADMIN/UI/login.dart';
import 'package:miniproject/UI/controller/controller.dart';

class AddQuestionScreen extends StatefulWidget {
  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();
  TextEditingController correctAnswerController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Question'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Text("logout"),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("no")),
                    TextButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginadminj()));

                    }, child: Text("yes")),

                  ],
                );
              });
             },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/p.jpeg",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: questionController,
                    decoration: InputDecoration(
                      labelText: 'Question',
                      hintText: "Enter your question",
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: option1Controller,
                    decoration: InputDecoration(
                      labelText: 'Option 1',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: option2Controller,
                    decoration: InputDecoration(
                      labelText: 'Option 2',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: option3Controller,
                    decoration: InputDecoration(
                      labelText: 'Option 3',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: option4Controller,
                    decoration: InputDecoration(
                      labelText: 'Option 4',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: correctAnswerController,
                    decoration: InputDecoration(
                      labelText: 'Correct Answer',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      String correctAnswerText = correctAnswerController.text;
                      int correctAnswer;
                      if (correctAnswerText.isNotEmpty && int.tryParse(correctAnswerText) != null) {
                        correctAnswer = int.parse(correctAnswerText);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter a valid integer for the correct answer.'),
                          ),
                        );
                        return;
                      }

                      _firestore.collection('questions').add({
                        'question': questionController.text,
                        'options': [
                          option1Controller.text,
                          option2Controller.text,
                          option3Controller.text,
                          option4Controller.text,
                        ],
                        'correct_answer': correctAnswer,
                      });
                      questionController.clear();
                      option1Controller.clear();
                      option2Controller.clear();
                      option3Controller.clear();
                      option4Controller.clear();
                      correctAnswerController.clear();
                    },
                    child: Text('Add Question'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
