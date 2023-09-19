import "dart:async";

import 'package:flutter/material.dart';
import 'package:gadi/features/clock_face/hour_face.dart';
import 'package:gadi/features/clock_face/minute_focus.dart';
import "package:gadi/utils/constants.dart";

import 'gradient.dart';
import 'minute_face.dart';
import 'second_face.dart';

// import "package:quiver/async.dart";

class ClockFace extends StatefulWidget {
  const ClockFace({
    super.key,
    Size windowSize = Size.zero,
  });

  @override
  State<ClockFace> createState() => _ClockFaceState();
}

class _ClockFaceState extends State<ClockFace> {
  late DateTime _dateTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _dateTime = _dateTime.add(const Duration(seconds: 1));
      // print(_dateTime.toString());
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // CountdownTimer countdownTimer = CountdownTimer(const Duration(minutes: 1), const Duration(seconds: 1));
    // countdownTimer.forEach((el) => print(el.remaining));

    // Paint Second Face first followed by the minute face
    return Stack(
      alignment: Alignment.center,
      children: [
        SecondCustomPaint(second: _dateTime.second),
        MinuteCustomPaint(minute: _dateTime.minute),
        HourCustomPaint(hour: _dateTime.hour),
        const GradientCustomPaint(),
        FocusCustomPaint(
          dateTime: _dateTime,
        ),
        GestureDetector(
          onVerticalDragUpdate: (details) => print(details),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
              // color: Colors.white,
            ),
          ),
        ),
        GestureDetector(
          onHorizontalDragUpdate: (details) => print("minute"),
          child: Container(
            width: minuteFaceWidth * 2,
            height: minuteFaceWidth * 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
              // color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
