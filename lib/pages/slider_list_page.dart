import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';


class SliderListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _Titulo(),
      //body: _ListaTareas(),
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      //   elevation: 0,
      //   title: Text('Hola Mundo'),
      // ),
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BottonNewList()
          )
        ],
      ),
   );
  }
}

class _BottonNewList extends StatelessWidget {
  const _BottonNewList({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: MaterialButton(
        color: (appTheme.darkTheme) ? appTheme.currentTheme.colorScheme.secondary : Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
        onPressed: (){},
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: appTheme.currentTheme.scaffoldBackgroundColor, //Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  
  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola Mundo'),
        // ),

        SliverPersistentHeader(
          floating: true,          
          delegate: _SliverCustomHeaderDelegate(
            minheight: 170,
            maxheight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor, //Colors.white,
              child: _Titulo()
            )
          )
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100,)
          ])
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate  {
  
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minheight,
    required this.maxheight,
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(child: child,);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxheight;

  @override
  // TODO: implement minExtent
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxheight != oldDelegate.maxheight || 
          minheight != oldDelegate.minheight || 
          child != oldDelegate.child;
  }

}

class _Titulo extends StatelessWidget {
  const _Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    
    return Column(
      children: [
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text('New', 
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey : Color.fromARGB(255, 252, 129, 145), 
              fontSize: 50
            ),
          ),
        ),
        Stack(
          children: [   
            SizedBox(width: 100,),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8, 
                color: (appTheme.darkTheme) ? Colors.grey : Color(0XffF7CDD5),
              ),
            ),           
            Container(
              child: Text('List', 
                style: TextStyle(
                  color: Color(0xffD93A30), 
                  fontSize: 50, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
                      
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  
   final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      height: 130,
      alignment: Alignment.centerLeft,
      child: Text(
        this.titulo, 
        style: TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold, 
          fontSize: 20
        ),
      ),
      // width: 100,
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : this.color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}