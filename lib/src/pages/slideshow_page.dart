import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Slideshow(
        topDots: true,
        bulletPrimary: 15,
        bulletSecondary: 10,
        primaryColor: Colors.pink,
        secundaryColor: Colors.grey,
        slides: [
          SvgPicture.asset('assets/svg/slide-1.svg'),
          SvgPicture.asset('assets/svg/slide-2.svg'),
          SvgPicture.asset('assets/svg/slide-3.svg'),
          SvgPicture.asset('assets/svg/slide-4.svg'),
          SvgPicture.asset('assets/svg/slide-5.svg')
        ],
      ),
    );
  }
}
