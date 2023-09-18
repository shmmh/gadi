import 'package:flutter/material.dart';

import '../config/constants.dart';

class HourFacePainter extends CustomPainter {
  HourFacePainter();

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    // canvas.translate(center.dx, center.dy);
    print(center);
    double hour = 12.0;

    TextPainter hourPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      textWidthBasis: TextWidthBasis.parent,
    );
    hourPainter.text = TextSpan(
      text: hour.toString(),
      style: hourTextStyle,
    );
    hourPainter.layout();
    hourPainter.paint(canvas, center);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
