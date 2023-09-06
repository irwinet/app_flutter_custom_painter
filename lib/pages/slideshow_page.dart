import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
   
  const SlideshowPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if(MediaQuery.of(context).size.height>500){
      isLarge = true;
    }else {
      isLarge = false;
    }
    final children = [
      Expanded(child: MiSlideshow()),
      Expanded(child: MiSlideshow())
    ];

    return Scaffold(
      // backgroundColor: Colors.purple,
      body: (isLarge)
        ? Column(children: children,)
        : Row(children: children,)
    );
  }
}

class MiSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    return Slideshow(
      // puntosArriba: true,
      bulletPrimario : 20,
      bulletSecundario : 12,
      colorPrimario: (appTheme.darkTheme) ? accentColor : Color(0xffFF5A7E),
      // colorSecundario: Colors.white,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg')
      ],
    );
  }
}