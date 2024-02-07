import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Widgets Example'),
        ),
        body: DynamicWidgets(),
      ),
    );
  }
}

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
class dynamicWidget extends StatelessWidget {
  TextEditingController Product = new TextEditingController();
  TextEditingController Price = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
//      margin: new EdgeInsets.all(8.0),
      child:ListBody(
        children: <Widget>[
          Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: new TextFormField(
                controller: Product,
                decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: new TextFormField(
                controller: Price,
                decoration: const InputDecoration(
                    labelText: 'Designation',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: new TextFormField(
                controller: Price,
                decoration: const InputDecoration(
                    labelText: 'Mobile No.',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: new TextFormField(
                controller: Price,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: new TextFormField(
                controller: Price,
                decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: new TextFormField(
                controller: Price,
                decoration: const InputDecoration(
                    labelText: 'Remark',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            )
          ],)

        ],
      ),
    );
  }

}