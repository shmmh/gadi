import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../config/constants.dart';

class GradientOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);
    final paint = Paint()
      ..shader = ui.Gradient.radial(
        Offset.zero,
        200,
        const [
          Color.fromARGB(0, 0, 0, 0),
          Color.fromARGB(164, 0, 0, 0),
        ],
        [0.0, 1],
        TileMode.clamp,
        Matrix4.translationValues(0.0, 0.0, 0.0).storage,
      );

    canvas.drawCircle(Offset.zero, secondFaceWidth + 20, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
