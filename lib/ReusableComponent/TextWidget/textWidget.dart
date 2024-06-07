import 'package:flutter/material.dart';
import 'package:todo_task/Config/ValueConfig.dart';

Text textWidget({required String getText,required double screenHeight,required double textSize,required Color textColor,required TextAlign getAlign,required String textStyle,required bool softWrap}){
  return Text(getText,textScaler: const TextScaler.linear(1.0),textAlign: getAlign,softWrap: softWrap,overflow: softWrap?null:TextOverflow.ellipsis,style:  TextStyle(fontSize: ValueConfig().getValueHeight(screenHeight: screenHeight, getHeight: textSize,),color: textColor,fontFamily:textStyle),);
}