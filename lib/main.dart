// import 'package:app_flutter_custom_painter/pages/animaciones_page.dart';
// import 'package:app_flutter_custom_painter/labs/circular_progress_page.dart';
// import 'package:app_flutter_custom_painter/pages/graficas_circulares_page.dart';
// import 'package:app_flutter_custom_painter/labs/slideshow_page.dart';
// import 'package:app_flutter_custom_painter/retos/cuadro_animado_page.dart';
// import 'package:app_flutter_custom_painter/pages/headers_page.dart';
import 'package:app_flutter_custom_painter/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      // home: HeadersPage()
      // home: AnimacionesPage()
      // home: CuadradoAnimadoPage(),
      // home: CircularProgressPage(),
      // home: GraficasCircularesPage(),
      // home: SlideShowPage(),
      home: SlideshowPage(),
    );
  }
}