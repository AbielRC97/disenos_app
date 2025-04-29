import 'package:flutter/material.dart';

class GraficsCircularesPage extends StatefulWidget {
  const GraficsCircularesPage({super.key});

  @override
  State<GraficsCircularesPage> createState() => _GraficsCircularesPageState();
}

class _GraficsCircularesPageState extends State<GraficsCircularesPage> {
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
      body: Center(
        child: Text(
          '$porcentage%',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
