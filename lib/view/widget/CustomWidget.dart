import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utills/CustomColor.dart';
import '../../utills/Dimens.dart';
import '../../utills/FontSize.dart';

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

Widget buttonYellowSize(String btText, Alignment alignment, Color colorlight,
    Color colordark, double maxWidth, double maxHeight, double fontsize) {
  return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
            minWidth: 0, // Set a minimum width of 0
            maxWidth: maxWidth, // Set a maximum width if needed
            minHeight: 0,
            maxHeight: maxHeight),
        height: Dimens.controller_height_size,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorlight,
// Replace with your desired colors
              colordark,
// Replace with your desired colors
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            btText,
            style: TextStyle(
              fontFamily: 'Nunito Regular',
              color: Colors.white,
              fontSize: fontsize,
            ),
          ),
        ),
      ));
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

Widget dividerWhiteLine() {
  return Container(
    margin: const EdgeInsets.only(left: 1, right: 3),
    child: const Divider(
      color: Colors.white,
      thickness: 1.5,
    ),
  );
}

Decoration GradientBGHoriz() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        CustomColor.dashboard_card_bg,
        CustomColor.dashboard_card_bg_light,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(5, 5),
        blurRadius: 10,
      )
    ],
  );
}

Decoration GradientBG() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [CustomColor.splash_color_top, CustomColor.splash_color_buttom],
    ),
  );
}
