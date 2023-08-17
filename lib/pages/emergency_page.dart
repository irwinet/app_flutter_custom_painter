import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/boton_gordo.dart';
import '../widgets/headers.dart';


class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Center(
        child: BotonGordo(
          icon: FontAwesomeIcons.carCrash,
          texto: 'Motor Accident',
          color1: Color(0xff6989F5),
          color2: Color(0xff906EF5),
          onPress: (){ print('Click'); },
        ),
      ),
   );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      titulo: 'Asistencia Médica',
      subtitulo: 'Haz solicitado',
      color1: Color(0xff67ACF2),
      color2: Color(0xff526BF6),
    );
  }
}