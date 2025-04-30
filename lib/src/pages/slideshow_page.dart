import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [Expanded(child: _Slides()), _Dots()],
    ));
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
        children: [_Dot(),  _Dot(), _Dot()],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: 12,
      height: 12,
      decoration:
          BoxDecoration(color: Colors.pinkAccent, shape: BoxShape.circle),
    );
  }
}

//SvgPicture.asset('assets/svg/slide-1.svg')
class _Slides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
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
