


import 'package:flutter/cupertino.dart';

Widget todoListView({required double screenWidth,required double screenHeight}){
  return Container(
    width: screenWidth,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenWidth,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(6)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurStyle:BlurStyle.outer,
                color: Color(0xFF999999).withOpacity(0.5),
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
            ],
          ),

        ),

        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}