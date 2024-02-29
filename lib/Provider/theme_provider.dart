import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {

  ThemeMode theme = ThemeMode.light;

  ThemeMode get themeMode => theme;

  void setTheme(themeMode){
    theme = themeMode;
    notifyListeners();
  }

}
