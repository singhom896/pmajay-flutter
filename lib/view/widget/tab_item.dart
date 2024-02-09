import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
   final VoidCallback? onTap;

  const TabItem({Key? key, required this.text, required this.icon, required this.isSelected, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: isSelected ? Colors.white : Colors.black,),
            Text(text, style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 7
            ),)
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}