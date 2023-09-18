import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';

void drawTicks(Canvas canvas, Size size, double radius, Paint tickPainter, TextPainter textPainter, {double angleOffset = 0, bool minute = true}) {
  double tickMarkLength;
  var angle = 2 * pi / 60;

  canvas.save();

  TextStyle textStyle = minute ? minuteTextStyle : secondTextStyle;
  double distanceToTick = minute ? distanceToMinuteTick : distanceToSecondTick;

  canvas.rotate(angleOffset);

  for (var i = 0; i < 60; i++) {
    tickMarkLength = i % 5 == 0 ? hourTickMarkLength : minuteTickMarkLength;
    tickPainter.strokeWidth = i % 5 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;

    canvas.drawLine(Offset(0.0, -radius), Offset(0.0, -radius + tickMarkLength), tickPainter);

    if (i % 5 == 0) {
      canvas.save();
      canvas.translate(0.0, -radius + distanceToTick);

      textPainter.text = TextSpan(
        text: '${i == 0 ? 12 : i ~/ 5}',
        style: textStyle,
      );

      // rotate the text to make it horizontally aligned
      canvas.rotate((-angle * i) - angleOffset);
      textPainter.layout();

      textPainter.paint(canvas, Offset(-(textPainter.width / 2), -(textPainter.height / 2)));

      canvas.restore();
    }

    canvas.rotate(angle);
  }
  canvas.restore();
}
