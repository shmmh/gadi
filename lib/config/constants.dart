import 'package:flutter/material.dart';

const hourTickMarkLength = 10.0;
const minuteTickMarkLength = 5.0;
const hourTickMarkWidth = 2.0;
const minuteTickMarkWidth = 1.0;

const minuteFaceWidth = 130.0;
const secondFaceWidth = 175.0;

const distanceToMinuteTick = 28.0;
const distanceToSecondTick = 24.0;

const minuteTextStyle = TextStyle(
  fontFamily: "Koulen",
  fontSize: 32,
  color: Colors.white,
);
const secondTextStyle = TextStyle(
  fontFamily: "Koulen",
  fontSize: 20,
  color: Colors.white,
);
const hourTextStyle = TextStyle(
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
