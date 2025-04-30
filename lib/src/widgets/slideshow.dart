import 'package:disenos_app/src/cubits/slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool topDots;
  final Color primaryColor;
  final Color secundaryColor;

  final double bulletPrimary;
  final double bulletSecondary;
  const Slideshow(
      {super.key,
      required this.slides,
      this.bulletPrimary = 12,
      this.bulletSecondary = 12,
      this.topDots = false,
      this.primaryColor = Colors.pinkAccent,
      this.secundaryColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SliderCubit(
          primaryColor: primaryColor,
          secondaryColor: secundaryColor,
          bulletPrimary: bulletPrimary,
          bulletSecondary: bulletSecondary),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (topDots)
                _Dots(
                  slides.length,
                ),
              Expanded(child: _Slides(slides)),
              if (!topDots)
                _Dots(
                  slides.length,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalItems;
  const _Dots(this.totalItems);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalItems, (index) => _Dot(index)),
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
        Color color =
            (state.currentPage >= index - .5 && state.currentPage < index + .5)
                ? state.primaryColor
                : state.secondaryColor;
        double width =
            (state.currentPage >= index - .5 && state.currentPage < index + .5)
                ? state.bulletPrimary
                : state.bulletSecondary;
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: width,
          height: width,
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
  final List<Widget> slides;
  const _Slides(this.slides);
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
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        height: double.infinity,
        child: slide);
  }
}
