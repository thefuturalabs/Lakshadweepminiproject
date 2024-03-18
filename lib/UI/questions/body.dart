import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:miniproject/UI/controller/controller.dart';
import 'package:miniproject/UI/questions/components/option1.dart';
import 'package:miniproject/UI/questions/components/option2.dart';
import 'package:miniproject/UI/questions/components/quesioncard2.dart';
 import 'package:miniproject/UI/questions/progressbar.dart';
import 'package:miniproject/constants.dart';
 class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    queController _questionController = Get.put(queController());
    return Stack(
        children: [
          Image.asset(
            "assets/images/p.jpeg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
     Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Progresss(),
            ),
            SizedBox(height: kDefaultPadding,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Obx(()=>Text.rich(
          TextSpan(
              text: "Question ${_questionController.Questionnumber.value}",
              style: Theme.of(context).textTheme.headline4?.copyWith(color: kSecondaryColor),
                 children: [
               TextSpan(text: "/${_questionController.questions.length}",
                   style: Theme.of(context).textTheme.headline5?.
                   copyWith(color:kSecondaryColor ))

                     ])),
            ),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(height: kDefaultPadding,),
              Expanded(child:
              PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _questionController.pageController,
                onPageChanged: _questionController.updatetheNumber,
                itemCount: _questionController.questions.length,
                  itemBuilder: (context ,index)=>Quizz(question: _questionController.questions[index]),
    ))
          ],
        ),
        ],
      );
  }
}

