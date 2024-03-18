import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:miniproject/UI/questions/1.dart';
import 'package:miniproject/UI/questions/components/quesioncard2.dart';
import '../constants.dart';

class Authhh extends StatefulWidget {
  const Authhh({Key? key}) : super(key: key);

  @override
  State<Authhh> createState() => _AuthhhState();
}

class _AuthhhState extends State<Authhh> {

  TextEditingController Emailcontroller=TextEditingController();
  TextEditingController Passwordcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
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

                  SizedBox(height: 90,),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(34)
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(34)
                        )
                    ),
                  ),
                  SizedBox(height: 50,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizScreen()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding:EdgeInsets.all(kDefaultPadding * 0.76),
                      decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Text("Sign up ",style:
                      Theme.of(context).
                      textTheme.button?.
                      copyWith(color: Colors.white),),
                    ),
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
