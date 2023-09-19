import 'package:flutter/material.dart';

const hourTickMarkLength = 10.0;
const minuteTickMarkLength = 5.0;
const hourTickMarkWidth = 2.0;
const minuteTickMarkWidth = 1.0;

const minuteFaceWidth = 130.0;
const secondFaceWidth = 175.0;

const distanceToMinuteTick = 28.0;
const distanceToSecondTick = 24.0;

const minuteFocusWidth = 45.0;
const minuteFocusHeight = 90.0;
const minuteFocusBorderRadius = 32.0;
const minuteFocusOffset = secondFaceWidth - hourTickMarkLength - minuteFocusHeight / 2;

const minuteTextOffset = minuteFaceWidth - hourTickMarkLength - 15;
const secondTextOffset = secondFaceWidth - hourTickMarkLength - 15;

const minuteTextStyle = TextStyle(
  fontFamily: "Koulen",
  fontSize: 28,
  color: Colors.white,
);
const secondTextStyle = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: "Koulen",
  fontSize: 20,
  color: Colors.white,
);
const hourTextStyle = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: "Koulen",
  fontSize: 48,
  color: Colors.white,
);

var tickPainter = Paint()
  ..color = Colors.white
  ..style = PaintingStyle.stroke
  ..strokeCap = StrokeCap.round;
var textPainter = TextPainter(
  textAlign: TextAlign.center,
  textDirection: TextDirection.rtl,
);
