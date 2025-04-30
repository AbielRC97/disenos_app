import 'package:disenos_app/src/cubits/slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SliderCubit(bulletPrimary: 15, bulletSecondary: 12),
      child: Scaffold(
        body: Column(
          children: [Expanded(child: _Slides()), _Dots()],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_Dot(0), _Dot(1), _Dot(2)],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        Color color = (state.currentPage.round() == index)
            ? Colors.pinkAccent
            : Colors.grey;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      context.read<SliderCubit>().updatePage(pageViewController.page!);
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: [
        _Slide('assets/svg/slide-1.svg'),
        _Slide('assets/svg/slide-2.svg'),
        _Slide('assets/svg/slide-3.svg')
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        height: double.infinity,
        child: SvgPicture.asset(svg));
  }
}
