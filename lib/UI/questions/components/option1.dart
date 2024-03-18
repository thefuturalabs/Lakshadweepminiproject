import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:miniproject/UI/controller/controller.dart';
import 'package:miniproject/constants.dart';

class Option1 extends StatelessWidget {
  const Option1({Key? key, required this.text, required this.index, required this.press}) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<queController>(
      init: (queController()),
      builder: (queController) {
        Color getTheRightcolor() {
          if (queController.isAnswer) {
            if (index == queController.correctanswer) {
              return kGreenColor;
            } else if (index == queController.selectedans && queController.selectedans != queController.correctanswer) {
              return kRedColor;
            }
            return kGrayColor;
          }
          return kGrayColor;
        }
         IconData gettherightIcons(){
          return getTheRightcolor()== kRedColor ?Icons.close :Icons.done;
             }


        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightcolor()), // Use the function here
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${index + 1}.$text", style: TextStyle(color: getTheRightcolor(), fontSize: 16),),
                Container(
                  height: 26,
                  width: 25,
                  decoration: BoxDecoration(
                    color: getTheRightcolor()== kGrayColor ? Colors.transparent :getTheRightcolor(),
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: getTheRightcolor()),
                  ),
                  child:gettherightIcons()==kGrayColor? null : Icon(gettherightIcons(),size: 16,),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
