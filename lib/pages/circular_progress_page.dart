import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
   
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {

  double porcentaje = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          porcentaje+=10;
          if(porcentaje>100){
            porcentaje=0;
          }

          setState(() {
            
          });
        }
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
           width: 300,
           height: 300,
          //  color: Colors.red,
           child: CustomPaint(
            painter: _MiRadialProgress(porcentaje),
           ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  
  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    

    // TODO: Circulo Completado
    final paint = new Paint()
      ..strokeWidth = 4 // 10
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;
    
    Offset center = new Offset(size.width * 0.5, size.height/2);
    double radio = min(size.width*0.5, size.height*0.5);
    canvas.drawCircle(center, radio, paint);

    // TODO Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.pink
      ..style       = PaintingStyle.stroke;
    
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi/2,
      arcAngle,
      false,
      paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}