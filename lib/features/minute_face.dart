import 'package:flutter/material.dart';
import 'package:gadi/utils/draw_ticks.dart';
import '../utils/constants.dart';

class MinuteCustomPaint extends StatelessWidget {
  final int minute;

  const MinuteCustomPaint({super.key, required this.minute});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MinuteFacePainter(minute: minute),
      child: Container(),
    );
  }
}

class MinuteFacePainter extends CustomPainter {
  final int minute;
  MinuteFacePainter({required this.minute});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);

    //draw minute ticks
    drawTicks(canvas, size, minuteFaceWidth, tickPainter, textPainter, minute: true, angleOffset: rotationAngle(minute));

    // canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
