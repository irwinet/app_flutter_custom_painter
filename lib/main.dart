// import 'package:app_flutter_custom_painter/pages/animaciones_page.dart';
// import 'package:app_flutter_custom_painter/labs/circular_progress_page.dart';
// import 'package:app_flutter_custom_painter/pages/graficas_circulares_page.dart';
// import 'package:app_flutter_custom_painter/labs/slideshow_page.dart';
// import 'package:app_flutter_custom_painter/retos/cuadro_animado_page.dart';
// import 'package:app_flutter_custom_painter/pages/headers_page.dart';
// import 'package:app_flutter_custom_painter/pages/slideshow_page.dart';
// import 'package:app_flutter_custom_painter/pages/pinterest_page.dart';
// import 'package:app_flutter_custom_painter/pages/emergency_page.dart';
import 'package:app_flutter_custom_painter/models/layout_model.dart';
import 'package:app_flutter_custom_painter/pages/launcher_page.dart';
import 'package:app_flutter_custom_painter/pages/launcher_tablet_page.dart';
import 'package:app_flutter_custom_painter/pages/slider_list_page.dart';
import 'package:app_flutter_custom_painter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (_) => new ThemeChanger(2)),
      ChangeNotifierProvider<LayoutModel>(create: (_) => new LayoutModel())
    ],
    child: MyApp(),
  )
);

// void main() => runApp(
//   ChangeNotifierProvider(
//     create: (_) => new ThemeChanger(2),
//     child: MyApp(),
//   )
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      // home: HeadersPage()
      // home: AnimacionesPage()
      // home: CuadradoAnimadoPage(),
      // home: CircularProgressPage(),
      // home: GraficasCircularesPage(),
      // home: SlideShowPage(),
      // home: SlideshowPage(),
      // home: PinterestPage(),
      // home: EmergencyPage(),
      // home: SliderListPage(),1
      // home: LauncherPage(),
      home: OrientationBuilder(
        builder: (context, orientation) {
          // print('Orientation: $orientation');

          final screenSize = MediaQuery.of(context).size;
          if(screenSize.width > 500){
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }

          // return Container(
          //   child: LauncherPage(),
          // );
        },
      ),
    );
  }
}