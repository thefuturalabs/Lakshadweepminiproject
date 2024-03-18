import 'package:flutter/material.dart';
import 'package:miniproject/UI/questions/components/option1.dart';
import 'package:miniproject/UI/questions/components/options.dart';
import 'package:miniproject/constants.dart';

class Option2 extends StatelessWidget {
  const Option2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Text(" Which keyword is used to mark a function as asynchronous in Dart?",
            style: Theme.of(context).
            textTheme.headline6?.
            copyWith(color: kBlackColor
            ),),
          SizedBox(height: kDefaultPadding/2,),
          // Option1(),
          // Option1(),
          // Option1(),
          Options()

        ],
      ),
    );
  }
}
