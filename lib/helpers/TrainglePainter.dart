import 'package:flutter/material.dart';

import '../utils/Constants.dart';

class TrianglePainter extends CustomPainter {
  var mSize;
  TrianglePainter(this.mSize);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Constants.accent;

    var upPath = Path();
    //(x,y)
    upPath.moveTo(mSize.width / 3, 0); //start
    upPath.lineTo(mSize.width, 0); //draw horizontal
    upPath.lineTo(mSize.width, mSize.height / 3); //draw vertical
    upPath.close();

    var downPath = Path();
    downPath.moveTo(0, (mSize.height / 3)*2); //start
    downPath.lineTo(0, mSize.height); //draw horizontal
    downPath.lineTo((mSize.width / 5)*3, mSize.height); //draw vertical
    downPath.close();
    // (path, paint)
    canvas.drawPath(upPath, paint);
    canvas.drawPath(downPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
