import 'package:disenos_app/src/cubits/emergency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconHeader(
        title: 'Haz solicitado',
        subTitle: 'Asistencia Médica',
        icon: FontAwesomeIcons.plus,
        gradient: [
          Color(0xff526bf6),
          Color(0xff67acf2),
        ],
      ),
    );
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final List<Color> gradient;

  const IconHeader({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => EmergencyCubit(gradient: gradient),
        child: Stack(children: <Widget>[
          _IconHeaderBackground(),
          Positioned(
              top: -50,
              left: -70,
              child: FaIcon(
                icon,
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
                title,
                style: TextStyle(fontSize: 20, color: Colors.white70),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              FaIcon(
                icon,
                size: 80,
                color: Colors.white,
              )
            ],
          )
        ]));
  }
}

class _IconHeaderBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<EmergencyCubit, EmergencyState, List<Color>>(
        selector: (state) => state.gradient,
        builder: (context, gradient) {
          return Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: gradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(80))),
          );
        });
  }
}
