import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pmajay/utills/AppString.dart';
import 'package:pmajay/utills/CustomColor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screen/NodelOfficerDetails.dart';
import '../screen/fragment/villageformat/VillageFormatiadd.dart';



class DrawerDesign extends StatelessWidget {
  const DrawerDesign({super.key});


  Widget dividerLine() {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      child: const Divider(
        color: Colors.grey,
        thickness: 0.5,
      ),
    );
  }
  Route _createRoute(StatefulWidget screenCall) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  screenCall,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  Widget mainDrawer(BuildContext context)
  {
    return   Drawer(
      backgroundColor:CustomColor.drawer_bg,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          UserAccountsDrawerHeader(
            accountName:  Text(AppString.nodel_officer_des),
            accountEmail: Text(AppString.nodel_office),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/logindemo/user.png"),
            ),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: NetworkImage(
            //       "https://appmaking.co/wp-content/uploads/2021/08/android-drawer-bg.jpeg",
            //     ),
            //     fit: BoxFit.fill,
            //   ),
            // ),

            decoration: BoxDecoration(
                color: CustomColor.theme_color1,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: CustomColor.drawer_bg),
                boxShadow: [
                  BoxShadow(
                      color: CustomColor.drawer_bg,
                      blurRadius: 20.0,
                      offset: Offset(0, 10)
                  )
                ]
            ),
          ),

          Visibility(
            visible: true,
            child: Column(children: [
              dividerLine(),
              GestureDetector(
                onTap: ()
                {

                },
                child: ListTile(

                  title: Text(AppString.title_dashboard),
                ),
              ),
            ],),
          ),
          Visibility(
            visible: false,
            child: Column(children: [
              dividerLine(),
              GestureDetector(
                onTap: ()
                {

                },
                child: ListTile(

                  title: Text(AppString.title_village_ver),
                ),
              ),
            ],),
          ),
          Visibility(
            visible: true,
            child: Column(children: [
              dividerLine(),
              ExpansionTile(
                title: Text(AppString.title_village_format),
                children: <Widget>[
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(_createRoute(VillageFormatiadd()));
                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_village_format_i),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_village_format_i_edit),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_village_format_ii_add),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_village_format_ii_edit),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_village_format_iii_add),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_village_format_iii_A_edit),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_village_format_iii_A_edit_delete),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_village_format_iii_B_add_edit),

                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_village_format_iv),
                    ),
                  ),

                ],
              ),
            ],),
          ),
          Visibility(
            visible: false,
            child: Column(children: [
              dividerLine(),
              ExpansionTile(
                title: Text(AppString.title_agency),
                children: <Widget>[
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_add_agency),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_agency_list),
                    ),
                  ),

                ],
              ),
            ],),
          ),
          Visibility(
            visible: false,
            child: Column(children: [
              dividerLine(),
              GestureDetector(
                onTap: ()
                {

                },
                child: ListTile(

                  title: Text(AppString.title_generate_village_scrore),
                ),
              ),
            ],),
          ),
          Visibility(
            visible: false,
            child: Column(children: [
              dividerLine(),
              ExpansionTile(
                title: Text(AppString.title_manage_vdp),
                children: <Widget>[
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_generate_complete_vdp),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_unlock_vdp_request),
                    ),
                  ),

                ],
              ),
            ],),
          ),

          Visibility(
            visible: false,
            child: Column(children: [
              dividerLine(),
              ExpansionTile(
                title: Text(AppString.title_submit_process),
                children: <Widget>[
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_format_iv),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_format_v),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_format_vi),
                    ),
                  ),
                ],
              ),
            ],),
          ),
          Visibility(
            visible: false,
            child: Column(children: [
              dividerLine(),
              ExpansionTile(
                title: Text(AppString.title_manage_adarsh_gram),
                children: <Widget>[
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_declare_adarsh_gram),
                    ),
                  ),


                ],
              ),
            ],),
          ),
          Visibility(
            visible: false,
            child: Column(children: [
              dividerLine(),
              GestureDetector(
                onTap: ()
                {

                },
                child: ListTile(

                  title: Text(AppString.title_reports),
                ),
              ),
            ],),
          ),
          Visibility(
            visible: true,
            child: Column(children: [
              dividerLine(),
              GestureDetector(
                onTap: ()
                {

                  launchUrl(Uri.parse('https://www.youtube.com/channel/UCvtZvyOHREh-7qO2q0ULNVw'));

                },
                child: ListTile(

                  title: Text(AppString.title_tutorial_video),
                ),
              ),
            ],),
          ),
          Visibility(
            visible: false,
            child: Column(children: [
              dividerLine(),
              GestureDetector(
                onTap: ()
                {

                },
                child: ListTile(

                  title: Text(AppString.title_tutorial_video),
                ),
              ),
            ],),
          ),
          Visibility(
            visible: false,
            child: Column(children: [
              dividerLine(),
              GestureDetector(
                onTap: ()
                {

                },
                child: ListTile(

                  title: Text(AppString.title_image_video),
                ),
              ),
            ],),
          ),
          Visibility(
            visible: true,
            child: Column(children: [
              dividerLine(),
              GestureDetector(
                onTap: ()
                {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(_createRoute(NodelOfficerDetails()));

                },
                child: ListTile(

                  title: Text(AppString.title_contact_state_nodel),
                ),
              ),
            ],),
          ),
          Visibility(
            visible: true,
            child: Column(children: [
              dividerLine(),
              GestureDetector(
                onTap: ()
                {

                },
                child: ListTile(

                  title: Text(AppString.title_nodel_officer_details),
                ),
              ),
            ],),
          ),
          Visibility(
            visible: true,
            child: Column(children: [
              dividerLine(),
              GestureDetector(
                onTap: ()
                {

                },
                child: ListTile(

                  title: Text(AppString.title_faq),
                ),
              ),
            ],),
          ),
          Visibility(
            visible: true,
            child: Column(children: [
              dividerLine(),
              ExpansionTile(
                title: Text(AppString.title_help),
                children: <Widget>[
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.play_circle_outline),
                      title: Text(AppString.title_tutorial_videos),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_tutorial_format_1),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_tutorial_format_3A),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_tutorial_format_3B),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_tutorial_format_3B),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_user_manual_format_5A),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: ListTile(
                      leading: Icon(Icons.keyboard_arrow_right_outlined),
                      title: Text(AppString.title_user_manual_vdp_ivdp),
                    ),
                  ),
                ],
              ),
            ],),
          ),

          Visibility(
            visible: true,
            child: Column(children: [
              dividerLine(),
              GestureDetector(
                onTap: ()
                {

                },
                child: ListTile(

                  title: Text(AppString.title_contact_us),
                ),
              ),
            ],),
          ),

          SizedBox(height: 100,)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context)
  {


    return mainDrawer(context);
  }
}

