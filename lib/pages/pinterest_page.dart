import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
       
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      // body: PinterestGrid(),
      // body: PinterestMenu(),
      body: Stack(
        children: <Widget>[
          PinterestGrid(),
          _PinterestMenuLocation(),
        ],
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final widthPantalla = MediaQuery.of(context).size.width;
    
    return Positioned(
      bottom: 30,
      child: Container(
        //color: Colors.red,
        // height: 100,
        width: widthPantalla,
        child: Align(
          //alignment: Alignment.bottomRight,
          child: PinterestMenu(),
        ),
      )
    );
  }
}

class PinterestGrid extends StatelessWidget {

  final List<int> item = List.generate(200, (index) => index);

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: item.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
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