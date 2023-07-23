import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
   
  const HeaderCuadrado({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordersRedondeados extends StatelessWidget {
   
  const HeaderBordersRedondeados({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,      
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        )
      ),
    );
  }
}