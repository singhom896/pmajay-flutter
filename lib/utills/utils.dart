

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import 'CustomColor.dart';


class Utils {

  static double averageRating(List<int> rating)
  {
    var avgRating = 0;
    for(int i = 0;i<rating.length; i++){
      avgRating= avgRating +rating[i];
    }
    return double.parse((avgRating/rating.length).toStringAsFixed(1));
  }
  //On pressing done from keyboard it should move to the next text field
  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentNode,
    FocusNode nextNode,
  ) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  //For showing toast
  // static toastMessage(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //   );
  // }

  static void flushBarErrorMessage(String message, BuildContext context,Key flushBarKey)
  {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        key: flushBarKey,
        message: message,
        messageColor: CustomColor.white,
        backgroundColor: CustomColor.flushBarErrorMessage,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.all(15),
        duration: const Duration(seconds: 3),
        reverseAnimationCurve: Curves.easeInOut,
        icon: const Icon(Icons.error,color:  CustomColor.white,),
      )..show(context),
    );
  }
  static void flushBarTopErrorMessage(String message, BuildContext context,Key flushBarKey)
  {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        key: flushBarKey,
        flushbarPosition: FlushbarPosition.TOP,
        message: message,

        messageColor: CustomColor.white,
        backgroundColor: CustomColor.flushBarErrorMessage,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.all(15),
        duration: const Duration(seconds: 3),
        reverseAnimationCurve: Curves.easeInOut,
        icon: const Icon(Icons.error,color:  CustomColor.white,),
      )..show(context),
    );
  }
  static void flushBarNetworkErrorMessage(String message, BuildContext context)
  {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        messageColor: CustomColor.white,
        backgroundColor: CustomColor.flushBarErrorMessage,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.all(15),
        duration: const Duration(seconds: 3),
        reverseAnimationCurve: Curves.easeInOut,
        icon: const Icon(Icons.error,color:  CustomColor.white,),
      )..show(context),
    );
  }

  static void flushBarSucessMessage(String message, BuildContext context,Key flushBarKey,onFlushbarDismissed,Color backgroundColor)
  {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        key: flushBarKey,
        message: message,
        messageColor: CustomColor.white,
        backgroundColor: backgroundColor,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.all(15),
        duration: const Duration(seconds: 2),
        reverseAnimationCurve: Curves.easeInOut,
        icon: const Icon(Icons.error,color:  CustomColor.white,),
        onStatusChanged: (status) {
          if (status == FlushbarStatus.DISMISSED)
          {

            onFlushbarDismissed('DISMISSED');
          }
        },
      )..show(context),
    );
  }



  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
