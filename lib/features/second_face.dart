import 'package:flutter/material.dart';
import 'package:gadi/config/draw_ticks.dart';
import '../config/constants.dart';

class SecondFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);

    //draw second face ticks
    drawTicks(canvas, size, secondFaceWidth, tickPainter, textPainter, angleOffset: 0, minute: false);
    // canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
