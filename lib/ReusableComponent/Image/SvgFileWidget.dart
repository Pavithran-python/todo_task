
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgFileWidget({required String imagePath,required BoxFit? getBoxFit,required double? svgImageWidth, required double? svgImageHeight,required Color? getColor}){
  return SvgPicture.asset(imagePath,fit: getBoxFit!,width: svgImageWidth,height: svgImageHeight,color: getColor,);
}