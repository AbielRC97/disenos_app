import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color secundaryColor;
  final double strokeWidth;
  const RadialProgress(
      {super.key,
      required this.percentage,
      this.primaryColor = Colors.blue,
      this.secundaryColor = Colors.grey,
      this.strokeWidth = 20});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double prevPorcentage;
  @override
  void initState() {
    prevPorcentage = widget.percentage;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final dif = widget.percentage - prevPorcentage;
    prevPorcentage = widget.percentage;
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext ctx, Widget? child) {
          return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgress(
                  (widget.percentage - dif) + (dif * controller.value),
                  widget.primaryColor,
                  widget.secundaryColor,
                  widget.strokeWidth),
            ),
          );
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  final double procentage;
  final Color primaryColor;
  final Color secundaryColor;
  final double strokeWidth;

  _MiRadialProgress(this.procentage, this.primaryColor, this.secundaryColor,
      this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * .5, size.height * .5);
    final double radius = min(size.width * 0.5, size.height * .5);

    canvas.drawCircle(center, radius, paint);

    final paintArco = Paint()
      ..strokeWidth = strokeWidth * .7
      ..color = primaryColor
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
