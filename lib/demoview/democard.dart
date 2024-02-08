import 'package:flutter/material.dart';

import '../utills/CustomColor.dart';
import '../utills/FontSize.dart';
import '../view/screen/LoginActivity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card Example'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
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
            ),
          ),
        ),
      ),
    );
  }
}
