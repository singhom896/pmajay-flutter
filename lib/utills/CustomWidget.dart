

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FontSize.dart';

class custom_widget extends StatelessWidget {
  const custom_widget({super.key});

  static Widget textViewWithFlex(String textValue,Alignment alignment,int flex,TextOverflow overflow) {
    return Flexible(
      flex: flex,
      child: Align(
        alignment: alignment,
        child:Text(textValue,
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}

