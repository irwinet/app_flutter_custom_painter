import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/slider_model.dart';

//TODO Delete future
// import 'package:flutter_svg/svg.dart';

class Slideshow extends StatelessWidget {
  
  final List<Widget> slides;

  Slideshow({required this.slides});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Center(
           //child: SvgPicture.asset('assets/svgs/slide-1.svg'),
           child: Column(
            children: <Widget>[
              Expanded(
                child: _Slides(slides)
              ),
              _Dots(this.slides.length)
            ],
           ),
        ),
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
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= (index - 0.5) && pageViewIndex<(index+0.5)) 
                  ? Colors.blue : Colors.grey,
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
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;
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