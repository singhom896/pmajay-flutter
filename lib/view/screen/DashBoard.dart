


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widget/Drawer.dart';
import '../../utills/AppString.dart';
import '../../utills/CustomColor.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home:const DashBoard(),
    );
  }
}

class DashBoard extends StatelessWidget {

  const DashBoard({super.key});
  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown,
        ]);
  }
  Widget MainScanFold()
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.theme_color1,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(AppString.app_name,style: TextStyle(color: Colors.white)),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                'assets/images/ic_logout.png', // Replace with your asset image path
                width: 24, // Set the width of the image
                height: 24,
                  color:CustomColor.red_dark// Set the height of the image
              ),
              // Notification icon
              onPressed: ()
              {

              },),
            Text(AppString.sign_out,style: TextStyle(color: Colors.white)),
            SizedBox(width: 10.0,)
          ],),

        drawer: DrawerDesign(),
        body: Center(child: Container(),),
        bottomNavigationBar: Visibility(
          visible: false,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Image.asset(
                'assets/images/learn_icon.png', width: 24,
                // Adjust the width and height as needed
                height: 24,), label: 'Learn',),
              BottomNavigationBarItem(icon: Image.asset(
                'assets/images/report_icon.png', width: 24,
                // Adjust the width and height as needed
                height: 24,), label: 'Report',),
              BottomNavigationBarItem(icon: Image.asset(
                'assets/images/doubts_icon.png', width: 24,
                // Adjust the width and height as needed
                height: 24,), label: 'Doubts',),
              BottomNavigationBarItem(icon: Image.asset(
                'assets/images/menu_icon.png', width: 24,
                // Adjust the width and height as needed
                height: 24,), label: 'Menu',),
            ],
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            // Customize the selected item color
            unselectedItemColor: Colors
                .grey, // Customize the unselected item color
          ),
        ));

  }
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColor.theme_color2, // Replace with your desired color
    ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: CustomColor.theme_color1
    ));
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: Routes.initialRoute,
      // routes: Routes.routes,
      home: MainScanFold(),
      //home: YourScreen(),
      // home: PortraitLandscapePlayerPage(),

    );
  }
}
