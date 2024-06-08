


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/Config/AppConfig.dart';
import 'package:todo_task/Config/ColorConfig.dart';
import 'package:todo_task/Config/ImageConfig.dart';
import 'package:todo_task/Config/SizeConfig.dart';
import 'package:todo_task/Config/TextConfig.dart';
import 'package:todo_task/Config/ValueConfig.dart';
import 'package:todo_task/Model/Todo.dart';
import 'package:todo_task/ReusableComponent/Image/SvgFileWidget.dart';
import 'package:todo_task/ReusableComponent/TextWidget/textWidget.dart';

Widget todoListView({required double screenWidth,required double screenHeight,required Todo getTodoItem}){
  return Container(
    width: screenWidth,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenWidth,
          height: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().todoListHeight),
          margin: EdgeInsets.symmetric(horizontal: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().todoListHorizontalPadding)),
          decoration: BoxDecoration(
            color: ColorConfig().todoListBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().todoListCardRadius))),
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurStyle:BlurStyle.outer,
                color: ColorConfig().todoListCardElevationColor.withOpacity(SizeConfig().todoListCardElevationOpacity),
                blurRadius: SizeConfig().todoListBlurRadius,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().todoCardIdWidth),
                height: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().todoListHeight),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConfig().appBarBackgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().todoListCardRadius)),bottomLeft: Radius.circular(ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().todoListCardRadius))),
                ),
                child: textWidget(getText: "${getTodoItem.todoId}", screenHeight: screenHeight, textSize: SizeConfig().todoCardIdFontSize, textColor: ColorConfig().todoListCardIdFontColor, getAlign: TextAlign.center, textStyle: AppConfig().robotoFontMedium, softWrap: true),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().todoListHorizontalPadding)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: textWidget(getText: "${TextConfig().userText} ${getTodoItem.todoUserId}", screenHeight: screenHeight, textSize:SizeConfig().todoListUserIdTextSize, textColor: ColorConfig().todoListUserIdTextColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontRegular, softWrap: true),
                      ),
                      Flexible(
                        child: Container(
                          child: textWidget(getText: "${getTodoItem.todoMessage}", screenHeight: screenHeight, textSize: SizeConfig().todoListMessageTextSize, textColor: ColorConfig().todoListMessageTextColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontMedium, softWrap: true),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              svgFileWidget(imagePath: getTodoItem.todoStatus?ImageConfig().completedIcon:ImageConfig().pendingIcon, getBoxFit:BoxFit.fitWidth, svgImageWidth: SizeConfig().todoListIconSize, svgImageHeight: SizeConfig().todoListIconSize, getColor: null),
              SizedBox(
                width: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().todoListHorizontalPadding),
              ),
            ],
          ),
        ),
        SizedBox(
          height: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().todoListGapBetweenCards),
        ),
      ],
    ),
  );
}