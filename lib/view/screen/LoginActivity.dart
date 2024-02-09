import 'dart:io' show Platform;
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pmajay/view/screen/DashBoard.dart';

import 'package:provider/provider.dart';

import '../../network/remote/Status.dart';
import '../../network/viewmodel/MainListVM.dart';
import '../../utills/AppString.dart';
import '../../utills/CustomColor.dart';
import '../../utills/CustomWidget.dart';
import '../../utills/FontSize.dart';
import '../../utills/SharedPreferencesHelper.dart';
import '../../utills/utils.dart';
import '../widget/TermsCondition.dart';
import '../widget/LoaderWidget.dart';
import 'ComponentActivity.dart';

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
      home: LoginActivity(
        userType: '',
        LoginTitle: '',
      ),
    );
  }
}

class LoginActivity extends StatefulWidget {
  final String userType;
  final String LoginTitle;

  LoginActivity({super.key, required this.userType, required this.LoginTitle});

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity>
    with SingleTickerProviderStateMixin {
  final GlobalKey flushBarKey = GlobalKey();
  late final viewModelListner;
  late AnimationController _controller;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final TextEditingController _userNameTextCont = TextEditingController();
  final TextEditingController _passwordTextCont = TextEditingController();
  final TextEditingController _usercaptchaCont = TextEditingController();

  bool _isNameEmpty = true;
  bool _isPassEmpty = true;
  bool isLoading = false;
  bool _isPasswordVisible = false;
  String deviceid = '';
  String devicetype = '';
  String deviceToken = '';
  String base_url = '';
  final textFieldFocusNode = FocusNode();
  final captuatextFieldFocusNode = FocusNode();
  bool _obscured = true;
  String randomString = "";
  bool isVerified = false;
  TextEditingController captcha_controller = TextEditingController();

// Logic for creating Captcha
  void buildCaptcha() {
    // Letter from which we want to generate the captach
    // We have taken A to Z all small nand
    // caps letters along with numbers
    // You can change this as per your convience
    const letters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6;
    // Length of Captcha to be generated
    final random = Random();
    // Select random letters from above list
    randomString = String.fromCharCodes(List.generate(
        length, (index) => letters.codeUnitAt(random.nextInt(letters.length))));
    setState(() {});
    print("the random string is $randomString");
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    viewModelListner = Provider.of<MainListVM>(context, listen: false);
    viewModelListner.addListener(userLoginListner);
    // Listen to changes in the text field

    _userNameTextCont.addListener(() {
      setState(() {
        _isNameEmpty = _userNameTextCont.text.isEmpty;
      });
    });

    _passwordTextCont.addListener(() {
      setState(() {
        _isPassEmpty = _passwordTextCont.text.isEmpty;
        _isPasswordVisible = !_isPasswordVisible;
      });
    });
    getsharePref();
    getToken();
    buildCaptcha();
    // getDeviceId();
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  Future<void> getsharePref() async {
    // String? _baseUrl = await SharedPreferencesHelper.getBaseURL();
    setState(() {
      // base_url = _baseUrl ?? "";
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _userNameTextCont.dispose();
    _passwordTextCont.dispose();
    _usercaptchaCont.dispose();

    viewModelListner.removeListener(userLoginListner);
    _controller.dispose();
    super.dispose();
  }

  void _rotateIcon() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  void userLoginListner() {
    if (viewModelListner.loginMain.status == Status.LOADING) {
      setState(() {
        isLoading = true;
      }); // Update the UI if necessary
    }

    if (viewModelListner.loginMain.status == Status.ERROR) {
      Utils.flushBarErrorMessage(AppString.NetworkError, context, flushBarKey);
      setState(() {
        isLoading = false;
      }); // Update the UI if necessary
    }
    if (viewModelListner.loginMain.status == Status.COMPLETED) {
      // setState(() {
      //   isLoading = false;
      // });

      if (viewModelListner.loginMain.data.response_code == 200 &&
          viewModelListner.loginMain.data.message == "success" &&
          viewModelListner.loginMain.data.response.apistatus == "success") {
        Future.delayed(const Duration(seconds: 2)).then((value) {
          setState(() {
            isLoading = false;
          });
          var authkey = viewModelListner.loginMain.data.response.authkey;
          var UserType = viewModelListner.loginMain.data.response.r_type;
          var Name = viewModelListner.loginMain.data.response.r_username;

          // SharedPreferencesHelper.saveAuthKey(authkey!);
          // SharedPreferencesHelper.saveUserType(UserType!);
          // SharedPreferencesHelper.savePreferance('Name', Name!);
          if (mounted) {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => MainActivity()),
            // );
          }
        });

        // User u = User.fromJson(await SessionManager().get("user"));
      } else {
        setState(() {
          isLoading = false;
        });
        // CustomToast.showToastMessage(AppString.please_check_login);
      }
    }
  }

  Future<void> getToken() async {
    String? _deviceToken = await _firebaseMessaging.getToken();
    setState(() {
      deviceToken = _deviceToken ?? "";
    });
  }

  // Future<void> getDeviceId() async {
  //   String _deviceid = "";
  //   String _devicetype = "";
  //   final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  //   try {
  //     if (Platform.isAndroid)
  //     {
  //       final AndroidDeviceInfo androidInfo =
  //           await deviceInfoPlugin.androidInfo;
  //       _deviceid = androidInfo.androidId;
  //       _devicetype = 'Android';
  //     } else if (Platform.isIOS) {
  //       final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
  //       _deviceid = iosInfo.identifierForVendor;
  //       _devicetype = 'Ios';
  //     }
  //   } catch (e) {
  //     _deviceid = 'Unknown';
  //   }
  //   setState(() {
  //     deviceid = _deviceid;
  //     devicetype = _devicetype;
  //   });
  // }
  Future<bool> _onBackPressed() async {
    // Navigator.of(context).pop(false);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ComponentActivity()));

    return true; // Example: Always allow back navigation
  }

  @override
  Widget build(BuildContext context) {
    final viewModelMain = Provider.of<MainListVM>(context);
    Widget circleProcessbar = Container(
        margin: const EdgeInsets.only(
          top: 250,
        ),
        child: Visibility(visible: isLoading, child: LoaderWidget()));

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
      ],
    );
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(

          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              constraints: BoxConstraints.expand(),
              decoration: GradientBG(),

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30,width: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColor.component_card_bg.withOpacity(0.3),
                            // Transparent red background
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          width: 30,
                          height: 30,
                          child: GestureDetector(
                            onTap: _onBackPressed,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 25,// Red arrow color
                            ),
                          ),
                        ),
                      ),
                    ),

                    Image.asset(
                      "assets/images/ic_logo.webp",
                      height: 130,
                      width: 130,
                      // fit: BoxFit.fitCenter,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      // Aligns children at the center

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
                          child: Text(
                            textAlign: TextAlign.center,
                            "${widget.LoginTitle}",
                            style: TextStyle(
                                fontFamily: 'Calibri',
                                color: CustomColor.white,
                                fontSize: FontSize.sp_20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.only(left: 30,right: 30),
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
                          SizedBox(height: 40),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: CustomColor.gray_dark, width: 1.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(45.0)),
                            ),
                            constraints: BoxConstraints(),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  // Image.asset(
                                  //   "assets/images/user.webp", height: 25.0,
                                  //   width: 25.0,
                                  //   // fit: BoxFit.fitCenter,
                                  // ),
                                  Icon(Icons.person,
                                      color: Colors.blue, size: 25, fill: 1),

                                  SizedBox(height: 5, width: 5),
                                  VerticalDivider(
                                    color: Colors.black,
                                    //color of divider
                                    width: 10,
                                    //width space of divider
                                    thickness: 1,
                                    //thickness of divier line
                                    indent: 5,
                                    //Spacing at the top of divider.
                                    endIndent:
                                    5, //Spacing at the bottom of divider.
                                  ),
                                  Expanded(
                                    child: AutofillGroup(
                                        child: TextField(
                                          controller: _userNameTextCont,
                                          decoration: InputDecoration(
                                            hintText: AppString.user_name,
                                            border: InputBorder.none,
                                            labelStyle: TextStyle(
                                              color: CustomColor.drawer_header_bg,
                                              // Change the label text color
                                              fontSize: FontSize.sp_13,
                                              // Change the label text font size
                                              fontWeight: FontWeight
                                                  .normal, // Change the label text font weight
                                            ),
                                          ),
                                          autofillHints: [AutofillHints.username],
                                          keyboardType:
                                          TextInputType.emailAddress,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                              margin: EdgeInsets.only(left: 30, right: 30),
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: CustomColor.gray_dark, width: 1.0),
                                borderRadius:
                                BorderRadius.all(Radius.circular(45.0)),
                              ),
                              constraints: BoxConstraints(),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    Transform.rotate(
                                      angle: 320 * (3.1415926535 / 180),
                                      // Convert degrees to radians
                                      child: Icon(
                                        Icons.key,
                                        color: Colors.blue,
                                        size: 25,
                                      ),
                                    ),
                                    SizedBox(height: 5, width: 5),
                                    VerticalDivider(
                                      color: Colors.black,
                                      //color of divider
                                      width: 10,
                                      //width space of divider
                                      thickness: 1,
                                      //thickness of divier line
                                      indent: 5,
                                      //Spacing at the top of divider.
                                      endIndent:
                                      5, //Spacing at the bottom of divider.
                                    ),
                                    Expanded(
                                      child: AutofillGroup(
                                          child: TextField(
                                            controller: _passwordTextCont,
                                            keyboardType:
                                            TextInputType.visiblePassword,
                                            obscureText: _obscured,
                                            focusNode: textFieldFocusNode,
                                            autofillHints: [
                                              AutofillHints.password
                                            ],
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                              //Hides label on focus or if filled
                                              labelText: AppString.enter_password,
                                              filled: true,
                                              // Needed for adding a fill color
                                              fillColor: CustomColor.white,
                                              isDense: true,
                                              // Reduces height a bit
                                              border: OutlineInputBorder(
                                                borderSide:
                                                BorderSide.none, // No border
                                              ),

                                              suffixIcon: Padding(
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    0, 0, 0, 0),
                                                child: GestureDetector(
                                                  onTap: _toggleObscured,
                                                  child: Icon(
                                                    color:
                                                    CustomColor.PrimaryBlack,
                                                    _obscured
                                                        ? Icons
                                                        .visibility_off_rounded
                                                        : Icons
                                                        .visibility_rounded,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: CustomColor.gray_dark, width: 1.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(45.0)),
                            ),
                            constraints: BoxConstraints(),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  // Image.asset(
                                  //   "assets/images/user.webp", height: 25.0,
                                  //   width: 25.0,
                                  //   // fit: BoxFit.fitCenter,
                                  // ),
                                  Icon(
                                    Icons.pattern,
                                    color: Colors.blue,
                                    size: 25,
                                  ),
                                  SizedBox(height: 5, width: 5),
                                  VerticalDivider(
                                    color: Colors.black,
                                    //color of divider
                                    width: 10,
                                    //width space of divider
                                    thickness: 1,
                                    //thickness of divier line
                                    indent: 5,
                                    //Spacing at the top of divider.
                                    endIndent:
                                    5, //Spacing at the bottom of divider.
                                  ),
                                  Expanded(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 3,
                                            right: 10,
                                            top: 2,
                                            bottom: 2),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1,
                                              0.4,
                                              0.6,
                                            ],
                                            colors: [
                                              CustomColor.patter_bg,
                                              CustomColor.patter_bg,
                                              CustomColor.patter_bg,
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            randomString,
                                            style: TextStyle(
                                                fontSize: FontSize.sp_18,
                                                letterSpacing: 10.0,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()
                                                  ..shader = LinearGradient(
                                                    colors: <Color>[
                                                      Colors.yellow[900]!,
                                                      Colors.red[900]!,
                                                      Colors.green[900]!,
                                                      Colors.blue[900]!,
                                                      Colors.amber[900]!,
                                                      //add more color here.
                                                    ],
                                                  ).createShader(
                                                      Rect.fromLTWH(0.0, 0.0,
                                                          200.0, 100.0))),
                                          ),
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _rotateIcon();
                                      buildCaptcha();
                                    },
                                    child: RotationTransition(
                                      turns: Tween(begin: 0.0, end: 1.0)
                                          .animate(_controller),
                                      child: Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.identity()
                                          ..scale(1.0, -1.0,
                                              1.0) // Vertically mirror
                                          ..rotateZ(40),
                                        // Rotate by 40 degrees
                                        child: Icon(
                                          Icons.sync_outlined,
                                          color: Colors.blue,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: CustomColor.gray_dark, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(45.0)),
                            ),
                            constraints: BoxConstraints(),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  // Image.asset(
                                  //   "assets/images/user.webp", height: 25.0,
                                  //   width: 25.0,
                                  //   // fit: BoxFit.fitCenter,
                                  // ),
                                  Icon(Icons.edit_square,
                                      color: Colors.blue, size: 25, fill: 1),

                                  SizedBox(height: 5, width: 5),
                                  VerticalDivider(
                                    color: Colors.black,
                                    //color of divider
                                    width: 10,
                                    //width space of divider
                                    thickness: 1,
                                    //thickness of divier line
                                    indent: 5,
                                    //Spacing at the top of divider.
                                    endIndent:
                                    5, //Spacing at the bottom of divider.
                                  ),
                                  Expanded(
                                    child: AutofillGroup(
                                        child: TextField(
                                          controller: _userNameTextCont,
                                          decoration: InputDecoration(
                                            hintText: AppString.enter_captcha,
                                            border: InputBorder.none,
                                            labelStyle: TextStyle(
                                              color: CustomColor.drawer_header_bg,
                                              // Change the label text color
                                              fontSize: FontSize.sp_13,
                                              // Change the label text font size
                                              fontWeight: FontWeight
                                                  .normal, // Change the label text font weight
                                            ),
                                          ),
                                          autofillHints: [AutofillHints.username],
                                          keyboardType:
                                          TextInputType.emailAddress,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.only(top: 5, right: 20),
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontFamily: 'Calibri',
                                    color: CustomColor.splash_color_buttom,
                                    fontSize: FontSize.sp_13,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashBoard()),
                              );
                              return;
                              String user_name =
                              _userNameTextCont.text.trim();
                              String password = _passwordTextCont.text.trim();

                              ///api call

                              if (user_name == null || user_name.isEmpty) {
                                Utils.flushBarErrorMessage(
                                    AppString.enter_user_name,
                                    context,
                                    flushBarKey);

                                return;
                              }
                              if (password == null || password.isEmpty) {
                                Utils.flushBarErrorMessage(
                                    AppString.enter_user_pass,
                                    context,
                                    flushBarKey);

                                return;
                              }

                              if (captcha_controller.text == null ||
                                  captcha_controller.text.isEmpty) {
                                Utils.flushBarErrorMessage(
                                    AppString.enter_captcha,
                                    context,
                                    flushBarKey);

                                return;
                              }
                              isVerified =
                                  captcha_controller.text == randomString;
                              setState(() {});
                              if (!isVerified) {
                                Utils.flushBarErrorMessage(
                                    AppString.enter_captcha,
                                    context,
                                    flushBarKey);

                                return;
                              }

                              TextInput.finishAutofillContext();

                              // viewModelMain.userLoginApi(
                              //     base_url,
                              //     user_name,
                              //     password,
                              //     deviceid,
                              //     devicetype,
                              //     widget.userType,
                              //     deviceToken);
                            },

                            child: Align(
                              alignment: Alignment.center,
                              child: Container(

                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(top: 5.0,bottom: 5),
                                margin: EdgeInsets.only(left: 35, right: 35, bottom: 30,top: 10),
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
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                child: Center(
                                  child: Text(
                                    AppString.bt_login,
                                    style: TextStyle(
                                        fontFamily: 'Calibri',
                                        color: CustomColor.black_dark,
                                        fontWeight:FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
