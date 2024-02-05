import 'package:flutter/material.dart';
import '../../utills/CustomColor.dart';

class LoaderWidget extends StatelessWidget {
  final String message;

  LoaderWidget({super.key, this.message = 'Loading...'});

  @override
  Widget build(BuildContext context)
  {

    return Container(
      color: Colors.black.withOpacity(0.0), // Semi-transparent black background
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: 100,
            //   width: 100,
            //   child:Lottie.asset(
            //       'assets/images/bus_loader.json'),
            // ),


            Text(
              message,
              style: const TextStyle(
                fontSize: 16.0,
                color: CustomColor.purple_dark, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
