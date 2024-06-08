

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:todo_task/Config/AppConfig.dart';
import 'package:todo_task/Config/ColorConfig.dart';
import 'package:todo_task/Config/SizeConfig.dart';
import 'package:todo_task/Config/TextConfig.dart';
import 'package:todo_task/Config/ValueConfig.dart';
import 'package:todo_task/ReusableComponent/TextWidget/textWidget.dart';

AppBar toggleAppBarWidget({required double screenWidth,required double screenHeight,required bool toggleStatus,required Function(bool) getCallBackToggleClick}){
  return  AppBar(
    toolbarHeight: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().appBarHeight),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorConfig().statusBarColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
    automaticallyImplyLeading: false,
    backgroundColor: ColorConfig().appBarBackgroundColor,
    titleSpacing: 0,
    title: Container(
      padding: EdgeInsets.symmetric(horizontal: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().appBarHorizontalPadding)),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: textWidget(getText: "${TextConfig().appTitle}", screenHeight: screenHeight, textSize: SizeConfig().appBarTextSize, textColor: ColorConfig().appBarTitleTextColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontMedium, softWrap: true),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textWidget(getText: toggleStatus?TextConfig().taskCompletedText:TextConfig().taskInCompletedText, screenHeight: screenHeight, textSize: SizeConfig().appBarTextSize, textColor: ColorConfig().appBarTitleTextColor, getAlign: TextAlign.center, textStyle: AppConfig().robotoFontMedium, softWrap: true),
                SizedBox(width: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().appBarHorizontalPadding),),
                Container(
                  decoration: BoxDecoration(
                    color: ColorConfig().toggleBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight:SizeConfig().toggleHeight)),),
                  ),
                  width: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().toggleWidth),
                  height: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().toggleHeight),
                  child: FlutterSwitch(
                    width: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().toggleWidth),
                    height: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().toggleHeight),
                    valueFontSize: 0,
                    toggleSize: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().toggleInnerWidth),
                    value: toggleStatus,
                    activeColor: Colors.transparent,
                    inactiveColor: Colors.transparent,
                    toggleColor: toggleStatus?ColorConfig().toggleActiveColor:ColorConfig().toggleInActiveColor,
                    borderRadius: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().toggleInnerWidth),
                    padding: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().toggleInnerPaddingWidth),
                    showOnOff: true,
                    onToggle: (val) {
                      getCallBackToggleClick(val);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}