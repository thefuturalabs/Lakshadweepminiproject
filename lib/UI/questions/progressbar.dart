import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/UI/controller/controller.dart';
import 'package:miniproject/constants.dart';

class Progresss extends StatelessWidget {
  const Progresss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3F4768,),width: 3),
          borderRadius: BorderRadius.circular(50)
      ),
      child: GetBuilder<queController>(
        init: queController(),
         builder: (controller) {
          print(controller.animation.value);
          return Stack(
            children: [
              LayoutBuilder(builder: (context,constraints)=>Container(
                width: constraints.maxWidth *controller.animation.value,
                decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50)
                ),
              )),
              Positioned.fill(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${(controller.animation.value* 15  ).round()}",style: TextStyle(color: Colors.white),),
                    Icon(Icons.access_alarm_sharp,color: Colors.white,)
                  ],
                ),
              ))
            ],
          );
        }
      ),
    );
  }
}
