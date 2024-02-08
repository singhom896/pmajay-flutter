import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomColor.dart';
import 'FontSize.dart';

Widget textViewWithFlex(
    String textValue, Alignment alignment, int flex, TextOverflow overflow) {
  return Flexible(
    flex: flex,
    child: Align(
      alignment: alignment,
      child: Text(
        textValue,
        style: TextStyle(
          fontFamily: 'Nunito Regular',
          color: Colors.black,
          fontSize: FontSize.sp_15,
        ),
        softWrap: true,
        maxLines: 1,
        overflow: overflow,
      ),
    ),
  );
}
Widget dividerLine() {
  return Container(
    margin: const EdgeInsets.only(left: 3, right: 3),
    child: const Divider(
      color: Colors.grey,
      thickness: 0.5,
    ),
  );
}


Decoration GradientBG()
{
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        CustomColor.splash_color_top,
        CustomColor.splash_color_buttom
      ],
    ),
  );
}



