import 'package:flutter/material.dart';
import 'package:miniproject/constants.dart';


class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
            color: kGrayColor
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("async",style: TextStyle(color: kGrayColor,fontSize: 16),),
          Container(
            height: 26,
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(color: kGrayColor)
            ),
          )
        ],
      ),
    );
  }
}
