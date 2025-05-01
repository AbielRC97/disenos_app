import 'package:flutter/material.dart';

class PinterestButon {
  final Function onPressed;
  final IconData icon;

  PinterestButon({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButon> items = [
    PinterestButon(
        onPressed: () {
          print('pie_chart');
        },
        icon: Icons.pie_chart),
    PinterestButon(
        onPressed: () {
          print('search');
        },
        icon: Icons.search),
    PinterestButon(
        onPressed: () {
          print('notifications');
        },
        icon: Icons.notifications),
    PinterestButon(
        onPressed: () {
          print('supervised_user_circle');
        },
        icon: Icons.supervised_user_circle),
  ];

  PinterestMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PinterestMenuBackground(
      child: _MenuItems(
        menu: items,
      ),
    );
  }
}

class PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const PinterestMenuBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
            ]),
        child: child,
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButon> menu;
  const _MenuItems({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menu.length,
          (i) => _PinterestMenuButton(
                index: i,
                option: menu[i],
              )),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButon option;
  const _PinterestMenuButton({required this.index, required this.option});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => option.onPressed(),
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.all(2),
        child: Icon(
          option.icon,
          size: 25,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
