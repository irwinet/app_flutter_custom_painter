import 'package:app_flutter_custom_painter/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_flutter_custom_painter/routes/routes.dart';
import 'package:provider/provider.dart';

import '../models/layout_model.dart';
import '../theme/theme.dart';


class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter - Tablet'),
        backgroundColor: appTheme.currentTheme.colorScheme.secondary,
      ),
      drawer: _MenuPrincipal(),
      // body: _ListaOpciones(),
    body: Row(
      children: [
        Container(
          width: 300,
          height: double.infinity,
          // color: Colors.red,
          child: _ListaOpciones(),
        ),
        Container(
          width: 1,
          height: double.infinity,
          color: appTheme.darkTheme ? Colors.grey : appTheme.currentTheme.colorScheme.secondary,
        ),
        Expanded(
          child: layoutModel.currentPage,
        )
      ],
    ),
   );
  }
}

class _ListaOpciones extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color:appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.colorScheme.secondary,),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.colorScheme.secondary,),
        onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage =  pageRoutes[i].page;
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                // padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar( 
                  backgroundColor: accentColor,                
                  child: Text('IE', style: TextStyle(fontSize: 50),),
                ),
              ),
            ),

            Expanded(
              child: _ListaOpciones(),
            ),

            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor,),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: accentColor,
                value: appTheme.darkTheme, 
                onChanged: (value){
                  appTheme.darkTheme = value;
                }
              ),
            ),

            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: accentColor,),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  activeColor: accentColor,
                  value: appTheme.customTheme, 
                  onChanged: (value){
                    appTheme.customTheme = value;
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}