

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/Config/AppConfig.dart';
import 'package:todo_task/Config/ColorConfig.dart';
import 'package:todo_task/Config/SizeConfig.dart';
import 'package:todo_task/Config/TextConfig.dart';
import 'package:todo_task/Config/ValueConfig.dart';
import 'package:todo_task/ReusableComponent/TextWidget/textWidget.dart';

Widget ProfilePage({required double screenWidth,required double screenHeight,required int? selectedUser,required List<int> getUserList,required Function(int) callBackSelectedUser}){
  return Container(
    width: screenWidth,
    height: screenHeight,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenWidth,
          padding: EdgeInsets.symmetric(horizontal: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().profilePageHorizontalPadding)),
          child: textWidget(getText: TextConfig().userText, screenHeight: screenHeight, textSize: SizeConfig().profilePageTextSize, textColor: ColorConfig().profilePageTitleColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontMedium, softWrap:true),
        ),
        SizedBox(
          height:ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().profilePageVerticalPadding),
        ),
        Container(
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().profilePageBorderRadius))),
            border: Border.all(color:ColorConfig().profilePageBorderColor,width: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().profilePageBorderWidth)),
          ),
          padding: EdgeInsets.symmetric(horizontal: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().profilePageHorizontalPadding),),
          margin: EdgeInsets.symmetric(horizontal: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().profilePageHorizontalPadding),),
          child: DropdownButton<int>(
            padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
            value: selectedUser,
            hint: Container(
              child:textWidget(getText: selectedUser==null?TextConfig().selectUserText:selectedUser==0?TextConfig().allUserText:"${TextConfig().userText} $selectedUser", screenHeight: screenHeight, textSize: SizeConfig().profilePageDropDownTextSize, textColor: ColorConfig().profilePageDropdownHintColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontMedium, softWrap: true),
            ),
            isExpanded: true,
            icon: null,
            iconSize: 0,
            underline: SizedBox(height: 0,),
            items: getUserList.map((int getUserItem) {
              return DropdownMenuItem(
                value: getUserItem,
                child: Container(
                  child:textWidget(getText: getUserItem==0?TextConfig().allUserText:"${TextConfig().userText} $getUserItem", screenHeight: screenHeight, textSize: SizeConfig().profilePageDropDownTextSize, textColor: ColorConfig().profilePageDropdownColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontMedium, softWrap: true),
                ),
              );
            }).toList(),
            onChanged: (int? getUser) {
              callBackSelectedUser(getUser!);
              },
          ),
        ),

      ],
    ),
  );
}