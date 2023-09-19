import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gadi/utils/draw_ticks.dart';

import 'package:gadi/utils/constants.dart';

class FocusCustomPaint extends StatelessWidget {
  final DateTime dateTime;
  const FocusCustomPaint({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MinuteFocusPainter(dateTime: dateTime),
      child: Container(),
    );
  }
}

class MinuteFocusPainter extends CustomPainter {
  final DateTime dateTime;
  MinuteFocusPainter({required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);
    canvas.save();

    final focusPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    final focusRect = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.rotate(focusDir);
    RRect focus = RRect.fromRectAndRadius(
        Rect.fromCenter(center: const Offset(0.0, -minuteFocusOffset), width: minuteFocusWidth, height: minuteFocusHeight),
        const Radius.circular(minuteFocusBorderRadius));
    RRect focusOutline = RRect.fromRectAndRadius(
        Rect.fromCenter(center: const Offset(0.0, -minuteFocusOffset), width: minuteFocusWidth, height: minuteFocusHeight),
        const Radius.circular(minuteFocusBorderRadius));
    canvas.drawRRect(focus, focusPaint);
    canvas.drawRRect(focusOutline, focusRect);

    canvas.restore();
    canvas.save();
    canvas.rotate(focusDir);
    TextPainter secondPainter = TextPainter(textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    TextPainter minutePainter = TextPainter(textAlign: TextAlign.center, textDirection: TextDirection.ltr);

    // canvas.rotate((angle * dateTime.minute) - rotationAngle(dateTime.minute));
    drawText(canvas, minuteFaceWidth, distanceToMinuteTick + 5, minutePainter, dateTime.minute, minuteFocusTextStyle, angle,
        rotationAngle(dateTime.minute) + focusDir, 0, formattTime(dateTime.minute));
    drawText(canvas, secondFaceWidth, distanceToSecondTick + 5, secondPainter, dateTime.second, secondFocusTextStyle, angle,
        rotationAngle(dateTime.second) + focusDir, 0, formattTime(dateTime.second));
    // canvas.rotate(-angle);
    canvas.restore();

    // minutePainter.layout();
    // secondPainter.layout();

    // Offset minuteOffset = Offset(-(minutePainter.width / 2), -(minutePainter.height / 2) - minuteTextOffset);
    // Offset secondOffset = Offset(-(secondPainter.width / 2), -(secondPainter.height / 2) - secondTextOffset);

    // secondPainter.paint(canvas, secondOffset);
    // minutePainter.paint(canvas, minuteOffset);
    tickPainter.strokeWidth = 2;
    // canvas.drawLine(const Offset(0.0, -secondFaceWidth + 40), const Offset(0.0, -secondFaceWidth + 50), tickPainter);
//

    // canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
