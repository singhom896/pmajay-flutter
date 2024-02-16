







import 'package:flutter/cupertino.dart';

class DashBoardMenu
{

  DashBoardMenu({
    required this.id,
    required this.title,

    required this.icon,
    required this.iconColor,
  });


  int? id;
  final String title;

  final IconData icon;
  final Color iconColor;

  DashBoardMenu.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],

        icon = res["icon"],
        iconColor = res["iconColor"];

  Map<String, Object?> toMap() {
    return {'id':id,
      'title': title,

      'icon': icon,
      'iconColor': iconColor,

    };

  }



}
