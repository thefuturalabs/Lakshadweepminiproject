import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/UI/UI%20ADMIN/UI/1.dart';
import 'package:miniproject/UI/UI%20ADMIN/UI/login.dart';
import 'package:miniproject/UI/controller/controller.dart';
import 'package:miniproject/UI/questions/1.dart';
import 'package:miniproject/UI/questions/components/quesioncard2.dart';
import 'package:miniproject/constants.dart';

import '../../Auth/googleauth.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/p.jpeg",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          SafeArea(
            child: Padding(
              padding:   EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's Play Quiz",
                    style: Theme.of(context).textTheme?.headline4?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Enter Your Information below",style: TextStyle(color: Colors.white),),
                  SizedBox(height: 90,),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Full name",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(34)
                        )
                    ),
                  ),
                  SizedBox(height: 50,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Authhh()));
                    },
                     child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding:EdgeInsets.all(kDefaultPadding * 0.76),
                      decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Text("Login User",style:
                      Theme.of(context).
                      textTheme.button?.
                      copyWith(color: Colors.white),),
                    ),
                  ),
                  SizedBox(height: 50,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginadminj()));
                     },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding:EdgeInsets.all(kDefaultPadding * 0.76),
                      decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Text("Login admin",style:
                      Theme.of(context).
                      textTheme.button?.
                      copyWith(color: Colors.white),),
                    ),
                  )


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
