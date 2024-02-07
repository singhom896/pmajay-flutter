import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../demoview/DropDownFormField.dart';



class DynamicWidgets extends StatefulWidget {
  @override
  _DynamicWidgetsState createState() => _DynamicWidgetsState();
}

class _DynamicWidgetsState extends State<DynamicWidgets> {
  List<Widget> widgets = [];

  addDynamic(){
    setState(() {
      widgets.add(new dynamicWidget());
    });

  }

  List<String> Price = [];

  List<String>Product = [];
  List<dynamicWidget> dynamicList = [];
  // submitData() {
  //
  //   Product = [];
  //   Price = [];
  //   widgets.forEach((widget) => Product.add(widget.Product.text));
  //   dynamicList.forEach((widget) => Price.add(widget.Price.text));
  //   setState(() {});
  //   print(Product.length);
  //   sendData();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: widgets[index],
              );
            },
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed:addDynamic,
          child: Text('Add Widget'),
        ),

      ],
    );
  }
}
class dynamicWidget extends StatefulWidget {
  @override
  State<dynamicWidget> createState() => _dynamicWidgetState();
}

class _dynamicWidgetState extends State<dynamicWidget> {
  TextEditingController Product = new TextEditingController();

  TextEditingController Price = new TextEditingController();
  late bool clickevent;
  late String _myActivity;
  late String _myActivityResult;
  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
    clickevent = false;

  }
  @override
  Widget build(BuildContext context) {

    return Container(
//      margin: new EdgeInsets.all(8.0),
      child:ListBody(
        children: <Widget>[
          Column(children: [
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
                  hintText: 'Enter your Name',
                  labelText: 'Name',
                  contentPadding: EdgeInsets.symmetric( vertical: 5,horizontal: 5), // Adjust text padding
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
                  hintText: 'Enter your Designation',
                  labelText: 'Designation',
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

              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    clickevent = true;
                  });
                },
                child: DropDownFormField(
                  titleText: 'Designation',
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
                      "display": "AAO",
                      "value": "AAO",
                    },
                    {
                      "display": "A.N.M",
                      "value": "A.N.M",
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
                  hintText: 'Enter your Mobile No.',
                  labelText: 'Mobile No.',
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
                  hintText: 'Enter your Email.',
                  labelText: 'Email',
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
                  hintText: 'Enter your Address.',
                  labelText: 'Address',
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
                  hintText: 'Enter your Remark.',
                  labelText: 'Remark',
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

          ],)

        ],
      ),
    );
  }
}