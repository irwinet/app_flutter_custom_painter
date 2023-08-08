import 'package:app_flutter_custom_painter/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
   
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje+=10;
            if(porcentaje>100){
              porcentaje=0;
            }
          });
        },
      ),
      body: Center(
         child: Container(
          width: 300,
          height: 300,
          // color: Colors.red,
          // child: Text('${porcentaje} %', style: TextStyle(fontSize: 50.0),),
          child: RadialProgress(
            porcentaje: porcentaje,
            colorPrimario: Colors.purple,
            colorSecundario: Colors.orange,
            grosorPrimario: 10,
            grosorSecundario: 4,
          ),
         ),
      ),
    );
  }
}