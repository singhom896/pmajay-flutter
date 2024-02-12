import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pmajay/utills/AppString.dart';
import 'package:pmajay/utills/CustomColor.dart';
import '../widget/CustomWidget.dart';
import '../../utills/FontSize.dart';
import '../../utills/SharedPreferencesHelper.dart';
import '../widget/ResizableTextView.dart';
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
                    InteractiveViewer(
                      // boundary of image
                      boundaryMargin: const EdgeInsets.all(20),
                      minScale: 0.1,
                      maxScale: 1.6,
                      child: Container(
                        height: 100,
                        width: 100,
                        // Using image from local storage
                        child: Image.asset(
                          "assets/images/ic_ashokstambh.webp",
                        ),
                      ),
                    ),

                    // Image.asset(
                    //   'assets/images/ic_ashokstambh.webp',
                    //   height: 100,
                    //   width: 100,
                    // ),
                    SizedBox(height: 10,),

                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          textAlign:TextAlign.center,
                          'Ministry of Social Justice and \n Empowerment \n Government of India.',
                          style: TextStyle(
                              fontFamily: 'Calibri',
                              color:CustomColor.black_dark,
                              fontSize: FontSize.sp_18,
                              fontWeight:FontWeight.bold
                          ),
                        )),
                    ResizableTextView(AppString.splash_st_ministry,FontSize.sp_18,CustomColor.black_dark,FontWeight.bold),

                    // InteractiveViewer(
                    //   // boundary of image
                    //   boundaryMargin: const EdgeInsets.all(20),
                    //   minScale: 0.1,
                    //   maxScale: 1.6,
                    //   child: Container(
                    //     height: 100,
                    //     width: 100,
                    //     // Using image from local storage
                    //     child: Image.asset(
                    //       "assets/images/ic_logo.webp",
                    //     ),
                    //   ),
                    // ),
                    // Image.asset(
                    //   'assets/images/ic_logo.webp',
                    //   height: 100,
                    //   width: 100,
                    // ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child:Image.asset(
                        'assets/images/loader_logo.gif',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(height: 10,),
                    ResizableTextView(AppString.splash_st_app_subtitle,FontSize.sp_18,CustomColor.white,FontWeight.bold),




                  ],),
              ),
            ),
          ),


          Positioned(
            bottom: 10,
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
