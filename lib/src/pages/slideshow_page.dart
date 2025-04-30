import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _Slides(),
      ),
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
