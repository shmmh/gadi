import 'package:flutter/material.dart';
import 'package:gadi/utils/draw_ticks.dart';

import '../../utils/constants.dart';

class SecondCustomPaint extends StatelessWidget {
  final int second;
  const SecondCustomPaint({super.key, required this.second});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(secondFaceWidth * 2, secondFaceWidth * 2),
      painter: SecondFacePainter(second: second),
    );
  }
}

class SecondFacePainter extends CustomPainter {
  late int second;
  SecondFacePainter({required this.second});
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);

    //draw second face ticks
    drawTicks(
      canvas,
      size,
      secondFaceWidth,
      tickPainter,
      textPainter,
      angleOffset: rotationAngle(second),
      minute: false,
    );
    // canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
