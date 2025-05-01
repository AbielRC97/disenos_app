import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconHeader(),
    );
  }
}

class IconHeader extends StatelessWidget {
  const IconHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      _IconHeaderBackground(),
      Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 250,
            color: Colors.white12,
          )),
      Column(
        children: [
          SizedBox(
            height: 80,
            width: double.infinity,
          ),
          Text(
            'Haz solicitado',
            style: TextStyle(fontSize: 20, color: Colors.white70),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Asistencia Médica',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          FaIcon(
            FontAwesomeIcons.plus,
            size: 80,
            color: Colors.white,
          )
        ],
      )
    ]);
  }
}

class _IconHeaderBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color(0xff526bf6),
            Color(0xff67acf2),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80))),
    );
  }
}
