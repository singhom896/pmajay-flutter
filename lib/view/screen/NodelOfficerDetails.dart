import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utills/AppString.dart';
import '../../utills/CustomColor.dart';
import '../../utills/FontSize.dart';
import '../widget/CustomWidget.dart';
import '../widget/ResizableTextView.dart';



class NodelOfficerDetails extends StatefulWidget {
  const NodelOfficerDetails({super.key});

  @override
  State<NodelOfficerDetails> createState() => _NodelOfficerDetailsState();
}

class _NodelOfficerDetailsState extends State<NodelOfficerDetails> {
  Future<bool> _onBackPressed(BuildContext context) async {
    Navigator.pop(context, true);
    return true; // Example: Always allow back navigation
  }
  Widget Container_main()
  {
     return Expanded(child: Padding(padding: EdgeInsets.only(bottom: 5.0),

        child:Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white, // Border color
                width: 1.0, // Border width (1 pixel)
              ),
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              textViewWithFlex('State',Alignment.centerLeft,1,TextOverflow.ellipsis),
                              textViewWithFlex('Name',Alignment.centerLeft,1,TextOverflow.ellipsis)

                            ],),
                            Row(
                              children: [
                                textViewWithFlex('DELHI',Alignment.centerLeft,1,TextOverflow.ellipsis),
                                textViewWithFlex('State Officer',Alignment.centerLeft,1,TextOverflow.ellipsis),

                              ],),
                            dividerLine(),

                            Row(children: [
                              textViewWithFlex('Designation',Alignment.centerLeft,1,TextOverflow.ellipsis),
                              textViewWithFlex('Email Id',Alignment.centerLeft,1,TextOverflow.ellipsis)

                            ],),
                            Row(
                              children: [
                                textViewWithFlex('Director',Alignment.centerLeft,1,TextOverflow.ellipsis),
                                textViewWithFlex('kmgupta2.official@gmail.com',Alignment.centerLeft,1,TextOverflow.ellipsis),

                              ],),
                            dividerLine(),

                            Row(children: [
                              textViewWithFlex('Contact No.',Alignment.centerLeft,1,TextOverflow.ellipsis),
                              textViewWithFlex('Office Address',Alignment.centerLeft,1,TextOverflow.ellipsis)

                            ],),
                            Row(
                              children: [
                                textViewWithFlex('-',Alignment.centerLeft,1,TextOverflow.ellipsis),
                                textViewWithFlex('-',Alignment.centerLeft,1,TextOverflow.ellipsis),

                              ],),
                            dividerLine()
                          ],
                        ),
                      )),
                ),
              ]),
        )));
  }
  @override
  Widget build(BuildContext context)
  {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0),
            ),
          ),
          title: Align(
              alignment: Alignment.topLeft,
              child: ToolbarTextView(AppString.title_nodal_officer_details,FontSize.sp_18,CustomColor.white,FontWeight.bold)),
          backgroundColor: CustomColor.theme_color1,
          elevation: 2.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
            tooltip: 'Menu Icon',
            onPressed: () {
              _onBackPressed(context);
            },
          ),
        ),
        body:Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Container_main()
              ],
            )),

      ),

    );
  }
}
