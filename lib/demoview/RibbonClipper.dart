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
          title: Text('Blue Ribbon Background'),
        ),
        body: Container(
          color: Colors.blue, // Background color
          child: Column(
            children: [
              Container(
                height: 100, // Height of the ribbon
                child: ClipPath(
                  clipper: RibbonClipper(),
                  child: Container(
                    color: Colors.white, // Color of the ribbon
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Blue Ribbon',
                          style: TextStyle(
                            color: Colors.blue, // Text color of the ribbon
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Add other widgets below the ribbon
              // For example: Text('Hello, World!')
            ],
          ),
        ),
      ),
    );
  }
}

class RibbonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
