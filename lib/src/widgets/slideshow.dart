import 'package:disenos_app/src/cubits/slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool topDots;
  final Color primaryColor;
  final Color secundaryColor;
  const Slideshow(
      {super.key,
      required this.slides,
      this.topDots = false,
      this.primaryColor = Colors.pinkAccent,
      this.secundaryColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SliderCubit(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (topDots) _Dots(slides.length, primaryColor, secundaryColor),
              Expanded(child: _Slides(slides)),
              if (!topDots) _Dots(slides.length, primaryColor, secundaryColor),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalItems;
  final Color primaryColor;
  final Color secundaryColor;
  const _Dots(this.totalItems, this.primaryColor, this.secundaryColor);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalItems, (index) => _Dot(index, primaryColor, secundaryColor)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color primaryColor;
  final Color secundaryColor;
  const _Dot(this.index, this.primaryColor, this.secundaryColor);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, double>(
      builder: (context, currentPage) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color:
                (currentPage.round() == index) ? primaryColor : secundaryColor,
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
