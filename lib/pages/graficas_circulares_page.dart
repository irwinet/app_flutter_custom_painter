import 'package:app_flutter_custom_painter/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, colors: Colors.blue,),
              CustomRadialProgress(porcentaje: porcentaje * 1.2, colors: Colors.red,),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje * 1.4, colors: Colors.pink,),
              CustomRadialProgress(porcentaje: porcentaje * 1.6, colors: Colors.purple,),
            ],
          )
          
        ],         
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color colors;

  const CustomRadialProgress({
    required this.porcentaje, 
    required this.colors,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
     width: 180,
     height: 180,
     // color: Colors.red,
     // child: Text('${porcentaje} %', style: TextStyle(fontSize: 50.0),),
     child: RadialProgress(
       porcentaje: porcentaje,
       colorPrimario: this.colors,
       colorSecundario: appTheme.textTheme.bodyLarge?.color ?? Colors.grey,
       grosorPrimario: 10,
       grosorSecundario: 4,
     ),
    );
  }
}