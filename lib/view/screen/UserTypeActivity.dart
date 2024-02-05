import 'package:flutter/material.dart';

import '../../utills/CustomColor.dart';
import '../../utills/FontSize.dart';
import 'LoginActivity.dart';

class UserTypeActivity extends StatelessWidget {
  const UserTypeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    Widget main_card = Container(
        child: SizedBox(
            height: 700,
            width: 400,
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: ListView(children: <Widget>[
                    Container(
                        child: Container(
                            child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Image.asset(
                          "assets/images/ic_logo.webp",
                              height: 100,
                              width: 100,
                          // fit: BoxFit.fitCenter,
                        )),
                        SizedBox(height: 30, width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: InkWell(
                                    onTap: () => Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginActivity(
                                                    userType: 'Student',
                                                    LoginTitle: 'Student',
                                                  )),
                                        ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/ic_adarshgram.webp",
                                          width: 100.0,
                                          height: 120.0,
                                          // fit: BoxFit.fitCenter,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10,right: 10),
                                          child: Text(
                                            'Development of SC dominated villages into “Adarsh Gram”',
                                            style: TextStyle(
                                                fontFamily: 'Nunito Regular',
                                                color:CustomColor.black_light,
                                                fontSize: FontSize.sp_10,
                                                fontWeight:FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginActivity(
                                                      userType: 'AdarshGram',
                                                      LoginTitle: 'Adarsh Gram',
                                                    )),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 140,
                                              height: 30,
                                              margin: EdgeInsets.only(
                                                  top: 20, right: 20),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [

                                                    CustomColor.theme_color1,
                                                    // Replace with your desired colors
                                                    CustomColor.theme_color1,
                                                    // Replace with your desired colors
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Adarsh Gram',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Nunito Regular',
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
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
                            Expanded(
                              child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: InkWell(
                                    onTap: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginActivity(
                                                userType: 'State/Districts',
                                                LoginTitle: 'State/Districts',
                                              )),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/ic_adarshgram.webp",
                                          width: 100.0,
                                          height: 120.0,
                                          //fit: BoxFit.fitCenter,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10,right: 10),
                                          child: Text(
                                            'Grants-in-aid to State/Districts',
                                            style: TextStyle(
                                                fontFamily: 'Nunito Regular',
                                                color:CustomColor.black_light,
                                                fontSize: FontSize.sp_10,
                                                fontWeight:FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginActivity(
                                                      userType: 'State/Districts',
                                                      LoginTitle: 'State/Districts',
                                                    )),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 140,
                                              height: 30,
                                              margin: EdgeInsets.only(
                                                  top: 20, right: 20),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    CustomColor.theme_color1,
                                                    // Replace with your desired colors
                                                    CustomColor.theme_color1,
                                                    // Replace with your desired colors
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'State/Districts',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Nunito Regular',
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10, width: 10)
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 20, width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginActivity(
                                                userType: 'Staff',
                                                LoginTitle: '',
                                              )),
                                    );
                                  },
                                  child: InkWell(
                                      onTap: () => Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginActivity(
                                                      userType: 'Hostels',
                                                      LoginTitle: 'Hostels',
                                                    )),
                                          ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/ic_adarshgram.webp",
                                            width: 100.0,
                                            height: 120.0,
                                            //fit: BoxFit.fitCenter,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10,right: 10),
                                            child: ExpansionTile(
                                              trailing: null, // Removing the default arrow icon
                                              title: Text(
                                                'Construction/Repair of Hostels',
                                                style: TextStyle(
                                                    fontFamily: 'Nunito Regular',
                                                    color:CustomColor.black_light,
                                                    fontSize: FontSize.sp_10,
                                                    fontWeight:FontWeight.bold
                                                ),
                                              ),
                                              children: <Widget>[
                                                Text('Big Bang'),
                                                Text('Birth of the Sun'),
                                                Text('Earth is Born'),
                                              ],
                                            )
                                            // child: Text(
                                            //   'Construction/Repair of Hostels',
                                            //   style: TextStyle(
                                            //       fontFamily: 'Nunito Regular',
                                            //       color:CustomColor.black_light,
                                            //       fontSize: FontSize.sp_10,
                                            //       fontWeight:FontWeight.bold
                                            //   ),
                                            // ),
                                          ),
                                          InkWell(
                                            onTap: () =>
                                                Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginActivity(
                                                        userType: 'Hostels',
                                                        LoginTitle: 'Hostels',
                                                      )),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                width: 140,
                                                height: 30,
                                                margin: EdgeInsets.only(
                                                    top: 20, right: 20),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      CustomColor.theme_color1,
                                                      // Replace with your desired colors
                                                      CustomColor.theme_color1,
                                                      // Replace with your desired colors
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(

                                                  child: Text(
                                                    'Hostels',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Nunito Regular',
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
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
                            ),
                            Expanded(
                              child: Container(
                                  child: Offstage(
                                offstage: true,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/ic_adarshgram.webp",
                                      width: 100.0,
                                      height: 120.0,
                                      // fit: BoxFit.fitCenter,
                                    ),
                                    Container(
                                      color: Colors.orange,
                                      // Change to your gradient
                                      height: 35.0,
                                      child: Center(
                                        child: Text(
                                          "Coordinator",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ),
                          ],
                        ),
                      ],
                    ))),
                  ]),
                ))));
    Widget MainColoumn = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        main_card,
      ],
    );

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColor.white,
              CustomColor.white
            ],
          ),
        ),
        child: SingleChildScrollView(
            reverse: false,
            physics: ScrollPhysics(),
            child: Container(
              child: Center(child: MainColoumn),
            )));
  }
}
