import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
   
  const AnimacionesPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{
  
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;

  @override
  void initState() {
    // TODO: implement initState
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000)
    );

    rotacion = Tween(
      begin: 0.0,
      end: 2 * Math.pi
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    opacidad = Tween(
      begin: 0.1,
      end: 1.0
    ).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );

    controller.addListener(() {
      print('Status: '+controller.status.toString());
      if(controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.reset();
      }
      // else if (controller.status == AnimationStatus.dismissed){
      //   controller.forward();
      // }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Play
    controller.forward();
    // controller.repeat();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        print('rotacion: '+ rotacion.value.toString());
        return Transform.rotate(
          angle: rotacion.value,
          child: Opacity(
            opacity: opacidad.value,
            child: childRectangulo,
          )
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build( BuildContext context ) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.indigo
      ),
    );
  }
}