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
