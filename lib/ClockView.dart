import 'dart:async';
import 'dart:math';

import 'package:busyclock/main.dart';
import 'package:flutter/material.dart';

class Clockview extends StatefulWidget {
  @override
  _ClockviewState createState() => _ClockviewState();
}

class _ClockviewState extends State<Clockview> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var datetime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var centerx = size.width / 2;
    var centery = size.height / 2;
    var center = Offset(centerx, centery);
    var radius = min(centerx, centery);

    var fillBrush = Paint()..color = Color(0xFF444974);
    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;

    var centerfillBrush = Paint()..color = Color(0xFFEAECFF);

    var secHandbrush = Paint()
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    var minHandbrush = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Colors.blue, Colors.pink])
          .createShader(Rect.fromCircle(
        center: center,
        radius: radius,
      ))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    var hourHandbrush = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Colors.redAccent, Colors.yellowAccent])
          .createShader(Rect.fromCircle(
        center: center,
        radius: radius,
      ))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    var dashBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Colors.blue, Colors.pink])
          .createShader(Rect.fromCircle(
        center: center,
        radius: radius,
      ))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    var outerCircleRadious = radius;
    var innerCircleRadius = -14;

    for (double i = 0; i < 360; i += 12) {
      var x1 = centerx + outerCircleRadious * cos(i * pi / 180);
      var y1 = centerx + outerCircleRadious * sin(i * pi / 180);

      var x2 = centerx + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerx + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);

      canvas.drawCircle(center, radius - 40, fillBrush);
      canvas.drawCircle(center, radius - 40, outlineBrush);

      var hourHandX = centerx +
          80 * cos(datetime.hour * 30 + datetime.minute * 0.5 * pi / 180);
      var hourHandY = centery + 80 * sin(datetime.hour * 30 * pi / 180);

      canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandbrush);

      var minHandX = centerx + 80 * cos(datetime.minute * 6 * pi / 180);
      var minHandY = centery + 80 * sin(datetime.minute * 6 * pi / 180);

      canvas.drawLine(center, Offset(minHandX, minHandY), minHandbrush);
      var secHandX = centerx + 80 * cos(datetime.second * 6 * pi / 180);
      var secHandY = centery + 80 * sin(datetime.second * 6 * pi / 180);

      canvas.drawLine(center, Offset(secHandX, secHandY), secHandbrush);

      canvas.drawCircle(center, 16, centerfillBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
