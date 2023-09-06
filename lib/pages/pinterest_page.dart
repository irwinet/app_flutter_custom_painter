import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
       
  @override
  Widget build(BuildContext context) {    
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        // body: PinterestGrid(),
        // body: PinterestMenu(),
        body: Stack(
          children: <Widget>[
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (widthPantalla > 500){
      widthPantalla = widthPantalla - 300;
    }

    return Positioned(
      bottom: 30,
      child: Container(
        //color: Colors.red,
        // height: 100,
        width: widthPantalla,
        child: Row(
          children: [
            Spacer(),
            PinterestMenu(
              mostrar: mostrar,
              items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: () { print('Icon pie_chart'); }),
                PinterestButton(icon: Icons.search, onPressed: () { print('Icon search'); }),
                PinterestButton(icon: Icons.notifications, onPressed: () { print('Icon notifications'); }),
                PinterestButton(icon: Icons.supervised_user_circle, onPressed: () { print('Icon supervised_user_circle'); }),
              ],
              backgroundColor: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.colorScheme.secondary,
              // inactiveColor: Colors.blue,
            ),
            Spacer(),
          ],
        ),
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> item = List.generate(200, (index) => index);

  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      // print('Scroll Listener ${controller.offset}');
      
      if(controller.offset > scrollAnterior && controller.offset > 150){
        print('Ocultar menu');
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      }
      else {
        print('Mostrar menu');
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;
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
    int count;
    if(MediaQuery.of(context).size.width > 500){
      count = 3;    
    } else {
      count = 2;
    }
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: item.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
          // new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(     
        margin: EdgeInsets.all(5),   
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar (bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
}