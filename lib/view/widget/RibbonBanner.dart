import 'dart:typed_data';

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
// size: Size(203, 30),
// painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.cubicTo(66.99, 0, 133.98, 0, 203, 0);
    path_0.cubicTo(203, 9.9, 203, 19.8, 203, 30);
    path_0.cubicTo(136.01, 30, 69.02, 30, 0, 30);
    path_0.cubicTo(0, 20.1, 0, 10.2, 0, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff007DBB).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, 0);
    path_1.cubicTo(0, 8.91, 0, 17.82, 0, 27);
    path_1.cubicTo(-4.33333333, 22.66666667, -8.66666667, 18.33333333, -13, 14);
    path_1.cubicTo(-2.97969543, 0, -2.97969543, 0, 0, 0);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff000101).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(0, 0);
    path_2.cubicTo(4.33333333, 4.33333333, 8.66666667, 8.66666667, 13, 13);
    path_2.cubicTo(11.57757077, 14.65950077, 10.15484775, 16.31873421,
        8.73046875, 17.9765625);
    path_2.cubicTo(7.5812117, 19.32038903, 6.43791326, 20.66933547, 5.30078125,
        22.0234375);
    path_2.cubicTo(
        4.50220703, 22.97089844, 4.50220703, 22.97089844, 3.6875, 23.9375);
    path_2.cubicTo(3.19636719, 24.52402344, 2.70523437, 25.11054688, 2.19921875,
        25.71484375);
    path_2.cubicTo(1.80347656, 26.13894531, 1.40773437, 26.56304688, 1, 27);
    path_2.cubicTo(0.67, 27, 0.34, 27, 0, 27);
    path_2.cubicTo(0, 18.09, 0, 9.18, 0, 0);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff000203).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
