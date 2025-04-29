import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double procentage = 0.0;
  double changeProcentage = 0.0;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    controller.addListener(() {
      setState(() {
        procentage =
            lerpDouble(procentage, changeProcentage, controller.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                procentage = changeProcentage;
                changeProcentage += 10.0;

                if (changeProcentage > 100) {
                  changeProcentage = 0;
                  procentage = 0;
                }
                controller.forward(from: 0.0);
              });
            }),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            padding: EdgeInsets.all(5),
            child: CustomPaint(
              painter: _MiRadialProgress(procentage),
            ),
          ),
        ));
  }
}

class _MiRadialProgress extends CustomPainter {
  final double procentage;

  _MiRadialProgress(this.procentage);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * .5, size.height * .5);
    final double radius = min(size.width * 0.5, size.height * .5);

    canvas.drawCircle(center, radius, paint);

    final paintArco = Paint()
      ..strokeWidth = 5
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (procentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
