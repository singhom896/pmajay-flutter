import 'package:flutter/material.dart';
import 'package:pmajay/utills/CustomWidget.dart';

import '../../utills/CustomColor.dart';
import '../../utills/FontSize.dart';
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
      home: const UserTypeActivity(),
    );
  }
}

class UserTypeActivity extends StatelessWidget {
  const UserTypeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    Widget main_card = Container(
        height: MediaQuery.of(context).size.width,
        child: SizedBox(
            height: MediaQuery.of(context).size.width,
            width: 400,
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: ListView(shrinkWrap: false, children: <Widget>[
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/ic_logo.webp",
                          height: 130,
                          width: 130,
                          // fit: BoxFit.fitCenter,
                        ),
                        Container(
                          child: Text(
                            'PM-AJAY',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                color: CustomColor.black_dark,
                                fontSize: FontSize.sp_20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(

                          width: 300,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: CustomColor.componet_banner_bg,
                          ),
                          child: Text(
                            textAlign:TextAlign.center,
                            'Our Components',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                color: CustomColor.white,
                                fontSize: FontSize.sp_20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 30, width: 10),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 5.0,
                                color: CustomColor.componet_banner_bg,
                              ),
                            ),

                             borderRadius: BorderRadius.only(topLeft:Radius.circular(15.0),topRight:Radius.circular(15.0)),
                          ),

                          child: Card(
                            color: CustomColor.white,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginActivity(
                                        userType: 'AdarshGram',
                                        LoginTitle: 'Adarsh Gram',
                                      )),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        'Adarsh Gram',
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: CustomColor.black_dark,
                                            fontSize: FontSize.sp_20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      child: Text(
                                        textAlign:TextAlign.center,
                                        'Development of SC dominated\n villages into “Adarsh Gram”',
                                        style: TextStyle(
                                            fontFamily: 'Nunito Regular',
                                            color: CustomColor.black_dark,
                                            fontSize: FontSize.sp_15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 100,
                                        height: 25,
                                        margin:
                                        EdgeInsets.only(top: 20, right: 20),
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
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              fontFamily: 'Nunito Regular',
                                              color:CustomColor.black_dark,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),


                                    SizedBox(height: 10, width: 10)
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(height: 30, width: 10),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 5.0,
                                color: CustomColor.componet_banner_bg,
                              ),
                            ),

                            borderRadius: BorderRadius.only(topLeft:Radius.circular(15.0),topRight:Radius.circular(15.0)),
                          ),

                          child: Card(
                            color: CustomColor.white,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginActivity(
                                        userType: 'Grants-in-aid',
                                        LoginTitle: 'Grants-in-aid',
                                      )),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        'Grants-in-aid',
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: CustomColor.black_dark,
                                            fontSize: FontSize.sp_20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      textAlign:TextAlign.center,
                                      'Grants-in-aid to State/Districts',
                                      style: TextStyle(
                                          fontFamily: 'Nunito Regular',
                                          color: CustomColor.black_dark,
                                          fontSize: FontSize.sp_15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 100,
                                        height: 25,
                                        margin:
                                        EdgeInsets.only(top: 20, right: 20),
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
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              fontFamily: 'Nunito Regular',
                                              color:CustomColor.black_dark,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),


                                    SizedBox(height: 10, width: 10)
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(height: 30, width: 10),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 5.0,
                                color: CustomColor.componet_banner_bg,
                              ),
                            ),

                            borderRadius: BorderRadius.only(topLeft:Radius.circular(15.0),topRight:Radius.circular(15.0)),
                          ),

                          child: Card(
                            color: CustomColor.white,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginActivity(
                                        userType: 'Grants-in-aid',
                                        LoginTitle: 'Grants-in-aid',
                                      )),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        'Hostels',
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: CustomColor.black_dark,
                                            fontSize: FontSize.sp_20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      textAlign:TextAlign.center,
                                      'Construction/Repair of Hostels',
                                      style: TextStyle(
                                          fontFamily: 'Nunito Regular',
                                          color: CustomColor.black_dark,
                                          fontSize: FontSize.sp_15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 100,
                                        height: 25,
                                        margin:
                                        EdgeInsets.only(top: 20, right: 20),
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
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              fontWeight:FontWeight.bold,
                                              fontFamily: 'Nunito Regular',
                                              color:CustomColor.black_dark,
                                              fontSize: 15,

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),


                                    SizedBox(height: 10, width: 10)
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 160.0, // Adjust height as needed
                          child: Card(
                            elevation: 2,
                            child: ClipPath(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border(top: BorderSide(color:  CustomColor.componet_banner_bg, width: 5))),
                                child: InkWell(
                                    onTap: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginActivity(
                                            userType: 'AdarshGram',
                                            LoginTitle: 'Adarsh Gram',
                                          )),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            'Adarsh Gram',
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                color: CustomColor.black_dark,
                                                fontSize: FontSize.sp_20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                          child: Text(
                                            textAlign:TextAlign.center,
                                            'Development of SC dominated\n villages into “Adarsh Gram”',
                                            style: TextStyle(
                                                fontFamily: 'Nunito Regular',
                                                color: CustomColor.black_dark,
                                                fontSize: FontSize.sp_15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 100,
                                            height: 25,
                                            margin:
                                            EdgeInsets.only(top: 20, right: 20),
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
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Login',
                                                style: TextStyle(
                                                  fontFamily: 'Nunito Regular',
                                                  color:CustomColor.black_dark,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),


                                        SizedBox(height: 10, width: 10)
                                      ],
                                    )),
                              ),
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                            ),
                          ),
                        )
                      ],
                    ))
                  ]),
                ))));

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints.expand(),
        decoration: GradientBG(),
        child: SingleChildScrollView(
            reverse: false,
            physics: ScrollPhysics(),
            child: Container(
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  main_card,
                ],
              )),
            )));
  }
}
