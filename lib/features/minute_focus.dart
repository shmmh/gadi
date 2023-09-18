import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gadi/config/draw_ticks.dart';
import '../config/constants.dart';

class MinuteFocusPainter extends CustomPainter {
  MinuteFocusPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);

    final focusPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.save();
    canvas.rotate(pi / 2);
    RRect focus = RRect.fromRectAndRadius(
        Rect.fromCenter(center: const Offset(0.0, -minuteFocusOffset), width: minuteFocusWidth, height: minuteFocusHeight),
        const Radius.circular(minuteFocusBorderRadius));
    canvas.drawRRect(focus, focusPaint);
    canvas.restore();

    // canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
