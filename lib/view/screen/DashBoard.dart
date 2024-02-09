import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utills/FontSize.dart';
import '../widget/Drawer.dart';
import '../../utills/AppString.dart';
import '../../utills/CustomColor.dart';
import '../widget/MyShape.dart';
import '../widget/tab_item.dart';

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
      home: const DashBoard(),
    );
  }
}

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  final tabs = ['Home', 'Tutorial Videos', 'FAQ', 'Contact Us'];
  final menu_buttom_sheet = [
    AppString.title_sheet_format_i,
    AppString.title_sheet_format_ii,
    AppString.title_sheet_format_ii_a,
  ];
  int selectedPosition = 0;

  _buildBottomTab() {
    return BottomAppBar(
      color: CustomColor.drawer_bg,
      // shape: CircularNotchedRectangle(),
      shape: AutomaticNotchedShape(RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TabItem(
            text: tabs[0],
            icon: Icons.home,
            isSelected: selectedPosition == 0,
            onTap: () {
              setState(() {
                selectedPosition = 0;
              });
            },
          ),
          TabItem(
            text: tabs[1],
            icon: Icons.video_collection,
            isSelected: selectedPosition == 1,
            onTap: () {
              setState(() {
                selectedPosition = 1;
              });
            },
          ),
          SizedBox(
            width: 48,
          ),
          TabItem(
            text: tabs[2],
            icon: IconData(0xf22f, fontFamily: 'MaterialIcons'),
            isSelected: selectedPosition == 2,
            onTap: () {
              setState(() {
                selectedPosition = 2;
              });
            },
          ),
          TabItem(
            text: tabs[3],
            icon: Icons.phone_forwarded,
            isSelected: selectedPosition == 3,
            onTap: () {
              setState(() {
                selectedPosition = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget MainScanFold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.theme_color1,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(AppString.app_name,
            style: TextStyle(
              color: Colors.white,
              fontSize: FontSize.sp_18,
              fontFamily: 'Calibri',
            )),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/ic_logout.png',
                // Replace with your asset image path
                width: 24, // Set the width of the image
                height: 24,
                color: CustomColor.red_dark // Set the height of the image
                ),
            // Notification icon
            onPressed: () {},
          ),
          Text(AppString.sign_out,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Calibri',
              )),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      drawer: DrawerDesign(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        onPressed: _openBottomSheet,
        child: Icon(
          Icons.add,
          color: CustomColor.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomTab(),
    );
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      backgroundColor: CustomColor.drawer_bg,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10),
          child:Column(children:
          [
            SizedBox(height: 30,),
            Text(
              AppString.title_village_format,
              style: TextStyle(
                  fontFamily: 'Calibri',
                  color: CustomColor.black_dark,
                  fontWeight:FontWeight.bold,
                  fontSize:FontSize.sp_18

              ),
            ),
            SizedBox(height: 30,),
            Expanded(
              child:GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Set the number of columns in the grid
                  crossAxisSpacing: 4.0, // Set the spacing between columns
                  mainAxisSpacing: 4.0, // Set the spacing between rows
                ),
                itemCount: menu_buttom_sheet.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPosition = index;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColor.white.withOpacity(0.3),
                        // Transparent red background
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(menu_buttom_sheet[index], style: TextStyle(
                            fontFamily: 'Calibri',
                            color: CustomColor.black_dark,
                            fontWeight:FontWeight.bold,
                            fontSize:FontSize.sp_18

                        ),),
                      ),
                    ),
                  );
                },
              ) ,
            )

          ],)

        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          CustomColor.theme_color2, // Replace with your desired color
    ));
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: CustomColor.theme_color1));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: Routes.initialRoute,
      // routes: Routes.routes,
      home: MainScanFold(context),
      //home: YourScreen(),
      // home: PortraitLandscapePlayerPage(),
    );
  }
}
