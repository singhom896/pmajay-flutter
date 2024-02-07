import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmajay/utills/AppString.dart';

import '../../../../demoview/DropDownFormField.dart';
import '../../../../demoview/genBill.dart';
import '../../../../utills/CustomColor.dart';
import '../../../../utills/FontSize.dart';
import '../../../widget/ExpandableTextWidget.dart';

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

  }

  late bool clickevent;


  List<Widget> widgets = [];

  addDynamic(){
    setState(() {
      widgets.add(new dynamicWidget());
    });

  }

  List<String> Price = [];

  List<String>Product = [];
  List<dynamicWidget> dynamicList = [];
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
            padding: EdgeInsets.only(left: 10, right: 10,),
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
                            border: Border.all(color: CustomColor.black_light, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child:Column(
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
                                child:Text(
                                  '1.Village Level Data',
                                  style: TextStyle(
                                      fontSize: 18.00, color: CustomColor.white),
                                ), ),

                              Container(
                                padding: EdgeInsets.only(left: 5,right: 5,bottom: 5),
                                child: Column(children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Background color
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green.withOpacity(0.5),
                                          // Elevation color
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
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 5), // Adjust text padding
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
                                      color: Colors.white, // Background color
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green.withOpacity(0.5),
                                          // Elevation color
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
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 5), // Adjust text padding
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
                                    margin: EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Background color
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green.withOpacity(0.5),
                                          // Elevation color
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Population of Village (Census 2011)',
                                        labelText: 'Population of Village (Census 2011)',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 5), // Adjust text padding
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Population of Village (Census 2011)';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Background color
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green.withOpacity(0.5),
                                          // Elevation color
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'SC Population of Village',
                                        labelText: 'SC Population of Villag',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 5), // Adjust text padding
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter SC Population of Village';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Background color
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green.withOpacity(0.5),
                                          // Elevation color
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'No. of Households as on date',
                                        labelText: 'No. of Households as on date',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 5), // Adjust text padding
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'No. of Households as on date';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Background color
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green.withOpacity(0.5),
                                          // Elevation color
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Currenlty Total Population of village/GP',
                                        labelText: 'Currenlty Total Population of village/GP',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 5), // Adjust text padding
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Currenlty Total Population of village/GP';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Background color
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green.withOpacity(0.5),
                                          // Elevation color
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Currenlty SC Population of village/GP',
                                        labelText: 'Currenlty SC Population of village/GP',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 5), // Adjust text padding
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Currenlty SC Population of village/GP';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white, // Background color
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.green.withOpacity(0.5),
                                                // Elevation color
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(
                                                    0, 1), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              hintText: 'From Date',
                                              labelText: 'From Date',
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 5), // Adjust text padding
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'From Date';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white, // Background color
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.green.withOpacity(0.5),
                                                // Elevation color
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(
                                                    0, 1), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              hintText: 'To Date',
                                              labelText: 'To Date',
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 5), // Adjust text padding
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'To Date';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],),
                              ),

                            ],
                          )

                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: CustomColor.black_light, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                          ),
                        child:Column(
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
                              child:Text(
                              '2.GPS Data : GPS Coordinates of Village',
                              style: TextStyle(
                                  fontSize: 18.00, color: CustomColor.white),
                            ), ),

                            Container(
                              padding: EdgeInsets.only(left: 5,right: 5,bottom: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white, // Background color
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.green.withOpacity(0.5),
                                            // Elevation color
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(
                                                0, 1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'From Date',
                                          labelText: 'From Date',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 5), // Adjust text padding
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'From Date';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white, // Background color
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.green.withOpacity(0.5),
                                            // Elevation color
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(
                                                0, 1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'To Date',
                                          labelText: 'To Date',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 5), // Adjust text padding
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'To Date';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )

                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: CustomColor.black_light, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child:Column(
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
                                child:ExpandableTextWidget(
                                  text: '3. Details of Village PMAGY Convergence Committee (Minimum 5 members should be in Village Level Convergence Committee (VLCC)) *',
                                  textStyle: TextStyle(
                                      fontSize: 18.00, color: CustomColor.white),
                                  maxLines: 4,
                                ), ),

                              Container(
                                padding: EdgeInsets.only(left: 5,right: 5,bottom: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white, // Background color
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.green.withOpacity(0.5),
                                              // Elevation color
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(
                                                  0, 1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'From Date',
                                            labelText: 'From Date',
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 5), // Adjust text padding
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'From Date';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white, // Background color
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.green.withOpacity(0.5),
                                              // Elevation color
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(
                                                  0, 1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'To Date',
                                            labelText: 'To Date',
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 5), // Adjust text padding
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'To Date';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )

                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: CustomColor.black_light, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child:Column(
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
                                child:ExpandableTextWidget(
                                  text: '3. Details of Village PMAGY Convergence Committee (Minimum 5 members should be in Village Level Convergence Committee (VLCC)) *',
                                  textStyle: TextStyle(
                                      fontSize: 18.00, color: CustomColor.white),
                                  maxLines: 4,
                                ), ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: widgets.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: widgets[index],
                                  );
                                },
                              )


                            ],
                          )

                      ),
                    ],
                  ),
                ),
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton:  ElevatedButton(
          child: Text('Submit',style: TextStyle(
              fontSize: FontSize.sp_17,
              fontWeight: FontWeight.bold,color: CustomColor.white)),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // If the form is valid, display a Snackbar.
              // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Data is in processing.')));
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.theme_color1,
              padding: EdgeInsets.only(left: 20,right: 20),
              ),
        )
      ),
    );
  }
}
