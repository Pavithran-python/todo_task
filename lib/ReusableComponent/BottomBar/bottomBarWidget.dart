

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/Config/ColorConfig.dart';
import 'package:todo_task/Config/SizeConfig.dart';
import 'package:todo_task/Config/TextConfig.dart';
import 'package:todo_task/Config/ValueConfig.dart';
import 'package:todo_task/ReusableComponent/Image/SvgFileWidget.dart';

import '../../Config/ImageConfig.dart';

BottomNavigationBar bottomBarWidget({required double screenWidth,required double screenHeight,required int selectedIndex,required Function(int) callBackSelectedIndex}){
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedFontSize: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().selectedFontSize),
    unselectedFontSize: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().unSelectedFontSize),
    selectedItemColor: ColorConfig().statusBarColor,
    unselectedItemColor: ColorConfig().unSelectedFontColor,
    onTap: (int getIndex){
      print(getIndex);
      callBackSelectedIndex(getIndex);
    },
    currentIndex: selectedIndex,
    items: [
      BottomNavigationBarItem(
        icon: svgFileWidget(imagePath: ImageConfig().bottomBarTodoIcon, getBoxFit: BoxFit.fitHeight, svgImageWidth: null, svgImageHeight: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().unSelectedIconSize,), getColor: ColorConfig().unSelectedFontColor,),
        activeIcon: svgFileWidget(imagePath: ImageConfig().bottomBarTodoIcon, getBoxFit: BoxFit.fitHeight, svgImageWidth: null, svgImageHeight: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().selectedIconSize),getColor: ColorConfig().statusBarColor),
        label: TextConfig().todoText,
      ),
      BottomNavigationBarItem(
        icon: svgFileWidget(imagePath: ImageConfig().bottomBarProfileIcon, getBoxFit: BoxFit.fitHeight, svgImageWidth: null, svgImageHeight: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().unSelectedIconSize),getColor: ColorConfig().unSelectedFontColor),
        activeIcon: svgFileWidget(imagePath: ImageConfig().bottomBarProfileIcon, getBoxFit: BoxFit.fitHeight, svgImageWidth: null, svgImageHeight: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: SizeConfig().selectedIconSize),getColor: ColorConfig().statusBarColor),
        label: TextConfig().profileText,
      ),
    ],
  );
}