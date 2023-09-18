import 'package:flutter/material.dart';
import 'package:gadi/config/draw_ticks.dart';
import '../config/constants.dart';

class MinuteFacePainter extends CustomPainter {
  MinuteFacePainter();

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);

    //draw minute ticks
    drawTicks(canvas, size, minuteFaceWidth, tickPainter, textPainter, minute: true);

    // canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
