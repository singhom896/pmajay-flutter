


import 'package:flutter/cupertino.dart';

import '../../utills/CustomColor.dart';
import '../../utills/FontSize.dart';

Widget ResizableTextView(String st_text,double fontSize,Color fontColor,FontWeight fontWeight)
{
 return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        textAlign:TextAlign.center,
          st_text,
        style: TextStyle(
            fontFamily: 'Calibri',
            color:fontColor,
            fontSize: fontSize,
            fontWeight:fontWeight
        ),
      ));
}

Widget ToolbarTextView(String st_text,double fontSize,Color fontColor,FontWeight fontWeight)
{
  return Text(
    textAlign:TextAlign.center,
    st_text,
    style: TextStyle(
        fontFamily: 'Calibri',
        color:fontColor,
        fontSize: fontSize,
        fontWeight:fontWeight
    ),
  );
}
