import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pmajay/utills/CustomColor.dart';
import '../../utills/CustomWidget.dart';
import '../../utills/FontSize.dart';
import '../../utills/SharedPreferencesHelper.dart';
import 'DashBoard.dart';
import 'ComponentActivity.dart';


class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  // @override

  @override
  void initState() {
     initview();
    super.initState();

  }

  Future<void> initview() async {
    Future<void>.delayed(Duration(seconds: 3), () async {

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => DashBoard()));

      String? _authkey = await SharedPreferencesHelper.getAuthKey();

      if (_authkey != null && _authkey != "")
      {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashBoard()));
      } else
      {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => LoginActivity(userType: '', LoginTitle: '',)));
        //
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ComponentActivity()));



      }
    });
  }

  Widget main_stack()
  {
    return Stack(
        children: <Widget>[


          Positioned(
            top: 100,
            bottom: null,
            left: 1,
            right: 1,
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(

                      'assets/images/ic_ashokstambh.webp',
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(height: 10,),
                    Text(
                        textAlign:TextAlign.center,
                      'Ministry of Social Justice and \n Empowerment \n Government of India.',
                      style: TextStyle(
                          fontFamily: 'Calibri',
                          color:CustomColor.black_dark,
                          fontSize: FontSize.sp_18,
                          fontWeight:FontWeight.bold
                      ),
                    ),
                    Image.asset(
                      'assets/images/ic_logo.webp',
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      textAlign:TextAlign.center,
                      'Pradhan Mantri Anusuchit\nJaati Abhyuday Yojna\n(PM-AJAY)',
                      style: TextStyle(

                          fontFamily: 'Calibri',
                          color:CustomColor.white,
                          fontSize: FontSize.sp_18,
                          fontWeight:FontWeight.bold
                      ),
                    ),


                  ],),
              ),
            ),
          ),


          Positioned(

            bottom: 5,
            left: 5,
            child:  Image.asset(
              'assets/images/nic_logo.webp',
              height: 30,
              width: 100,
              color: CustomColor.white,
            ),
          ),







        ]
    );
  }


  @override
  Widget build(BuildContext context) {
    // Hide the status bar and the navigation bar

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
      ],
    );
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            extendBodyBehindAppBar: true, // Allows the body to be behind the AppBar
            body:  Container(
                height: double.infinity,
                width: double.infinity,

                decoration: GradientBG(),
                child:main_stack() )));
  }
}
