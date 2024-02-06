import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmajay/utills/AppString.dart';

import '../../../../utills/CustomColor.dart';
import '../../../../utills/FontSize.dart';

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
      home: const VillageFormatiadd(),
    );
  }
}

class VillageFormatiadd extends StatefulWidget {
  const VillageFormatiadd({super.key});

  @override
  State<VillageFormatiadd> createState() => _village_format_i_addState();
}

class _village_format_i_addState extends State<VillageFormatiadd> {
  final _formKey = GlobalKey<FormState>();
  String blockValue = "--Select--";
  String gramValue = "--Select--";

  List<String> get dropdownblockItems{
    List<String> menuItems = [
      "--Select--","Delhi W Est","Delhi W Est1"

    ];
    return menuItems;
  }
  List<String> get dropdownGramItems{
    List<String> menuItems = [
      "--Select--","Delhi W Est","Delhi W Est1"

    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.app_name,
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppString.app_name),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.5), // Elevation color
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(

                          decoration: const InputDecoration(
                            hintText: 'Enter your State',
                            labelText: 'State',
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), // Adjust text padding

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 3,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.5), // Elevation color
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter Your District',
                            labelText: 'District',
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), // Adjust text padding

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your district';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  children: [

                    Expanded(
                     flex: 1,
                      child: Container(

                        decoration: BoxDecoration(color: Colors.white),

                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin:
                              EdgeInsets.only( top: 13),
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: CustomColor.gray_dark, width: 1.0),
                                borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
                              ),
                              constraints: BoxConstraints(),
                              child: DropdownButton<String>(
                                style: TextStyle(
                                  color: Colors.white,
                                ),

                                padding:
                                EdgeInsets.only(top: 10, right: 10),
                                isExpanded: true,
                                // The value that is initially selected.
                                value: blockValue,
                                onChanged: (String? newValue)
                                {
                                  setState(() {
                                    blockValue = newValue!;


                                  });





                                },
                                // The list of items in the dropdown menu.
                                items: dropdownblockItems
                                    .map((String item) {
                                  return DropdownMenuItem<String>(
                                    alignment: Alignment.bottomCenter,
                                    value: item,
                                    child: Container(
                                        height: 50,
                                        child: Text(
                                          item,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: FontSize.sp_16,
                                          ),
                                        )),
                                  );
                                }).toList(),
                                // Callback function when an item is selected.

                                underline: SizedBox(),

                                icon: Icon(Icons.arrow_drop_down,
                                    size: 20, color: Colors.black),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              top: 3,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                color: Colors.white,
                                child: Text("Block *"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(

                        decoration: BoxDecoration(color: Colors.white),
                        padding: new EdgeInsets.only(left: 2.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin:
                              EdgeInsets.only( top: 13),
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: CustomColor.gray_dark, width: 1.0),
                                borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
                              ),
                              constraints: BoxConstraints(),
                              child: DropdownButton<String>(
                                style: TextStyle(
                                  color: Colors.white,
                                ),

                                padding:
                                EdgeInsets.only(top: 10, right: 10),
                                isExpanded: true,
                                // The value that is initially selected.
                                value: gramValue,
                                onChanged: (String? newValue)
                                {
                                  setState(() {
                                    gramValue = newValue!;


                                  });





                                },
                                // The list of items in the dropdown menu.
                                items: dropdownGramItems
                                    .map((String item) {
                                  return DropdownMenuItem<String>(
                                    alignment: Alignment.bottomCenter,
                                    value: item,
                                    child: Container(
                                        height: 50,
                                        child: Text(
                                          item,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: FontSize.sp_16,
                                          ),
                                        )),
                                  );
                                }).toList(),
                                // Callback function when an item is selected.

                                underline: SizedBox(),

                                icon: Icon(Icons.arrow_drop_down,
                                    size: 20, color: Colors.black),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              top: 3,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                color: Colors.white,
                                child: Text("Gram Panchayat *"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),



                new Container(
                    padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                    child: new ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () {
                        // It returns true if the form is valid, otherwise returns false
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a Snackbar.
                          // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Data is in processing.')));
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
