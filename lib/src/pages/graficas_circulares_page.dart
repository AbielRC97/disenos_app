import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentage += 10.0;
            if (porcentage > 100) {
              porcentage = 0;
            }
          });
        },
      ),
      body: CustomRadialProgress(
        porcentage: porcentage,
        color: Colors.pinkAccent,
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress(
      {super.key, required this.porcentage, required this.color});

  final double porcentage;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 300,
      height: 300,
      child: RadialProgress(
        percentage: porcentage,
        primaryColor: color,
        secundaryColor: Colors.black87,
      ),
    ));
  }
}
