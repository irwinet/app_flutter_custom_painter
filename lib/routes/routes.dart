import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app_flutter_custom_painter/pages/emergency_page.dart';
import 'package:app_flutter_custom_painter/pages/graficas_circulares_page.dart';
import 'package:app_flutter_custom_painter/pages/headers_page.dart';
import 'package:app_flutter_custom_painter/pages/pinterest_page.dart';
import 'package:app_flutter_custom_painter/pages/slider_list_page.dart';
import 'package:app_flutter_custom_painter/pages/slideshow_page.dart';
import 'package:app_flutter_custom_painter/retos/cuadro_animado_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro Animado', CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra Progreso', GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliderListPage()),
];


class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}