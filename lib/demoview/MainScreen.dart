import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: MainScreen(),
  ));
}

final tabs = ['Home', 'Tutorial Videos', 'FAQ', 'Contact Us'];
final menu_bottom_sheet = ['Item 1', 'Item 2', 'Item 3']; // Define your bottom sheet items here

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabs[selectedPosition]),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openBottomSheet,
          child: Text('Open Bottom Navigation Sheet'),
        ),
      ),
      drawer: DrawerDesign(),
      floatingActionButton: FloatingActionButton(
        onPressed: _openBottomSheet,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomTab(),
    );
  }

  Widget _buildBottomTab() {
    return BottomAppBar(
      color: Colors.blue, // Replace with your desired color
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TabItem(
            text: tabs[0],
            icon: Icons.home,
            isSelected: selectedPosition == 0,
            onTap: () {
              _openBottomSheet(); // Open bottom sheet when item is tapped
              setState(() {
                selectedPosition = 0;
              });
            },
          ),
          TabItem(
            text: tabs[1],
            icon: Icons.video_collection,
            isSelected: selectedPosition == 1,
            onTap: () {
              _openBottomSheet(); // Open bottom sheet when item is tapped
              setState(() {
                selectedPosition = 1;
              });
            },
          ),
          SizedBox(
            width: 48,
          ),
          TabItem(
            text: tabs[2],
            icon: IconData(0xf22f, fontFamily: 'MaterialIcons'),
            isSelected: selectedPosition == 2,
            onTap: () {
              _openBottomSheet(); // Open bottom sheet when item is tapped
              setState(() {
                selectedPosition = 2;
              });
            },
          ),
          TabItem(
            text: tabs[3],
            icon: Icons.phone_forwarded,
            isSelected: selectedPosition == 3,
            onTap: () {
              _openBottomSheet(); // Open bottom sheet when item is tapped
              setState(() {
                selectedPosition = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: ListView.builder(
            itemCount: menu_bottom_sheet.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(menu_bottom_sheet[index]),
                onTap: () {
                  setState(() {
                    selectedPosition = index;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }
}

class DrawerDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, // Replace with your desired color
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update UI based on selection
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update UI based on selection
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final Function()? onTap;

  const TabItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}

