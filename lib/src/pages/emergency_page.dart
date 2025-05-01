import 'package:disenos_app/src/cubits/emergency_cubit.dart';
import 'package:disenos_app/src/widgets/button_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];
    return Scaffold(
        body: Stack(children: [
      Container(
          margin: EdgeInsets.only(top: 200),
          child: ListView(
            children: [
              SizedBox(
                height: 80,
              ),
              ...items.map((item) => ButtonLarge(
                    icon: item.icon,
                    gradient: [item.color1, item.color2],
                    title: item.texto,
                    onPress: () {
                      print(item.texto);
                    },
                  )),
            ],
          )),
      IconHeader(
        title: 'Haz solicitado',
        subTitle: 'Asistencia Médica',
        icon: FontAwesomeIcons.plus,
        gradient: [
          Color(0xff526bf6),
          Color(0xff67acf2),
        ],
      )
    ]));
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
        create: (_) => EmergencyCubit(gradient: gradient, icon: icon),
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
    return BlocBuilder<EmergencyCubit, EmergencyState>(
        builder: (context, state) {
      return Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: state.gradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80))),
      );
    });
  }
}
