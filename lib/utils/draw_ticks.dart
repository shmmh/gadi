import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';

void drawTicks(Canvas canvas, Size size, double radius, Paint tickPainter, TextPainter textPainter, {double angleOffset = 0, bool minute = true}) {
  double tickMarkLength;

  canvas.save();

  TextStyle textStyle = minute ? minuteTextStyle : secondTextStyle;
  double distanceToTick = minute ? distanceToMinuteTick : distanceToSecondTick;
  canvas.rotate(angleOffset);
  canvas.rotate(focusDir);

  for (var i = 0; i < min; i++) {
    tickPainter.strokeWidth = i % 5 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;
    tickMarkLength = i % 5 == 0 ? hourTickMarkLength : minuteTickMarkLength;

    canvas.drawLine(Offset(0.0, -radius), Offset(0.0, -radius + tickMarkLength), tickPainter);

    if (i % 5 == 0) {
      drawText(
        canvas,
        radius,
        distanceToTick,
        textPainter,
        i,
        textStyle,
        angle,
        angleOffset,
        focusDir,
        formattTime(i == 0 ? 0 : i),
      );
    }

    canvas.rotate(-rotDir * angle);
  }
  canvas.restore();
}

void drawText(Canvas canvas, double radius, double distanceToTick, TextPainter textPainter, int i, TextStyle textStyle, double angle,
    double angleOffset, double focusDir, String text) {
  canvas.save();
  canvas.translate(0.0, -radius + distanceToTick);

  textPainter.text = TextSpan(
    text: text,
    style: textStyle,
  );

  // rotate the text to make it horizontally aligned
  canvas.rotate((rotDir * angle * i) - angleOffset - focusDir);
  textPainter.layout();

  textPainter.paint(canvas, Offset(-(textPainter.width / 2), -(textPainter.height / 2)));

  canvas.restore();
}

double rotationAngle(int time) {
  return rotDir * time * 2 * pi / min;
}

String formattTime(int time) {
  return time.toString().padLeft(2, "0");
}
