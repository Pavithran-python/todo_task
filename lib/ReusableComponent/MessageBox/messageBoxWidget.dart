

import 'package:flutter/material.dart';
import 'package:todo_task/Config/AppConfig.dart';
import 'package:todo_task/Config/ColorConfig.dart';
import 'package:todo_task/Config/SizeConfig.dart';
import 'package:todo_task/Config/ValueConfig.dart';
import 'package:todo_task/ReusableComponent/TextWidget/textWidget.dart';

SnackBar messageBoxWidget({required double screenWidth,required double screenHeight,required String getMessage,required String getActionText,required Function(bool) getCallBackFunction}){
  return SnackBar(
    duration: Duration(seconds: SizeConfig().messageBoxMessageShowDuration),
    padding: EdgeInsets.zero,
    backgroundColor: ColorConfig().messageBoxBackgroundColor,
    content:  Container(
      padding: EdgeInsets.symmetric(horizontal: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().messageBoxHorizontalPadding)),
      height: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().messageBoxHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: textWidget(getText: getMessage, screenHeight: screenHeight, textSize: SizeConfig().messageBoxMessageTextSize, textColor: ColorConfig().messageBoxMessageTextColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontRegular, softWrap: false),
          ),
          TextButton(
            onPressed: (){
              getCallBackFunction(true);
            },
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: textWidget(getText: getActionText, screenHeight: screenHeight, textSize: SizeConfig().messageBoxUndoTextSize, textColor: ColorConfig().messageBoxUndoColor, getAlign: TextAlign.end, textStyle: AppConfig().robotoFontRegular, softWrap: true),
          ),
        ],
      ),
    ),
  );
}