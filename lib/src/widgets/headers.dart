

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
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        ),
      ),
    );
  }
}
