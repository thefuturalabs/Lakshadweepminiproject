import 'package:flutter/material.dart';
import 'package:miniproject/constants.dart';

class Option3 extends StatelessWidget {
  const Option3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(" Which keyword is used to mark a function as asynchronous in Dart?",
      style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),);
  }
}
