import 'package:flutter/material.dart';

class SliderListPage extends StatelessWidget {
  const SliderListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Titulo(),
    );
  }
}

class _ListaTareas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) => _ListItem(),
    );
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            SizedBox(width: 100,),
            Positioned(
              bottom: 8,
                child: Container(
              width: 150,
              height: 8,
              color: Color(0xfff7cdd5),
            )),
            Text(
              'List',
              style: TextStyle(
                  color: Color(0xffd93a30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(30)),
      child: Text(
        'Orange',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
