import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;
  const RadialProgress({super.key, this.percentage});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Text('${widget.percentage}');
  }
}
