

import 'package:todo_task/Config/SizeConfig.dart';

class ValueConfig{

  double getValueWidth({required double screenWidth,required double getWidth}){
    return screenWidth*(getWidth/SizeConfig().screenWidth);
  }

  double getValueHeight({required double screenHeight,required double getHeight}){
    return screenHeight*(getHeight/SizeConfig().screenHeight);
  }

}