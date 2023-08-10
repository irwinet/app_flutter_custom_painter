import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../models/slider_model.dart';

//TODO Delete future
// import 'package:flutter_svg/svg.dart';

class Slideshow extends StatelessWidget {
  
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  Slideshow({
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SliderModel(),
      child: SafeArea(
        child: Center(
             //child: SvgPicture.asset('assets/svgs/slide-1.svg'),
             child: Builder(
              builder: (context) {
                //WidgetsBinding.instance.addPostFrameCallback((_) {
                Provider.of<_SliderModel>(context, listen: false).colorPrimario = this.colorPrimario;
                Provider.of<_SliderModel>(context, listen: false).colorSecundario = this.colorSecundario;

                Provider.of<_SliderModel>(context, listen: false).bulletPrimario = this.bulletPrimario;
                Provider.of<_SliderModel>(context, listen: false).bulletSecundario = this.bulletSecundario;
                //});                
                return _CrearEstructuraSlideshow(puntosArriba: puntosArriba, slides: slides);
              },
            ),
          ),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    super.key,
    required this.puntosArriba,
    required this.slides,
  });

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
     children: <Widget>[
       if(this.puntosArriba) 
         _Dots(this.slides.length),
       Expanded(
         child: _Slides(slides)
       ),              
       if(!this.puntosArriba) 
         _Dots(this.slides.length),
     ],
    );
  }
}

class _Dots extends StatelessWidget {

  final int totalSlides;

  _Dots(this.totalSlides);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index)),
        // children: <Widget>[
        //   _Dot(0),
        //   _Dot(1),
        //   _Dot(2),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    // final pageViewIndex = Provider.of<_SliderModel>(context).currentPage;
    final slideshowModel = Provider.of<_SliderModel>(context);
    double tamano = 0;
    Color color;
    if(slideshowModel.currentPage >= (index - 0.5) && slideshowModel.currentPage<(index+0.5)) {
      tamano = slideshowModel.bulletPrimario;
      color = slideshowModel.colorPrimario;
    }
    else {
      tamano = slideshowModel.bulletSecundario;
      color = slideshowModel.colorSecundario;
    }
    
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {
    // TODO: implement initState    
    super.initState();
    pageViewController.addListener(() {
      // print('Pagian actual ${pageViewController.page}');
      Provider.of<_SliderModel>(context, listen: false).currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      child: PageView(
        controller: pageViewController,
        // children: <Widget>[
        //   _Slide('assets/svgs/slide-1.svg'),
        //   _Slide('assets/svgs/slide-2.svg'),
        //   _Slide('assets/svgs/slide-3.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}


class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color colorPrimario) {
    this._colorPrimario = colorPrimario;
    // notifyListeners();
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color colorSecundario) {
    this._colorSecundario = colorSecundario;
    // notifyListeners();
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double bulletPrimario) {
    this._bulletPrimario = bulletPrimario;
    // notifyListeners();
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double bulletSecundario) {
    this._bulletSecundario = bulletSecundario;
    // notifyListeners();
  }
}