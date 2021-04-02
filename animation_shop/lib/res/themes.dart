import 'package:animation_shop/res/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.darkThemeBg,
      colorScheme: ColorScheme.dark(),
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.black,
      ));

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightThemeBg,
    colorScheme: ColorScheme.light(),
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  );
}
