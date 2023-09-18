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
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;
    final focusRect = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.save();
    // canvas.rotate(pi / 2);
    RRect focus = RRect.fromRectAndRadius(
        Rect.fromCenter(center: const Offset(0.0, -minuteFocusOffset), width: minuteFocusWidth, height: minuteFocusHeight),
        const Radius.circular(minuteFocusBorderRadius));
    RRect focusOutline = RRect.fromRectAndRadius(
        Rect.fromCenter(center: const Offset(0.0, -minuteFocusOffset), width: minuteFocusWidth, height: minuteFocusHeight),
        const Radius.circular(minuteFocusBorderRadius));
    canvas.drawRRect(focus, focusPaint);
    canvas.drawRRect(focusOutline, focusRect);

    TextPainter secondPainter = TextPainter(textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    TextPainter minutePainter = TextPainter(textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    secondPainter.text = const TextSpan(text: "01", style: secondTextStyle);
    minutePainter.text = const TextSpan(text: "02", style: minuteTextStyle);

    minutePainter.layout();
    secondPainter.layout();

    Offset minuteOffset = Offset(-(minutePainter.width / 2), -(minutePainter.height / 2) - minuteTextOffset);
    Offset secondOffset = Offset(-(secondPainter.width / 2), -(secondPainter.height / 2) - secondTextOffset);

    secondPainter.paint(canvas, secondOffset);
    minutePainter.paint(canvas, minuteOffset);
    tickPainter.strokeWidth = 2;
    canvas.drawLine(const Offset(0.0, -secondFaceWidth + 40), const Offset(0.0, -secondFaceWidth + 50), tickPainter);

    canvas.restore();

    // canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
