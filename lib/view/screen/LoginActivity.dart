import 'dart:io' show Platform;
import 'dart:math';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import '../../network/remote/Status.dart';
import '../../network/viewmodel/MainListVM.dart';
import '../../utills/AppString.dart';
import '../../utills/CustomColor.dart';
import '../../utills/FontSize.dart';
import '../../utills/SharedPreferencesHelper.dart';
import '../../utills/utils.dart';
import '../widget/CustomWidget.dart';
import '../widget/LoaderWidget.dart';
import 'ComponentActivity.dart';




class LoginActivity extends StatefulWidget {
  final String userType;
  final String LoginTitle;
  LoginActivity({super.key, required this.userType, required this.LoginTitle});

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final GlobalKey flushBarKey = GlobalKey();
  late final viewModelListner;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


  final TextEditingController _userNameTextCont = TextEditingController();
  final TextEditingController _passwordTextCont = TextEditingController();
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
    const letters ="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
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
    viewModelListner.removeListener(userLoginListner);

    super.dispose();
  }



  void userLoginListner()
  {
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
          viewModelListner.loginMain.data.response.apistatus == "success")
      {

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

  @override
  Widget build(BuildContext context) {
    final viewModelMain = Provider.of<MainListVM>(context);
    Widget circleProcessbar = Container(
        margin: const EdgeInsets.only(
          top: 250,
        ),
        child: Visibility(visible: isLoading, child: LoaderWidget()));

    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomColor.lightGray,
                  CustomColor.lightGray
                ], // Replace with your desired colors
              ),
            ),
            child:  SingleChildScrollView(
              child: Column(
                children: [
                  Visibility(
                    visible: false,
                    child: Container(
                      width: double.infinity,

                      margin: EdgeInsets.only(bottom: 0,top: 80),

                      child: Image.asset(
                        "assets/images/ic_logo.webp",
                        height: 100,
                        width: 100,
                        // fit: BoxFit.fitCenter,
                      ), // Replace with your image path
                    ),
                  ),
                  SizedBox(height: 100,width: 100,),
                  Stack(children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter, // <-- SEE HERE
                      child: Container(
                          margin: EdgeInsets.only(top: 200),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // changes the position of the shadow
                              ),
                            ],
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0)),

                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/background_bottom.png"),
                                fit: BoxFit.cover),
                          ),
                          child:  Column(children: [
                            SizedBox(height: 320, width: 100),
                            InkWell(
                              onTap: (){
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (context) => UserTypeActivity()));

                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 140,
                                  height: 30,
                                  margin: EdgeInsets.only(top: 20, right: 20),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        CustomColor.theme_color1,
                                        // Replace with your desired colors
                                        CustomColor.theme_color1,
                                        // Replace with your desired colors
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Change Login',
                                      style: TextStyle(
                                        fontFamily: 'Nunito Regular',
                                        color: Colors.white,
                                        fontSize: FontSize.sp_18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 30, width: 100),
                            CustomWidget(),
                          ])),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter, // <-- SEE HERE
                      child: Container(
                        child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.white,
                          // Replace with your desired color
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  child: Image.asset(
                                      'assets/images/ic_logo.webp'),
                                ),
                                Text(
                                  "${widget.LoginTitle} " "Login",
                                  style: TextStyle(
                                    fontFamily: 'Nunito Regular',
                                    color: Colors.black,
                                    fontSize: FontSize.sp_18,
                                  ),
                                ),
                                SizedBox(height: 20, width: 100),
                                Container(
                                  margin: EdgeInsets.only(left: 10,right: 10),
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: CustomColor.gray_dark, width: 1.0),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  constraints: BoxConstraints(),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 20,

                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/user.webp", height: 30.0,
                                          width: 30.0,
                                          // fit: BoxFit.fitCenter,
                                        ),
                                        SizedBox(height: 5, width: 22),
                                        Expanded(
                                          child:AutofillGroup(child: TextField(
                                            controller: _userNameTextCont,
                                            decoration: InputDecoration(

                                              hintText: AppString.user_name,
                                              border: InputBorder.none,
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                                // Change the label text color
                                                fontSize: FontSize.sp_13,
                                                // Change the label text font size
                                                fontWeight: FontWeight
                                                    .normal, // Change the label text font weight
                                              ),
                                            ),
                                            autofillHints: [AutofillHints.username],
                                            keyboardType: TextInputType.emailAddress,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: CustomColor.gray_dark, width: 1.0),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                    ),
                                    constraints: BoxConstraints(),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 20,

                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Image.asset(
                                                "assets/images/padlock.webp",
                                                height: 30.0,
                                                width: 30.0,
                                                // fit: BoxFit.fitCenter,
                                              )),
                                          SizedBox(height: 5, width: 10),
                                          Expanded(
                                            child: AutofillGroup(child:TextField(
                                              controller: _passwordTextCont,
                                              keyboardType:
                                              TextInputType.visiblePassword,
                                              obscureText: _obscured,
                                              focusNode: textFieldFocusNode,
                                              autofillHints: [AutofillHints.password],
                                              decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                                //Hides label on focus or if filled
                                                labelText: "Password",
                                                filled: true,
                                                // Needed for adding a fill color
                                                fillColor: CustomColor.white,
                                                isDense: true,
                                                // Reduces height a bit
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide
                                                      .none, // No border
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12), // Apply corner radius
                                                ),

                                                suffixIcon: Padding(
                                                  padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 4, 0),
                                                  child: GestureDetector(
                                                    onTap: _toggleObscured,
                                                    child: Icon(
                                                      color: CustomColor
                                                          .PrimaryBlack,
                                                      _obscured?Icons.visibility_off_rounded: Icons.visibility_rounded ,
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
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Shown Captcha value to user
                                    Container(
                                         width: 100,
                                        margin: EdgeInsets.only(left: 10,right: 10),
                                        padding: const EdgeInsets.all(12),

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

                                              Colors.red,
                                              Colors.indigo,
                                              Colors.teal,
                                            ],
                                          ),

                                          border: Border.all(
                                              color: CustomColor.gray_dark, width: 1.0),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8.0)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            randomString,
                                            style:  TextStyle(
                                                fontSize: FontSize.sp_13,
                                                letterSpacing: 1.0,
                                                color:CustomColor.white,
                                                fontStyle:FontStyle.italic,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    // Regenerate captcha value
                                    IconButton(
                                        onPressed: () {
                                          buildCaptcha();
                                        },
                                        icon: const Icon(Icons.refresh,color: Colors.black)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: CustomColor.gray_dark, width: 1.0),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                    ),
                                    constraints: BoxConstraints(),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 20,

                                      ),
                                      child: Row(
                                        children: [

                                          Expanded(
                                            child: AutofillGroup(
                                                child:TextField(
                                              controller: captcha_controller,
                                              keyboardType:
                                              TextInputType.text,
                                              obscureText: _obscured,
                                              focusNode: captuatextFieldFocusNode,

                                              decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                                //Hides label on focus or if filled
                                                labelText: "Captcha",
                                                filled: true,
                                                // Needed for adding a fill color
                                                fillColor: CustomColor.white,
                                                isDense: true,
                                                // Reduces height a bit
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide
                                                      .none, // No border
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12), // Apply corner radius
                                                ),


                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                    )),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10, right: 20),
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          fontFamily: 'Nunito Light',
                                          color: Colors.black,
                                          fontSize: FontSize.sp_13,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    )),
                                InkWell(
                                  onTap: () {
                                    String user_name =
                                    _userNameTextCont.text.trim();
                                    String password =
                                    _passwordTextCont.text.trim();

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

                                    if (captcha_controller.text == null || captcha_controller.text.isEmpty) {
                                      Utils.flushBarErrorMessage(
                                          AppString.enter_captcha,
                                          context,
                                          flushBarKey);

                                      return;
                                    }
                                    isVerified = captcha_controller.text == randomString;
                                    setState(() {});
                                    if (!isVerified)
                                      {
                                        Utils.flushBarErrorMessage(
                                            AppString.enter_captcha_valid,
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
                                      width: 140,
                                      height: 30,
                                      margin: EdgeInsets.only(top: 20, right: 20),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            CustomColor.theme_color1,
                                            // Replace with your desired colors
                                            CustomColor.theme_color1,
                                            // Replace with your desired colors
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                            fontFamily: 'Nunito Regular',
                                            color: Colors.white,
                                            fontSize: FontSize.sp_18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    child: const Offstage(
                                      offstage: true,
                                      child: Column(
                                        children: [
                                          CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation<Color>(
                                              Color(
                                                  0xFF00FF00), // Replace with your desired color
                                            ),
                                            backgroundColor: Color(
                                                0xFF0000FF), // Replace with your desired color
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    circleProcessbar
                  ]),
                ],
              ),
            )));
  }
}
