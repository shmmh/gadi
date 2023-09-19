import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../utils/constants.dart';

class GradientCustomPaint extends StatelessWidget {
  const GradientCustomPaint({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: GradientOverlayPainter(),
      child: Container(),
    );
  }
}

class GradientOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);
    final paint = Paint()
      ..shader = ui.Gradient.radial(
        Offset.zero,
        130,
        const [
          Color.fromARGB(0, 0, 0, 0),
          Color.fromARGB(171, 0, 0, 0),
        ],
        [0.0, 1],
        TileMode.clamp,
        Matrix4.translationValues(0.0, 0.0, 0.0).storage,
      );

    canvas.drawCircle(Offset.zero, secondFaceWidth + 40, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
