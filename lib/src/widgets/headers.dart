import 'package:flutter/material.dart';

class HeadersCuadrado extends StatelessWidget {
  const HeadersCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0XFF615AAb),
    );
  }
}

class HeadersBordesRendondeados extends StatelessWidget {
  const HeadersBordesRendondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xFF615AAB), // Color aquí dentro
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
      ),
    );
  }
}

class HeadersDiagonal extends StatelessWidget {
  const HeadersDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeadersDiagonalPainter(),
      ),
    );
  }
}

class _HeadersDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades
    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();
    // Dibujar en el path
    path.moveTo(0, size.height * .35);
    path.lineTo(size.width, size.height * .20);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeadersTriangular extends StatelessWidget {
  const HeadersTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeadersTriangularPainter(),
      ),
    );
  }
}

class _HeadersTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades
    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();
    // Dibujar en el path
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeadersPiramide extends StatelessWidget {
  const HeadersPiramide({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeadersPiramidePainter(),
      ),
    );
  }
}

class _HeadersPiramidePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades
    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    // Dibujar en el path
    path.lineTo(0, size.height * .30);
    path.lineTo(size.width * .5, size.height * .40);
    path.lineTo(size.width, size.height * .30);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeadersCurva extends StatelessWidget {
  const HeadersCurva({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeadersCurvaPainter(),
      ),
    );
  }
}

class _HeadersCurvaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades
    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    // Dibujar en el path
    path.lineTo(0, size.height * .20);
    path.quadraticBezierTo(
        size.width * .50, size.height * .35, size.width, size.height * .20);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeadersWaves extends StatelessWidget {
  const HeadersWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeadersWavesPainter(),
      ),
    );
  }
}

class _HeadersWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades
    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    // Dibujar en el path
    path.lineTo(0, size.height * .20);
    path.quadraticBezierTo(size.width * .25, size.height * .30,
        size.width * .50, size.height * .20);

    path.quadraticBezierTo(
        size.width * .75, size.height * .10, size.width, size.height * .20);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeadersWavesGradient extends StatelessWidget {
  const HeadersWavesGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeadersWavesGradientPainter(),
      ),
    );
  }
}

class _HeadersWavesGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: Offset(165, 165), radius: 180);
    final Gradient gradient = LinearGradient(colors: <Color>[
      Color(0xff6D05e8),
      Color(0xffc012FF),
      Color(0xff6D05FA),
    ],begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [
      0.25,
      0.5,
      1.0
    ]);
    final paint = Paint()..shader = gradient.createShader(rect);

    //Propiedades
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    // Dibujar en el path
    path.lineTo(0, size.height * .20);
    path.quadraticBezierTo(size.width * .25, size.height * .30,
        size.width * .50, size.height * .20);

    path.quadraticBezierTo(
        size.width * .75, size.height * .10, size.width, size.height * .20);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
