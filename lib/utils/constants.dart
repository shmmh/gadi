import 'dart:math';

import 'package:flutter/material.dart';

const angle = 2 * pi / 60;

const focusDir = pi / 2;
const hourTickMarkLength = 10.0;
const minuteTickMarkLength = 5.0;
const hourTickMarkWidth = 2.0;
const minuteTickMarkWidth = 1.0;

const minuteFaceWidth = 130.0;
const secondFaceWidth = 175.0;

const distanceToMinuteTick = 28.0;
const distanceToSecondTick = 24.0;

const minuteFocusWidth = 45.0;
const minuteFocusHeight = 94.0;
const minuteFocusBorderRadius = 32.0;
const minuteFocusOffset = secondFaceWidth - hourTickMarkLength - minuteFocusHeight / 2;

const minuteTextOffset = minuteFaceWidth - hourTickMarkLength;
const secondTextOffset = secondFaceWidth - hourTickMarkLength;

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
const minuteFocusTextStyle = TextStyle(
  fontFamily: "Koulen",
  fontSize: 32,
  color: Colors.white,
);
const secondFocusTextStyle = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: "Koulen",
  fontSize: 24,
  color: Colors.white,
);
const hourTextStyle = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: "Koulen",
  fontSize: 100,
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
