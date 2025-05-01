import 'package:disenos_app/src/cubits/emergency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonLarge extends StatelessWidget {
  final List<Color> gradient;
  final String title;
  final Function onPress;
  final IconData icon;
  const ButtonLarge(
      {super.key,
      required this.gradient,
      required this.title,
      required this.onPress,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmergencyCubit(gradient: gradient),
      child: GestureDetector(
        onTap: () => onPress(),
        child: Stack(children: [
          _ButtonLargeBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              SizedBox(
                width: 40,
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class _ButtonLargeBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<EmergencyCubit, EmergencyState, List<Color>>(
      selector: (state) {
        return state.gradient;
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(4, 6),
                    blurRadius: 10),
              ],
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: state)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                Positioned(
                    right: -20,
                    top: -20,
                    child: FaIcon(
                      FontAwesomeIcons.carCrash,
                      size: 150,
                      color: Colors.white12,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
