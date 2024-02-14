import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../locator.dart';
import '../../network/viewmodel/MyProfileVM.dart';
import '../../utills/ButtomMenu.dart';
import '../../utills/FontSize.dart';
import '../widget/CustomWidget.dart';
import '../../utills/AppString.dart';
import '../../utills/CustomColor.dart';
import '../widget/ExpandableTextWidget.dart';
import '../widget/LoaderWidget.dart';
import '../widget/ResizableTextView.dart';
import '../widget/tab_item.dart';
import 'NodelOfficerDetails.dart';
import 'fragment/villageformat/VillageFormat_III_HouseholdLevelDataAdd.dart';
import 'fragment/villageformat/VillageFormat_II_InfrastructureAdd.dart';
import 'fragment/villageformat/VillageFormat_I_Add.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MyProfileVM()),
        ],
        child: MaterialApp(
          // theme: ThemeData(
          //   primaryColor: CustomColor.white,
          //   primaryColorDark: CustomColor.white,// Define the primary color
          //   iconTheme: IconThemeData(color: Colors.white),
          // ),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: CustomColor.white),
            useMaterial3: true,
            textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
              bodyMedium: GoogleFonts.roboto(textStyle: textTheme.bodyMedium),
            ),
          ),
          debugShowCheckedModeBanner: false,
          // initialRoute: Routes.initialRoute,
          // routes: Routes.routes,
          home: DashBoard(),
          //home: YourScreen(),
          // home: PortraitLandscapePlayerPage(),
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/DashBoard': (context) => DashBoard(),
          },
        ));
  }
}

// rk asram ka pass

/*
No. of villages selected = 10
No. of villages with infrastructure survey completed = 8
Total households= 5000
Completed Households Survey = 2500
Incomplete Households Survey = 15

*/


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

  final tabs = ['Home', 'Tutorial Videos', 'FAQ', 'Contact Us','Profile', 'Menu'];

  // final menu_buttom_sheet = [
  //   AppString.title_sheet_format_i,
  //   AppString.title_sheet_format_ii,
  //   AppString.title_sheet_format_ii_a,
  // ];

  final menu_buttom_sheet = [
    ButtomMenu(
        AppString.title_sheet_format_i,
        AppString.subtitle_sheet_format_i, VillageFormat_I_Add(),CustomColor.dashboard_card_bg),
    ButtomMenu(
        AppString.title_sheet_format_ii,
        AppString.subtitle_sheet_format_ii,
        VillageFormat_II_InfrastructureAdd(),CustomColor.dashboard_card_bg),
    ButtomMenu(
        AppString.title_sheet_format_ii_a,
        AppString.subtitle_sheet_format_ii_a,
        VillageFormat_III_HouseholdLevelDataAdd(),CustomColor.dashboard_card_bg),
  ];
/*
No. of villages selected = 10
No. of villages with infrastructure survey completed = 8
Total households= 5000
Completed Households Survey = 2500
Incomplete Households Survey = 15

*/

  final dashboard_done = [
    ButtomMenu(
        "10",
        "No. of villages selected",
        VillageFormat_I_Add(),
        CustomColor.card_1

    ),
    ButtomMenu(
        "8",
        "No. of villages with infrastructure survey completed",
        VillageFormat_II_InfrastructureAdd(),CustomColor.card_2),
    ButtomMenu(
        "5000",
        "Total households",
        VillageFormat_II_InfrastructureAdd(),CustomColor.card_3),
    ButtomMenu(
        "2500",
        "Completed Households Survey",
        VillageFormat_II_InfrastructureAdd(),CustomColor.card_4),
    ButtomMenu(
        "15",
        "Incomplete Households Survey",
        VillageFormat_II_InfrastructureAdd(),CustomColor.card_5),

  ];


  int selectedPosition = 0;

  _buildBottomTab() {
    return BottomAppBar(
      color: CustomColor.splash_color_buttom,
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
              launchUrl(Uri.parse(
                  'https://www.youtube.com/channel/UCvtZvyOHREh-7qO2q0ULNVw'));
            },
          ),
          TabItem(
            text: tabs[2],
            icon: Icons.account_circle,
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
              // Navigator.of(context).pop();
              Navigator.of(context).push(_createRoute(NodelOfficerDetails()));
            },
          ),
          TabItem(
            text: tabs[4],
            icon: Icons.manage_accounts,
            isSelected: selectedPosition == 4,
            onTap: () {

              setState(() {
                selectedPosition = 4;
              });
            },
          ),
          TabItem(
            text: tabs[5],
            icon: Icons.menu,
            isSelected: selectedPosition == 5,
            onTap: () {
              _openBottomSheet();
              setState(() {
                selectedPosition = 5;
              });
            },
          ),
        ],
      ),
    );
  }

  bool isLoading = false;

  Widget circleProcessbar() {
    return Container(
        margin: const EdgeInsets.only(
          top: 250,
        ),
        child: Visibility(visible: isLoading, child: LoaderWidget()));
  }

  Widget dashboardDeatil()
  {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
          3, // Set the number of columns in the grid
          crossAxisSpacing: 4.0, // Set the spacing between columns
          mainAxisSpacing: 4.0, // Set the spacing between rows
        ),
        itemCount: dashboard_done.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // setState(() {
              //   selectedPosition = index;
              // });
              // Navigator.pop(context);
              // Navigator.of(context).push(_createRoute(
              //     dashboard_done[index].navigateClass));
            },
            child:Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width,
              decoration: GradientBGHorizColor(dashboard_done[index].backgroundColor,dashboard_done[index].backgroundColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            SizedBox(

                              child: Icon(
                                Icons.home,
                                color:  Colors.grey,
                                size: 50,
                              ),
                            ),


                          ],
                        ),
                      ),

                      Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                textAlign: TextAlign.left,
                                dashboard_done[index].title,
                                style: TextStyle(
                                    fontFamily: 'Calibri',
                                    color: CustomColor.black_dark,
                                    fontSize: FontSize.sp_15,
                                    fontWeight: FontWeight.bold),
                              ),
                              dividerWhiteLine(),
                              Text(
                                textAlign: TextAlign.left,
                                dashboard_done[index].subTitle,
                                maxLines:3,
                                style: TextStyle(

                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Calibri',
                                    color: CustomColor.black_dark,
                                    fontSize: FontSize.sp_15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
            )
          );
        },
      ),
    );

  }

  Widget MainScanFold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.theme_color1,
        iconTheme: IconThemeData(color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ToolbarTextView(AppString.app_name, FontSize.sp_18,
              CustomColor.white, FontWeight.bold),
        ),
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
      // drawer: DrawerDesign(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // circleProcessbar(),
            dashboardDeatil()
          ],
        ),
      ),

      bottomNavigationBar: _buildBottomTab(),
    );
  }

  Widget WrapCard(int index) {
    return Wrap(spacing: 0.0, runSpacing: 0.0, children: [
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: CustomColor.white.withOpacity(0.3),
          // Transparent red background
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: ResizableTextView(menu_buttom_sheet[index].title,
                  FontSize.sp_18, CustomColor.white, FontWeight.bold),
            ),
            SizedBox(height: 5),
            ExpandableTextWidget(
              text: menu_buttom_sheet[index].subTitle,
              textStyle: TextStyle(
                  fontSize: 18.00,
                  color: CustomColor.white),
              maxLines: 4,
            ),
            // Text(
            //   textAlign: TextAlign.center,
            //   menu_buttom_sheet[index].subTitle,
            //   style: TextStyle(
            //       fontFamily: 'Calibri',
            //       color: CustomColor.white,
            //       fontSize: FontSize.sp_13,
            //       fontWeight: FontWeight.bold),
            // )
          ],
        ),
      )
    ]);
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      backgroundColor: CustomColor.buttom_sheet_bg,
      context: context,
      builder: (BuildContext context) {
        return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                ResizableTextView(AppString.title_village_format,
                    FontSize.sp_18, CustomColor.white, FontWeight.normal),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          3, // Set the number of columns in the grid
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
                          Navigator.of(context).push(_createRoute(
                              menu_buttom_sheet[index].navigateClass));
                        },
                        child: WrapCard(index),
                      );
                    },
                  ),
                )
              ],
            ));
      },
    );
  }

  Route _createRoute(StatefulWidget screenCall) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screenCall,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
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
