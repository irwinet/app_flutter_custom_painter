import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../widgets/headers.dart';

class HeadersPage extends StatelessWidget {
   
  const HeadersPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: HeaderCuadrado()
      // body: HeaderBordersRedondeados()
      // body: HeaderDiagonal(),
      // body: HeaderTriangular(),
      // body: HeaderPico(),
      //body: HeaderCurvo()
      // body: HeaderWaves(),
      body: HeaderWavesGradient(),
    );
  }
}