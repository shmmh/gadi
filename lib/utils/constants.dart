import 'dart:math';

import 'package:flutter/material.dart';

const min = 60;

const angle = 2 * pi / min;

const focusDir = pi;
const rotDir = -1;
const hourTickMarkLength = 10.0;
const minuteTickMarkLength = 5.0;
const hourTickMarkWidth = 2.0;
const minuteTickMarkWidth = 1.0;

const minuteFaceWidth = 130.0;
const secondFaceWidth = 175.0;

const distanceToMinuteTick = 28.0;
const distanceToSecondTick = 24.0;

const minuteFocusWidth = 55.0;
const minuteFocusHeight = 100.0;
const minuteFocusBorderRadius = 55.0;
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
  fontSize: 48,
  color: Colors.white,
);
const secondFocusTextStyle = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: "Koulen",
  fontSize: 28,
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
