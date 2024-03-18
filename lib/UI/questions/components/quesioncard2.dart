import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:miniproject/UI/controller/controller.dart';
import 'package:miniproject/UI/models/m.dart';
import 'package:miniproject/UI/questions/components/option1.dart';
import 'package:miniproject/UI/questions/components/options.dart';
import 'package:miniproject/UI/questions/components/queoption.dart';
import 'package:miniproject/constants.dart';


class Quizz extends StatelessWidget {
  const Quizz({Key? key, required this.question}) : super(key: key);

  final Question question ;

  @override
  Widget build(BuildContext context) {
    queController _controller =Get.put(queController());

    return   Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding,

      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
        children: [
         Text(question.question,
           style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
         ),
          SizedBox(height: kDefaultPadding/2,),

     ...List.generate(
         question.options.length,
             (index) => Option1(index :index,
               text:question.options[index],
             press: () => _controller.checkAns(question, index)
             ))
        ],
      ),
    );
  }
}
