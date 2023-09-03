import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme; 

  ThemeChanger(int theme){
    switch (theme) {
      case 1: // light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2: // Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3: // CustomTheme
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
    }
  }

  set darkTheme(bool value){
    _customTheme = false;
    _darkTheme = value;
    if(value){
      _currentTheme = ThemeData.dark();
    }
    else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customTheme(bool value){
    _customTheme = value;
    _darkTheme = false;
    if(value){
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: ThemeData.dark().colorScheme.copyWith(secondary: Colors.yellow),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white)
        )
      );
    }
    else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}