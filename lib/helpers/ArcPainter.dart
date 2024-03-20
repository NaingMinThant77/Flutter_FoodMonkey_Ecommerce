import 'package:flutter/material.dart';
import 'package:foodmonkey/utils/Constants.dart';
import 'dart:math' as math;

class ArcPainter extends CustomPainter {
  var mediaSize;
  ArcPainter(this.mediaSize);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Constants.secondary;

    final rect = Rect.fromLTRB(-600, 200, 400, 1500);
    final startAngle = -degreeToRadian(100);
    final sweepAngle = degreeToRadian(300);
    final useCenter = false;

    //sweepAngle = endangle(how much); 1 degree = 0.0174533 radian;
    // formula - 360 * Pi/180 = 6.283rad
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  degreeToRadian(degree) {
    return degree * (math.pi / 180);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
