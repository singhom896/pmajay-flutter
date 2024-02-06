import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pmajay/utills/CustomColor.dart';
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

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashBoard()));

      // String? _authkey = await SharedPreferencesHelper.getAuthKey();
      //
      // if (_authkey != null && _authkey != "")
      // {
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => DashBoard()));
      // } else
      // {
      //   // Navigator.pushReplacement(
      //   //     context, MaterialPageRoute(builder: (context) => LoginActivity(userType: '', LoginTitle: '',)));
      //   //
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => UserTypeActivity()));
      //
      //
      //
      // }
    });
  }

  Widget main_stack()
  {
    return Stack(
        children: <Widget>[


          Positioned(
            top: 120,
            bottom: null,
            left: 1,
            right: 1,
            child: Center(
              child: Container(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      color:CustomColor.white,
                      'assets/images/ic_ashokstambh.webp',
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(height: 10,),
                    Text(
                        textAlign:TextAlign.center,
                      'Ministry of Social Justice and Empowerment \n Government of India.'.toUpperCase(),
                      style: TextStyle(
                          fontFamily: 'Nunito Regular',
                          color:CustomColor.white,
                          fontSize: FontSize.sp_14,
                          fontWeight:FontWeight.bold
                      ),
                    ),


                  ],),
              ),
            ),
          ),

          Positioned(
            top: null,
            bottom: null,
            left: null,
            right: null,
            child: Center(
              child: Container(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/ic_logo.webp',
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Pradhan Mantri Adarsh Gram \n                  Yojana',
                      style: TextStyle(
                          fontFamily: 'Nunito Regular',
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

            bottom: 50,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  textAlign:TextAlign.right,
                  'Designed, & Developed by',
                  style: TextStyle(
                    fontFamily: 'Nunito Regular',
                    color: CustomColor.white,
                    fontSize: FontSize.sp_10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/nic_logo.webp',
                  height: 30,
                  width: 100,
                ),
                Text(
                  textAlign:TextAlign.right,
                  'Department of Social Justice and Empowerment',
                  style: TextStyle(
                    fontFamily: 'Nunito Regular',
                    color: CustomColor.white,
                    fontSize: FontSize.sp_10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  textAlign:TextAlign.right,
                  'Government of India',
                  style: TextStyle(
                    fontFamily: 'Nunito Regular',
                    color: CustomColor.white,
                    fontSize: FontSize.sp_10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),







        ]
    );
  }


  @override
  Widget build(BuildContext context) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            extendBodyBehindAppBar: true, // Allows the body to be behind the AppBar
            body: Container(
                 height: double.infinity,
                width: double.infinity,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      CustomColor.theme_color1,
                      CustomColor.theme_color1
                    ],
                  ),
                ),
                child:main_stack() )));
  }
}
