import 'package:disenos_app/src/cubits/pinterest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final Color backgroundColor;
  final Color activedColor;
  final Color disabledColor;

  PinterestMenu(
      {super.key,
      this.backgroundColor = Colors.white,
      this.activedColor = Colors.pink,
      this.disabledColor = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PinterestCubit, PinterestState, bool>(
        selector: (state) => state.show,
        builder: (context, show) {
          context.read<PinterestCubit>().updateBackgroundColor(backgroundColor);
          context.read<PinterestCubit>().updateActivedColor(activedColor);
          context.read<PinterestCubit>().updateDisabledColor(disabledColor);
          return AnimatedOpacity(
            duration: Duration(milliseconds: 250),
            opacity: (show) ? 1 : 0,
            child: PinterestMenuBackground(
              child: _MenuItems(
                menu: items,
              ),
            ),
          );
        });
  }
}

class PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const PinterestMenuBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PinterestCubit, PinterestState, Color>(
      selector: (state) => state.backgroundColor,
      builder: (context, state) {
        return Center(
          child: Container(
            width: 250,
            height: 60,
            decoration: BoxDecoration(
                color: state,
                borderRadius: BorderRadius.circular(100),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black38, blurRadius: 10, spreadRadius: -5)
                ]),
            child: child,
          ),
        );
      },
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
    return BlocBuilder<PinterestCubit, PinterestState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () {
          option.onPressed();
          context.read<PinterestCubit>().updateItem(index);
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          padding: EdgeInsets.all(2),
          child: Icon(
            option.icon,
            size: (state.selected == index) ? 30 : 25,
            color: (state.selected == index)
                ? state.activedColor
                : state.disabledColor,
          ),
        ),
      );
    });
  }
}
