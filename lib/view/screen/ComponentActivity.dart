import 'package:flutter/material.dart';
import 'package:pmajay/view/widget/CustomWidget.dart';

import '../../utills/AppString.dart';
import '../../utills/CustomColor.dart';
import '../../utills/FontSize.dart';
import '../widget/ResizableTextView.dart';
import '../widget/RibbonBanner.dart';
import 'LoginActivity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ComponentActivity(),
    );
  }
}

class ComponentActivity extends StatelessWidget {
  const ComponentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    Widget main_card = Padding(
      padding: EdgeInsets.only(top: 10,left:10,right: 10,bottom: 30),
      // Adjust the horizontal padding as needed

      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 40),
            Image.asset(
              "assets/images/ic_logo.webp",
              height: 130,
              width: 130,
              // fit: BoxFit.fitCenter,
            ),

            Container(
              child:  ResizableTextView(AppString.app_name,FontSize.sp_20,CustomColor.black_dark,FontWeight.bold),

            ),
            Stack(
              alignment: Alignment.center, // Aligns children at the center

              children: [
                // Background image
                Image.asset(
                  "assets/images/ic_ribbon_banner.webp",
                  height: 35,
                  width: 300,
                  fit: BoxFit.fill,
                ),
                // Text widget on top of the background image

                Center(
                  child: ResizableTextView(AppString.title_our_components,FontSize.sp_20,CustomColor.white,FontWeight.bold),

                ),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginActivity(
                            userType: 'AdarshGram',
                            LoginTitle: 'Adarsh Gram',
                          )),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  constraints: BoxConstraints(),
                  child: Column(
                    children: [

                      Container(
                        child:  ResizableTextView(AppString.title_adarsh_gram,FontSize.sp_20,CustomColor.black_dark,FontWeight.bold),

                      ),


                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child:  ResizableTextView(AppString.title_adarsh_gram_sub,FontSize.sp_15,CustomColor.black_dark,FontWeight.bold),

                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          height: 25,
                          margin: EdgeInsets.only(top: 20, right: 20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                CustomColor.drawer_bg,
                                // Replace with your desired colors
                                CustomColor.drawer_bg,
                                // Replace with your desired colors
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Center(
                            child: ResizableTextView(AppString.title_login,FontSize.sp_15,CustomColor.black_dark,FontWeight.bold),

                          ),
                        ),
                      ),
                      SizedBox(height: 10, width: 10)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginActivity(
                            userType: 'Grants-in-aid',
                            LoginTitle: 'Grants-in-aid',
                          )),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  constraints: BoxConstraints(),
                  child: Column(
                    children: [

                      Container(
                        child:  ResizableTextView(AppString.title_Grants_in_aid,FontSize.sp_20,CustomColor.black_dark,FontWeight.bold),

                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child:  ResizableTextView(AppString.title_Grants_in_aid_sub,FontSize.sp_15,CustomColor.black_dark,FontWeight.bold),

                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          height: 25,
                          margin: EdgeInsets.only(top: 20, right: 20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                CustomColor.drawer_bg,
                                // Replace with your desired colors
                                CustomColor.drawer_bg,
                                // Replace with your desired colors
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(


                            child: ResizableTextView(AppString.title_login,FontSize.sp_15,CustomColor.black_dark,FontWeight.bold),

                          ),
                        ),
                      ),
                      SizedBox(height: 10, width: 10)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginActivity(
                            userType: 'Hostels',
                            LoginTitle: 'Hostels',
                          )),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  constraints: BoxConstraints(),
                  child: Column(
                    children: [

                      Container(
                        child:  ResizableTextView(AppString.title_hostel,FontSize.sp_20,CustomColor.black_dark,FontWeight.bold),

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child:  ResizableTextView(AppString.title_hostel_sub,FontSize.sp_15,CustomColor.black_dark,FontWeight.bold),

                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          height: 25,
                          margin: EdgeInsets.only(top: 20, right: 20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                CustomColor.drawer_bg,
                                // Replace with your desired colors
                                CustomColor.drawer_bg,
                                // Replace with your desired colors
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child:ResizableTextView(AppString.title_login,FontSize.sp_15,CustomColor.black_dark,FontWeight.bold),

                          ),
                        ),
                      ),
                      SizedBox(height: 10, width: 10)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints.expand(),
          decoration: GradientBG(),
          child: SingleChildScrollView(
              reverse: false,
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  main_card,
                ],
              ))),
    );
  }
}
