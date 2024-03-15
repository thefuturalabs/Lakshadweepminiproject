import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> widgets = List.generate(
    10,
    (index) => Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.amber,
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(5)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .89,
              height: min(screenWidth / 3.3 * (16 / 9), screenHeight * .9),
              child: OverlappedCarousel(
                widgets: widgets,
                //List of widgets
                currentIndex: 2,
                onClicked: (index) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("You clicked at $index"),
                    ),
                  );
                  print(index);
                },
                // To obscure or blur cards not in focus use the obscure parameter.
                obscure:.5,
                // To control skew angle
                skewAngle: .2,
              ),
            ),
            const Gap(10),

          ],
        ),
      ),
    );
  }
}
