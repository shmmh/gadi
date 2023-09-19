import "dart:async";

import 'package:flutter/material.dart';
import 'package:gadi/features/clock_face/minute_focus.dart';
import "package:gadi/utils/constants.dart";

import '../clock_face/gradient.dart';
import '../clock_face/minute_face.dart';
import '../clock_face/second_face.dart';

// import "package:quiver/async.dart";

class ClockTimer extends StatefulWidget {
  const ClockTimer({
    super.key,
    Size windowSize = Size.zero,
  });

  @override
  State<ClockTimer> createState() => _ClockTimerState();
}

class _ClockTimerState extends State<ClockTimer> {
  late DateTime _dateTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime(2000, 05, 25, 00, 25, 00);
    // _dateTime.add(
    //   const Duration(minutes: 25),
    // );
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _dateTime = _dateTime.subtract(const Duration(seconds: 1));
      // print(_dateTime.toString());
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // CountdownTimer countdownTimer = CountdownTimer(const Duration(minutes: 1), const Duration(seconds: 1));
    // countdownTimer.forEach((el) => print(el.remaining));

    // Paint Second Face first followed by the minute face
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
              onTap: () => print("second tap"), behavior: HitTestBehavior.translucent, child: SecondCustomPaint(second: _dateTime.second)),
          MinuteCustomPaint(minute: _dateTime.minute),
          // HourCustomPaint(hour: _dateTime.hour),
          Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: const Text(
              "focus",
              style: minuteTextStyle,
            ),
          ),
          // const GradientCustomPaint(),
          FocusCustomPaint(
            dateTime: _dateTime,
          ),
        ],
      ),
    );
  }
}
