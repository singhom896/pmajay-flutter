import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmajay/utills/AppString.dart';

import '../../../widget/DropDownFormField.dart';
import '../../../widget/DynamicWidgets.dart';
import '../../../../utills/CustomColor.dart';
import '../../../../utills/FontSize.dart';
import '../../../widget/ExpandableTextWidget.dart';
import '../../../widget/CustomWidget.dart';
import '../../../widget/ResizableTextView.dart';
import '../../../../utills/ButtomMenu.dart';
import 'VillageFormat_I_Add.dart';

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
      home: const VillageFormat_III_HouseholdLevelDataAdd(),
    );
  }
}

class VillageFormat_III_HouseholdLevelDataAdd extends StatefulWidget {
  const VillageFormat_III_HouseholdLevelDataAdd({super.key});

  @override
  State<VillageFormat_III_HouseholdLevelDataAdd> createState() =>
      _village_format_i_addState();
}

class _village_format_i_addState
    extends State<VillageFormat_III_HouseholdLevelDataAdd> {
  final _formKey = GlobalKey<FormState>();
  String blockValue = "--Select--";
  String gramValue = "--Select--";

  List<String> get dropdownblockItems {
    List<String> menuItems = ["--Select--", "Delhi W Est", "Delhi W Est1"];
    return menuItems;
  }

  List<String> get dropdownGramItems {
    List<String> menuItems = ["--Select--", "Delhi W Est", "Delhi W Est1"];
    return menuItems;
  }

  late String _myActivity;
  late String _myActivityResult;

  _saveForm() {
    var form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
    clickevent = false;
    addDynamic();
  }

  late bool clickevent;

  List<Widget> widgets = [];

  addDynamic() {
    setState(() {
      widgets.add(new dynamicWidget());
    });
  }

  List<String> Price = [];

  List<String> Product = [];
  List<dynamicWidget> dynamicList = [];

  Widget dividerLine() {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      child: const Divider(
        color: Colors.grey,
        thickness: 0.5,
      ),
    );
  }

  final menu_buttom_sheet = [
    ButtomMenu('x 1.1', 'x 1.1', VillageFormat_I_Add(),CustomColor.card_5),
    ButtomMenu('x 1.2', 'x 1.2', VillageFormat_I_Add(),CustomColor.card_5),
    ButtomMenu('x 1.3', 'x 1.3', VillageFormat_I_Add(),CustomColor.card_5),
    ButtomMenu('x 1.4', 'x 1.4', VillageFormat_I_Add(),CustomColor.card_5),
    ButtomMenu('x 1.5', 'x 1.5', VillageFormat_I_Add(),CustomColor.card_5),
    ButtomMenu('x 1.6', 'x 1.6', VillageFormat_I_Add(),CustomColor.card_5),
  ];

  Future<bool> _onBackPressed(BuildContext context) async {
    Navigator.pop(context, true);
    return true; // Example: Always allow back navigation
  }

  @override
  Widget build(BuildContext context) {
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
                child: ToolbarTextView(AppString.title_household_data_level_IIIA,FontSize.sp_18,CustomColor.white,FontWeight.bold)),
            backgroundColor: CustomColor.theme_color1,
            elevation: 2.0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              tooltip: 'Menu Icon',
              onPressed: () {
                _onBackPressed(context);
              },
            ),
          ),
          body: Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: CustomColor.black_light, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: CustomColor.theme_color1,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(5.0),
                                        topLeft: Radius.circular(5.0),
                                        bottomLeft: Radius.circular(5.0),
                                        bottomRight: Radius.circular(5.0)),
                                  ),
                                  child: ExpandableTextWidget(
                                    text:'Format - III(A): Household Level Data for Beneficiary Oriented Initiatives',
                                    textStyle: TextStyle(
                                        fontSize: 18.00,
                                        color: CustomColor.white),
                                    maxLines: 4,
                                  ),
                                ),
                                Visibility(
                                  visible: false,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 20.0, left: 5.0, right: 5.0),
                                    padding: EdgeInsets.all(5.0),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: CustomColor.mi_title_bg,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Column(
                                      children: [
                                        ExpandableTextWidget(
                                          text:
                                              'Status of filling up of Monitorable Indicator of the village.',
                                          textStyle: TextStyle(
                                              fontSize: 18.0,
                                              color: CustomColor.white),
                                          maxLines: 4,
                                        ),
                                        GridView.builder(
                                          shrinkWrap: true,
                                          // Important to add if GridView is placed inside a Column
                                          physics: NeverScrollableScrollPhysics(),
                                          // Disable GridView's scrolling
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 10,
                                            // Set the number of columns in the grid
                                            crossAxisSpacing: 4.0,
                                            // Set the spacing between columns
                                            mainAxisSpacing:
                                                4.0, // Set the spacing between rows
                                          ),
                                          itemCount: menu_buttom_sheet.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Add onTap functionality here
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(5.0),
                                                decoration: BoxDecoration(
                                                  color: CustomColor.mi_card_bg,
                                                  borderRadius:
                                                      BorderRadius.circular(5.0),
                                                ),
                                                child: ResizableTextView(
                                                  menu_buttom_sheet[index].title,
                                                  FontSize.sp_12,
                                                  CustomColor.white,
                                                  FontWeight.bold,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                            children: [
                                          Column(
                                            children: [
                                              ResizableTextView(
                                                  'Not filled.',
                                                  FontSize.sp_12,
                                                  CustomColor.white,
                                                  FontWeight.bold),
                                              Container(
                                                  width: 25,
                                                  height: 25,
                                                  padding: EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                    color: CustomColor.mi_card_bg,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Text(
                                                    textAlign: TextAlign.center,
                                                    'X',
                                                    style: TextStyle(
                                                        fontFamily: 'Calibri',
                                                        color: CustomColor.white,
                                                        fontSize: FontSize.sp_15
                                                        ,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              ResizableTextView(
                                                  'Already filled.',
                                                  FontSize.sp_12,
                                                  CustomColor.white,
                                                  FontWeight.bold),
                                              Container(
                                                  width: 25,
                                                  height: 25,
                                                  padding: EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                    color: CustomColor
                                                        .mi_card_already_fill_bg,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Text(
                                                    textAlign: TextAlign.center,
                                                    AppString.write_unicode_st,
                                                    style: TextStyle(
                                                        fontFamily: 'Calibri',
                                                        color: CustomColor.white,
                                                        fontSize: FontSize.sp_12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))
                                            ],
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5, bottom: 5),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color:
                                              Colors.white, // Background color
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.green.withOpacity(0.5),
                                              // Elevation color
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Enter your State',
                                            labelText: 'State',
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal:
                                                    5), // Adjust text padding
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color:
                                              Colors.white, // Background color
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.green.withOpacity(0.5),
                                              // Elevation color
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Your District',
                                            labelText: 'District',
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal:
                                                    5), // Adjust text padding
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter your district';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            setState(() {
                                              clickevent = true;
                                            });
                                          },
                                          child: DropDownFormField(
                                            titleText: 'Block',
                                            hintText: ' --Select---',
                                            value: _myActivity,
                                            onSaved: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            dataSource: [
                                              {
                                                "display": "--Select Block---",
                                                "value": "--Select Block---",
                                              },
                                              {
                                                "display": "Delhi W East",
                                                "value": "Delhi W East",
                                              },
                                            ],
                                            textField: 'display',
                                            valueField: 'value',
                                            validator: (value) {},
                                            context: context,
                                            onTabClick: clickevent,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            setState(() {
                                              clickevent = true;
                                            });
                                          },
                                          child: DropDownFormField(
                                            titleText: 'Gram Panchayat',
                                            hintText: ' --Select---',
                                            value: _myActivity,
                                            onSaved: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            dataSource: [
                                              {
                                                "display": "--Select Block---",
                                                "value": "--Select Block---",
                                              },
                                              {
                                                "display": "Delhi W East",
                                                "value": "Delhi W East",
                                              },
                                            ],
                                            textField: 'display',
                                            valueField: 'value',
                                            validator: (value) {},
                                            context: context,
                                            onTabClick: clickevent,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            setState(() {
                                              clickevent = true;
                                            });
                                          },
                                          child: DropDownFormField(
                                            titleText: 'Village',
                                            hintText: ' --Select---',
                                            value: _myActivity,
                                            onSaved: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            dataSource: [
                                              {
                                                "display": "--Select Block---",
                                                "value": "--Select Block---",
                                              },
                                              {
                                                "display": "Delhi W East",
                                                "value": "Delhi W East",
                                              },
                                            ],
                                            textField: 'display',
                                            valueField: 'value',
                                            validator: (value) {},
                                            context: context,
                                            onTabClick: clickevent,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            setState(() {
                                              clickevent = true;
                                            });
                                          },
                                          child: DropDownFormField(
                                            titleText: 'Category',
                                            hintText: ' --Select---',
                                            value: _myActivity,
                                            onSaved: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            dataSource: [
                                              {
                                                "display": "--Select Category---",
                                                "value": "--Select Category---",
                                              },
                                              {
                                                "display": "SC",
                                                "value": "SC",
                                              },
                                              {
                                                "display": "ST",
                                                "value": "ST",
                                              },
                                              {
                                                "display": "Others",
                                                "value": "Others",
                                              },

                                            ],
                                            textField: 'display',
                                            valueField: 'value',
                                            validator: (value) {},
                                            context: context,
                                            onTabClick: clickevent,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            setState(() {
                                              clickevent = true;
                                            });
                                          },
                                          child: DropDownFormField(
                                            titleText: 'Have you entered details earlier?',
                                            hintText: ' --Select---',
                                            value: _myActivity,
                                            onSaved: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            dataSource: [
                                              {
                                                "display": "--Select---",
                                                "value": "--Select---",
                                              },
                                              {
                                                "display": "Yes",
                                                "value": "Yes",
                                              },
                                              {
                                                "display": "No",
                                                "value": "No",
                                              },


                                            ],
                                            textField: 'display',
                                            valueField: 'value',
                                            validator: (value) {},
                                            context: context,
                                            onTabClick: clickevent,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color:
                                          Colors.white, // Background color
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.green.withOpacity(0.5),
                                              // Elevation color
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Name of the Head of the household',
                                            labelText: 'Name of the Head of the household',
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal:
                                                5), // Adjust text padding
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter Name of the Head of the household';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color:
                                          Colors.white, // Background color
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.green.withOpacity(0.5),
                                              // Elevation color
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Number of persons in the household',
                                            labelText: 'Number of persons in the household',
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal:
                                                5), // Adjust text padding
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter Number of persons in the household';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color:
                                          Colors.white, // Background color
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.green.withOpacity(0.5),
                                              // Elevation color
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Mobile No.',
                                            labelText: 'Mobile No.',
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal:
                                                5), // Adjust text padding
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter Mobile No.';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),


                                      Container(
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            setState(() {
                                              clickevent = true;
                                            });
                                          },
                                          child: DropDownFormField(
                                            titleText: 'Domain',
                                            hintText: ' --Select---',
                                            value: _myActivity,
                                            onSaved: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                _myActivity = value;
                                              });
                                            },
                                            dataSource: [
                                              {
                                                "display": "--Select Domain---",
                                                "value": "--Select Block---",
                                              },
                                              {
                                                "display":
                                                "Drinking water and Sanitation",
                                                "value":
                                                "Drinking water and Sanitation",
                                              },
                                              {
                                                "display":
                                                "Health and Nutrition",
                                                "value": "Health and Nutrition",
                                              },
                                              {
                                                "display":
                                                "Rural Roads and Housing",
                                                "value":
                                                "Rural Roads and Housing",
                                              },
                                              {
                                                "display":
                                                "Electricity and Clean Fuel",
                                                "value":
                                                "Electricity and Clean Fuel",
                                              },
                                              {
                                                "display": "Digitization",
                                                "value": "Digitization",
                                              },
                                            ],
                                            textField: 'display',
                                            valueField: 'value',
                                            validator: (value) {},
                                            context: context,
                                            onTabClick: clickevent,
                                          ),
                                        ),
                                      ),
                                       SizedBox(height: 25,)
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              )),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: ElevatedButton(
            child: Text('Submit',
                style: TextStyle(
                    fontSize: FontSize.sp_17,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.white)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a Snackbar.
                // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Data is in processing.')));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.theme_color1,
              padding: EdgeInsets.only(left: 20, right: 20),
            ),
          )),
    );
  }
}
