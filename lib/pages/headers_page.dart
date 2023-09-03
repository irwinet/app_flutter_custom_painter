import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../widgets/headers.dart';

class HeadersPage extends StatelessWidget {
   
  const HeadersPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      // body: HeaderCuadrado()
      // body: HeaderBordersRedondeados()
      // body: HeaderDiagonal(),
      // body: HeaderTriangular(),
      // body: HeaderPico(),
      //body: HeaderCurvo()
      body: HeaderWaves(
        color: appTheme.colorScheme.secondary,
      ),
      // body: HeaderWavesGradient(),
    );
  }
}