

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/Config/ColorConfig.dart';
import 'package:todo_task/Config/ValueConfig.dart';
import 'package:todo_task/ReusableComponent/Image/SvgFileWidget.dart';

import '../../Config/ImageConfig.dart';

BottomNavigationBar bottomBarWidget({required double screenWidth,required double screenHeight,required int selectedIndex,required Function(int) callBackSelectedIndex}){
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedFontSize: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: 16),
    unselectedFontSize: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: 14),
    selectedItemColor: ColorConfig().statusBarColor,
    unselectedItemColor: Colors.black,
    onTap: (int getIndex){
      print(getIndex);
      callBackSelectedIndex(getIndex);
    },
    currentIndex: selectedIndex,
    items: [
      BottomNavigationBarItem(
        icon: svgFileWidget(imagePath: ImageConfig().bottomBarTodoIcon, getBoxFit: BoxFit.fitHeight, svgImageWidth: null, svgImageHeight: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: 20,), getColor: Colors.black,),
        activeIcon: svgFileWidget(imagePath: ImageConfig().bottomBarTodoIcon, getBoxFit: BoxFit.fitHeight, svgImageWidth: null, svgImageHeight: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: 24),getColor: ColorConfig().statusBarColor),
        label: "Todo",
      ),
      BottomNavigationBarItem(
        icon: svgFileWidget(imagePath: ImageConfig().bottomBarProfileIcon, getBoxFit: BoxFit.fitHeight, svgImageWidth: null, svgImageHeight: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: 20),getColor: Colors.black),
        activeIcon: svgFileWidget(imagePath: ImageConfig().bottomBarProfileIcon, getBoxFit: BoxFit.fitHeight, svgImageWidth: null, svgImageHeight: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: 24),getColor: ColorConfig().statusBarColor),
        label: "Profile",
      ),
    ],
  );
}