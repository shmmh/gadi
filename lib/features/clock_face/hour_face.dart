import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class HourCustomPaint extends StatelessWidget {
  final int hour;
  const HourCustomPaint({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HourFacePainter(hour: hour),
      child: Container(),
    );
  }
}

class HourFacePainter extends CustomPainter {
  final int hour;
  const HourFacePainter({required this.hour});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);

    TextPainter hourPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      textWidthBasis: TextWidthBasis.parent,
    );
    hourPainter.text = TextSpan(
      text: hour.toString().padLeft(2, "0"),
      style: hourTextStyle,
    );
    hourPainter.layout();
    Offset hourPos = Offset(-(hourPainter.size.width / 2), -(hourPainter.size.height / 2));
    hourPainter.paint(canvas, hourPos);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
