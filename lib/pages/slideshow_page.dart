import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
   
  const SlideshowPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Slideshow(
        // puntosArriba: true,
        bulletPrimario : 20,
        bulletSecundario : 12,
        colorPrimario: Colors.black,
        colorSecundario: Colors.white,
        slides: <Widget>[
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg')
        ],
      ),
    );
  }
}