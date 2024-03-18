//  import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:miniproject/UI/controller/controller.dart';
//
// class Scoree extends StatelessWidget {
//   const Scoree({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final queController _qnController = Get.put(queController());
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//            Image.asset(
//             "assets/images/p.jpeg",
//             fit: BoxFit.fill,
//             height: double.infinity,
//             width: double.infinity,
//             alignment: Alignment.center,
//           ),
//           Column(
//             children: [
//               SizedBox(height: 100,),
//                Text(
//                 "Score",
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline3
//                     ?.copyWith(color: Colors.white),
//               ),
//                SizedBox(height: 30,),
//                Text(
//                 "${_qnController.correctanswer * 10}/${_qnController.questions.length * 10}",
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline3
//                     ?.copyWith(color: Colors.white),
//               ),
//              ],
//           )
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:miniproject/UI/controller/controller.dart';
//
// class Scoree extends StatelessWidget {
//   const Scoree({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final queController _qnController =  Get.put(queController());
//     final TextStyle? _scoreTextStyle = Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white);
//
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             "assets/images/p.jpeg",
//             fit: BoxFit.fill,
//             height: double.infinity,
//             width: double.infinity,
//             alignment: Alignment.center,
//           ),
//           Column(
//             children: [
//               SizedBox(height: 100),
//               Text(
//                 "Score",
//                 style: _scoreTextStyle,
//               ),
//               SizedBox(height: 30),
//               Text(
//                 "${_qnController.correctanswer * 10}/${_qnController.questions.length * 10}",
//                 style: _scoreTextStyle,
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/UI/controller/controller.dart';

import '../../Auth/signup.dart';

class Scoree extends StatelessWidget {
  const Scoree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final queController _qnController = Get.put(queController());
    final TextStyle? _scoreTextStyle =
    Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white);

    int correctMarks = _qnController.numberofcorrect * 1;
    int incorrectMarks =
        (_qnController.questions.length - _qnController.numberofcorrect) * 1;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/p.jpeg",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Column(
            children: [
              SizedBox(height: 100),
              Text(
                "Score",
                style: _scoreTextStyle,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Correct",
                        style: _scoreTextStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "$correctMarks",
                        style: _scoreTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Incorrect",
                        style: _scoreTextStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "$incorrectMarks",
                        style: _scoreTextStyle,
                      ),
                    ],
                  ),
                ],
              ),

            Padding(
              padding: const EdgeInsets.only(top: 400),
              child: Divider(),
            ),
             TextButton(onPressed: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>Authhh()));
             }, child:  Text("Back to Login",style: TextStyle(color: Colors.blue),))
            ],
          )
        ],
      ),
    );
  }
}
