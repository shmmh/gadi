import 'package:flutter/material.dart';
import "package:gadi/config/constants.dart";
import "package:gadi/features/hour_face.dart";
import "package:gadi/features/minute_focus.dart";
import "gradient.dart";
import "minute_face.dart";
import "second_face.dart";

class ClockFace extends StatefulWidget {
  const ClockFace({
    super.key,
    Size windowSize = Size.zero,
  });

  @override
  State<ClockFace> createState() => _ClockFaceState();
}

class _ClockFaceState extends State<ClockFace> {
  @override
  Widget build(BuildContext context) {
    // Paint Second Face first followed by the minute face
    return CustomPaint(
      painter: MinuteFacePainter(),
      child: CustomPaint(
        painter: SecondFacePainter(),
        child: CustomPaint(
          painter: MinuteFocusPainter(),
          child: CustomPaint(
            painter: GradientOverlayPainter(),
            child: Container(
              child: const Center(
                child: Text(
                  "Focus",
                  style: hourTextStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
